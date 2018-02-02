$("<%= j(render @client) %>").appendTo("#clients")
$('.simple_form')[0].reset()
Materialize.toast("<%= t('client.created') %>", 3000, 'rounded')