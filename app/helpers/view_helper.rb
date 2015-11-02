module ViewHelper

  def belongs_to_current_user?(object)
    current_user == object.curator
  end

  def has_pending_observations?(collection)
    !collection.pending_observations.empty?
  end

  def has_approved_observations?(collection)
    !collection.approved_observations.empty?
  end

  def current_user_can_add?(collection)
    current_user.can_create?(collection) || collection.owned_by?(current_user) || current_user.admin?(collection)
  end

end
