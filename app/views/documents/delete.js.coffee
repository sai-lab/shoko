$('.uk-modal').html('<%= escape_javascript(render partial: "documents/delete", locals: { document: @document }) %>')
UIkit.modal('.uk-modal').show()
