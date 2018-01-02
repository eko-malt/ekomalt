$("<%= j(render 'form') %>").appendTo("#modal .modal-content")
datepicker_init
timepicker_init
$('#modal').modal('open')
