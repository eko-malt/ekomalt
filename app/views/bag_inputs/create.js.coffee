$('ul.tabs').tabs('select_tab', 'tab_bags');
$("<%= j(render @bag_input) %>").appendTo("#bag_month_<%= @bag_input.date.strftime('%B') %>")
$('.simple_form')[1].reset()
Materialize.toast("<%= t('input.created') %>", 3000, 'rounded')