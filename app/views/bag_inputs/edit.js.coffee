$("<%= j(render partial: 'form_edit', object: @bag_input) %>").appendTo("#modal_edit_inputs")
Materialize.updateTextFields()
datepicker_init()
$('select').material_select()
$('#modal_edit_inputs ').modal('open')