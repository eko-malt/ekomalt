$("<%= j(render partial: 'form', object: @provider) %>").appendTo("#modal .modal-content")
Materialize.updateTextFields()
$('#modal').modal('open')