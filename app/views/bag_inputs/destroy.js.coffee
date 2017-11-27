$("#bag_input_<%= @bag_input.id %>").fadeOut(500, -> $(@).remove())
Materialize.toast("<%= t('input.deleted') %>", 3000, 'rounded')