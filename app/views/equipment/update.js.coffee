Materialize.toast("<%= t('settings.saved') %>", 3000, 'rounded')
$("#equipment_<%= @equipment.id %>").replaceWith("<%= j(render partial: 'pages/equipment', object: @equipment ) %>") if "<%=request.env["HTTP_REFERER"].split('/').last %>" == 'old_maltose'
