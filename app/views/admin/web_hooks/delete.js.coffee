$('.uk-modal').html('<%= escape_javascript(render partial: "admin/web_hooks/delete", locals: { web_hook: @web_hook }) %>')
UIkit.modal('.uk-modal').show()
