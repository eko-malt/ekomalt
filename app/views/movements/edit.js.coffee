$("<%= j(render partial: 'form_edit', object: @movement) %>").appendTo("#modal .modal-content")
$('select').material_select()
Materialize.updateTextFields()
$('#modal').modal('open')