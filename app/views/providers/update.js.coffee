Turbolinks.visit("<%= provider_path(@provider) %>")
Materialize.toast("<%= t('provider.updated') %>", 3000, 'rounded')