class InboxController < ApplicationController
  include Mandrill::Rails::WebHookProcessor
  YourMailer.email_name.deliver

  def handle_inbound(event_payload)
    Item.save_inbound_mail(event_payload)
  end
end
