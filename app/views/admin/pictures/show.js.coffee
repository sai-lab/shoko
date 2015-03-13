$('.uk-modal').html('<%= escape_javascript(render partial: "admin/pictures/modal", locals: { picture: @picture }) %>')
UIkit.modal('.uk-modal').show()
