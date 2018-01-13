$("<%= j(render 'form_finished') %>").appendTo("#modal_edit")
datepicker_init()
timepicker_init()
$('#modal_edit').modal('open')