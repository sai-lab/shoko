title = $('#document_title').val()
if title == ''
  $('#document_title').val('<%= @template.title %>')
else
  $('#document_title').val("#{title} <%= @template.title %>")
markdown = $('#document_markdown').val()
editor = $('.CodeMirror')[0].CodeMirror
if markdown == ''
  editor.setValue('<%= raw escape_javascript(@template.markdown) %>')
else
  editor.setValue("#{markdown}\n<%= escape_javascript @template.markdown %>")
