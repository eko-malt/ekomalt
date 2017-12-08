$('ul.tabs').tabs('select_tab', 'tab_grain');
console.log("#grain_month_<%= @grain_input.date.strftime('%B') %>")
$("<%= j(render @grain_input) %>").appendTo("#grain_month_<%= @grain_input.date.strftime('%B') %>")
$('.simple_form')[0].reset()
Materialize.toast("<%= t('input.created') %>", 3000, 'rounded')
