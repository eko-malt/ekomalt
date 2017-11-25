gtype = <%= @provider.grain? %>
console.log gtype
if gtype
  $("<%= j(render @provider) %>").appendTo("#providers-grain")
else
  $("<%= j(render @provider) %>").appendTo("#providers-bags")



