$("<%= j(render @provider) %>").appendTo("#<%= @provider.gtype %>-list")
$('.simple_form')[0].reset()
Materialize.toast("<%= t('provider.created') %>", 3000, 'rounded')