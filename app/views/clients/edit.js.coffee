$("<%= j(render partial: 'form') %>").appendTo("#modal")
Materialize.updateTextFields()
$('#modal').modal('open')