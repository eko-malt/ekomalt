//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require rails-ujs
//= require turbolinks
//= require materialize
//= require sweet-alert
//= require sweet-alert-confirm
//= require_tree .

var ready;
ready = function() {
    $('.collapsible').collapsible();
    $('.tabs').tabs();
};

$(document).on('turbolinks:load', ready);