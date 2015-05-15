<% if @user.errors.empty? %>
  location.reload(true)
<% else %>
  $('[id^=user_]' ).removeClass('uk-form-danger')
  $('.uk-form-help-block').empty()
  <% if @user.errors.messages[:email] %>
  $('#user_email').addClass('uk-form-danger')
  $('#user-email-error').html('<%= escape_javascript(render partial: "error/form", locals: { label: "メールアドレス", messages: @user.errors.messages[:email] }) %>')
  <% end %>
  <% if @user.errors.messages[:name] %>
  $('#user_name').addClass('uk-form-danger')
  $('#user-name-error').html('<%= escape_javascript(render partial: "error/form", locals: { label: "名前", messages: @user.errors.messages[:name] }) %>')
  <% end %>
  <% if @user.errors.messages[:grade] %>
  $('#user_grade').addClass('uk-form-danger')
  $('#user-grade-error').html('<%= escape_javascript(render partial: "error/form", locals: { label: "学年", messages: @user.errors.messages[:grade] }) %>')
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
