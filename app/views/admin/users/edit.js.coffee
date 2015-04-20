$('.uk-modal').html('<%= escape_javascript(render partial: "admin/users/form", locals: { user: @user, title: @user.account }) %>')
UIkit.modal('.uk-modal').show()
