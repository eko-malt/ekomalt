$("<%= j(render @shipment) %>").appendTo("#shipments")
$('.simple_form')[0].reset()
$('.collapsible').collapsible('open', 1);
Materialize.toast("<%= t('shipment.created') %>", 3000, 'rounded')