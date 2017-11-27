$('ul.tabs').tabs('select_tab', 'tab_grain');
$("<%= j(render @grain_input) %>").appendTo("#tab_grain")
$('.simple_form')[0].reset()
Materialize.toast("<%= t('input.created') %>", 3000, 'rounded')
