$("<%= j(render partial: 'form', object: @shipment) %>").appendTo("#modal_empty")
$('select').material_select()
Materialize.updateTextFields()
datepicker_init()
$('#modal_empty').modal('open')