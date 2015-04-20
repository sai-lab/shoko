$('.uk-modal').html('<%= escape_javascript(render partial: "admin/users/form", locals: { user: @user, title: "ユーザー作成"}) %>')
UIkit.modal('.uk-modal').show()
