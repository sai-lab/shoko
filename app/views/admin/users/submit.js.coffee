<% if @user.errors.empty? %>
  location.reload true
<% else %>
  $('.uk-form-width-medium' ).removeClass('has-error')
  $('.uk-form-help-block').empty()
  <% if @user.errors.messages[:account] %>
  $('#user_account').addClass('uk-form-danger')
  $('#user-account-error').html('<%= escape_javascript(render partial: "error/form", locals: { label: "アカウント", messages: @user.errors.messages[:account] }) %>')
  <% end %>
  <% if @user.errors.messages[:name] %>
  $('#user_name').addClass('uk-form-danger')
  $('#user-name-error').html('<%= escape_javascript(render partial: "error/form", locals: { label: "名前", messages: @user.errors.messages[:name] }) %>')
  <% end %>
  <% if @user.errors.messages[:password] %>
  $('#user_password').addClass('uk-form-danger')
  $('#user-password-error').html('<%= escape_javascript(render partial: "error/form", locals: { label: "パスワード", messages: @user.errors.messages[:password] }) %>')
  <% end %>
  <% if @user.errors.messages[:password_confirmation] %>
  $('#user_password_confirmation').addClass('uk-form-danger')
  $('#user-password-15~confirmation-error').html('<%= escape_javascript(render partial: "error/form", locals: { label: "確認のパスワード", messages: @user.errors.messages[:password_confirmation] }) %>')
  <% end %>
<% end %>
