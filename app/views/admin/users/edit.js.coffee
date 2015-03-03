$('.uk-modal').html( '<%= escape_javascript(render partial: "admin/users/form", locals: { user: @user, title: @user.account, caption: "Update" }) %>' )
UIkit.modal('.uk-modal').show()
