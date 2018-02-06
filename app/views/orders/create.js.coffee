$("<%= j(render @order) %>").appendTo("#orders")
$('.simple_form')[0].reset()
Materialize.toast("<%= t('order.created') %>", 3000, 'rounded')