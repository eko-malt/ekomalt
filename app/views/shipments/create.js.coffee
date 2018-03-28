$('#modal_empty').modal('close')
$("#order_item_<%= @shipment.order_item.id %>").replaceWith("<%= j(render partial: 'order_items/order_item', object: @shipment.order_item) %>")
Materialize.toast("<%= t('shipment.created') %>", 3000, 'rounded')