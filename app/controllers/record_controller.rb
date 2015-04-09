class RecordController < ApplicationController
  before_action :authenticate_user!

  def index
    @templates = Template.where.not(pattern: '')
    return unless params[:template].present? && params[:date].present?
    template = Template.id_is(params[:template])

    date = Date.strptime(params[:date], '%y / %m / %d')
    date_str = date.strftime('%y%m%d')
    documents = Document.publish.search_title(template.name).search_title(date_str).includes(:users).order('users.grade desc', 'users.account asc')

    attends = {}
    outline_str = ''
    date_str = date.strftime("%Y.%m.%d(#{%w(日 月 火 水 木 金 土)[date.wday]})")

    documents.each do |document|
      user = document.users.first
      family_name = user.name.split(' ').first

      attends[user.grade] = [] unless attends[user.grade]
      attends[user.grade] << family_name

      outline = document.markdown.match(/#{template.pattern}/)[1]
      outline_str += "○ #{family_name}\n\n#{outline}\n\n"
    end

    attend_str = ''
    attends.each do |grade, names|
      attend_str += "○ #{Grade::TEXT[grade]} #{names.join('、')}\n"
    end

    @record = "□ #{template.name}議事録 #{date_str}\n\n● 出席\n\n#{attend_str}\n● 活動概要\n\n#{outline_str}".chomp
  end
end
