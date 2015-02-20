title = $('#document_title').val()
$('#document_title').val "#{title} <%= @template.title %>"

markdown = $('#document_markdown').val()
editor = $('.CodeMirror')[0].CodeMirror
editor.setValue "#{markdown}\n<%= escape_javascript @template.markdown %>"
