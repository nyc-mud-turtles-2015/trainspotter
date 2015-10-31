module ViewHelper

  def belongs_to_current_user?(object)
    current_user == object.curator
  end

end
