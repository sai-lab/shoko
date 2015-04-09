<% if @result %>
  location.href = '/templates/<%= @template.id %>'
<% else %>
  UIkit.notify { message: '名前とタイトル、本文を入力してください。', timeout: 3000, status  : 'danger' }
<% end %>
