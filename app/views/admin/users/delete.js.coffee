$('.uk-modal').html('<%= escape_javascript(render partial: "admin/users/delete", locals: { user: @user }) %>')
UIkit.modal('.uk-modal').show()
