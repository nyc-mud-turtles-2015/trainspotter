module ViewHelper

  def belongs_to_current_user?(object)
    current_user == object.curator
  end

  def collection_image?(coll)
    if coll.approved_observations.first
      if coll.approved_observations.first.image_file_name.present?
        return true
      end
    end
    return false
  end

  def collection_thumb_image(coll)
    coll.approved_observations.first.image.url(:thumb)
  end


  def stat_view_helper(number, singular_noun)
    if number == 1
     return number.to_s + " " + singular_noun
    else
     return number.to_s + " " + singular_noun + "s"
    end
  end

  def collection_description?(coll)
    if coll.description.present?
      return true
    end
  end

  def select_visible(array, user)
    array.select { |c| c.public? || c.owned_by?(user) }
  end

end
