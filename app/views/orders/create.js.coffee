$("<%= j(render @order) %>").appendTo("#active_orders")
$('.simple_form')[0].reset()
Materialize.toast("<%= t('order.created') %>", 3000, 'rounded')