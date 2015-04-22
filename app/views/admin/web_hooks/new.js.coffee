$('.uk-modal').html('<%= escape_javascript(render partial: "admin/web_hooks/form", locals: { web_hook: @web_hook, title: "WebHook作成"}) %>')
UIkit.modal('.uk-modal').show()
