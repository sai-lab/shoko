$('.uk-modal').html('<%= escape_javascript(render partial: "admin/web_hooks/form", locals: { web_hook: @web_hook, title: "WebHook編集" }) %>')
UIkit.modal('.uk-modal').show()
