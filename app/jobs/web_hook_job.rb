class WebHookJob < ActiveJob::Base
  queue_as :web_hook

  def perform(user_id, document_id, action)
    user = User.id_is user_id
    document = Document.id_is document_id
    routes = Rails.application.routes.url_helpers
    action = {
      'create' => '作成',
      'update' => '更新'
    }[action]

    attachment = {}
    attachment[:fallback] = "#{user.name.split(' ').first}さんが「#{document.title}」を#{action}しました。"
    attachment[:title] = attachment[:fallback]
    attachment[:title_link] = routes.document_url document_id, host: `hostname -f`.chomp
    attachment[:text] = document.markdown.gsub(/!\[.+\]\(.+\)/, '').gsub(/\[(.+)\]\((.+)\)/, '<$2|$1>')
    attachment[:color] = '#9c9990'
    attachment[:mrkdwn_in] = ['text']

    images = document.markdown.match(/!\[.+\]\((.+)\)/)
    attachment[:image_url] = images[1] if images

    payload = {}
    payload[:username] = '書庫'
    payload[:icon_emoji] = ':memo:'
    payload[:attachments] = [attachment]

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
