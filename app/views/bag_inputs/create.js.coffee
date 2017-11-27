$('ul.tabs').tabs('select_tab', 'tab_bags');
$("<%= j(render @bag_input) %>").appendTo("#tab_bags")
$('.simple_form')[1].reset()
Materialize.toast("<%= t('input.created') %>", 3000, 'rounded')