$(".modal-content").html = ''
$("<%= j(render partial: 'grain_details', object: @grain_input) %>").appendTo("#modal .modal-content")
$('#modal').modal('open');