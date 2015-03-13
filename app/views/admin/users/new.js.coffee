$('.uk-modal').html('<%= escape_javascript(render partial: "admin/users/form", locals: { user: @user, title: "New User", caption: "Create" }) %>')
UIkit.modal('.uk-modal').show()
