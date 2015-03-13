$('.uk-modal').html('<%= escape_javascript(render partial: "admin/documents/modal", locals: { document: @document }) %>')
UIkit.modal('.uk-modal').show()
