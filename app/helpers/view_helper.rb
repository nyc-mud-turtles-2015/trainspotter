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
end
