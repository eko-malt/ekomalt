$("<%= j(render partial: 'form') %>").appendTo("#modal_empty")
Materialize.updateTextFields()
$('select').material_select()
$('#modal_empty').modal('open')