$("<%= j(render partial: 'form_create', object: @batch) %>").appendTo("#modal_empty")
Materialize.updateTextFields()
datepicker_init()
on_change_grain_batch_malt_id()
on_change_grain_batch_other_druing()
$('select').material_select()
$('#modal_empty').modal('open')