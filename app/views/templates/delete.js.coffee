$('.uk-modal').html('<%= escape_javascript(render partial: "templates/delete", locals: { template: @template }) %>')
UIkit.modal('.uk-modal').show()
