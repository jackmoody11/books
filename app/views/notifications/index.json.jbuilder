json.array! @notifications do |notification|
  json.id notification.id
  # Consider making first_name required
  json.actor notification.actor.first_name
  json.action notification.action
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url conversation_path(notification.notifiable.conversation, anchor: dom_id(notification.notifiable))
end
