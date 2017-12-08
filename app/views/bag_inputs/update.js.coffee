$('#modal').modal('close')
$("#bag_input_<%= @bag_input.id %>").replaceWith("<%= j(render @bag_input) %>")
Materialize.toast("<%= t('input.updated') %>", 3000, 'rounded')