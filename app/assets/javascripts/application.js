//= require jquery
//= require jquery.turbolinks
//= require rails-ujs
//= require turbolinks
//= require materialize
//= require_tree .

var ready;
ready = function() {
    console.log('ready');
    $('.collapsible').collapsible();
};

$(document).on('turbolinks:load', ready);