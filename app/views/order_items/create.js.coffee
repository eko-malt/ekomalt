$("<%= j(render @order_item) %>").appendTo("#order_items")
$('.simple_form')[0].reset()
Materialize.toast("<%= t('order_item.created') %>", 3000, 'rounded')