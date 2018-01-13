Turbolinks.visit("<%= raw_process_path(@process) %>") if "<%=request.env["HTTP_REFERER"].split('/').last %>" == 'old_maltose'
Materialize.toast("<%= t('process.updated') %>", 4000, 'rounded')
