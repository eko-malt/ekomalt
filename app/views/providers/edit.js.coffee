$("<%= j(render partial: 'form', object: @provider) %>").appendTo("#modal .modal-content")
$(':radio:not(:checked)').attr('disabled', true);
Materialize.updateTextFields()
$('#modal').modal('open')