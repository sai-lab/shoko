$('.uk-modal').html('<%= escape_javascript(render partial: "admin/pictures/delete", locals: { picture: @picture }) %>')
UIkit.modal('.uk-modal').show()
