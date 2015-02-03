<% if @document.errors.empty? %>
  location.href = '/documents/<%= @document.id %>'
<% else %>
  UIkit.notify { message: 'タイトルと本文を入力してください。', timeout: 3000, status  : 'danger' }
<% end %>
