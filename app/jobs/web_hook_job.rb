class WebHookJob < ActiveJob::Base
  queue_as :web_hook

  def perform(user_id, document_id, action)
    user = User.id_is user_id
    document = Document.id_is document_id
    routes = Rails.application.routes.url_helpers

    payload = {}
    payload[:user] = user
    payload[:document] = document
    payload[:action] = action
    payload[:url] = routes.document_url document_id, host: `hostname -f`.chomp
    payload = payload.to_json

    WebHook.all.each do |web_hook|
      uri = URI.parse web_hook.url
      http = Net::HTTP.new uri.host, uri.port
      http.use_ssl = true if web_hook.url.include? 'https'

      request = Net::HTTP::Post.new uri.request_uri
      request['Content-Type'] = 'application/json'
      request.body = payload

      http.request request
    end
  end
end
