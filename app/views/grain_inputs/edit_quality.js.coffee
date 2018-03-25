$("<%= j(render partial: 'form_quality') %>").appendTo("#modal_empty")
Materialize.updateTextFields()
$('#modal_empty').modal('open')