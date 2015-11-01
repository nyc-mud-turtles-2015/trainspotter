module ViewHelper

  def belongs_to_current_user?(object)
    current_user == object.curator
  end

  def has_pending_observations?(collection)
    !collection.pending_observations.empty?
  end

end
