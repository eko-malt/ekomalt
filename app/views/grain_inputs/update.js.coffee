$('#modal').modal('close')
$("#grain_input_<%= @grain_input.id %>").replaceWith("<%= j(render @grain_input) %>")
Materialize.toast("<%= t('input.updated') %>", 3000, 'rounded')