//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require materialize
//= require rails.validations
//= require rails.validations.simple_form
//= require_tree

var datepicker_init = function() {
    $('.datepicker').pickadate({
        labelMonthNext: 'Наступний місяць',
        labelMonthPrev: 'Попередній місяць',
        labelMonthSelect: 'Оберіть місяць',
        labelYearSelect: 'Оберіть рік',
        monthsFull: [ 'Січень', 'Лютий', 'Березень', 'Квітень', 'Травень', 'Червень', 'Липень', 'Серпень', 'Вересен', 'Жовтень', 'Листопад', 'Грудень' ],
        monthsShort: [ 'Січень', 'Лютий', 'Березень', 'Квітень', 'Травень', 'Червень', 'Липень', 'Серпень', 'Вересен', 'Жовтень', 'Листопад', 'Грудень' ],
        // monthsShort: [ 'Січ', 'Лют', 'Бер', 'Кві', 'Тра', 'Чер', 'Лип', 'Сер', 'Вер', 'Жов', 'Лис', 'Гру' ],
        weekdaysFull: [ 'Неділя', 'Понеділок', 'Вівторок', 'Середа', 'Червер', "П'ятниця", 'Субота' ],
        weekdaysShort: [ 'Неділя', 'Понеділок', 'Вівторок', 'Середа', 'Червер', "П'ятниця", 'Субота'  ],
        weekdaysLetter: [ 'Нд', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб' ],
        format: 'dd.mm.yyyy',
        today: false,
        clear: 'Очистити',
        close: 'Закрити',
        firstDay: 1,
        closeOnSelect: true,
        onClose: function () {
            $(document.activeElement).blur();
        }
    });
};

var timepicker_init = function() {
    $('.timepicker').pickatime({
        default: 'now',
        fromnow: 0,
        twelvehour: false,
        donetext: 'OK',
        cleartext: 'Очистити',
        canceltext: 'Закрити',
        autoclose: false,
        ampmclickable: false,
        aftershow: function(){} //Function for after opening timepicker
    });
}

var movement = function() {
    $('#movement_sourceable_id').change(function() {
        free  = $('#equipment_capacity').data("capacity") - $('#equipment_amount').data("amount");
        source = $('#movement_sourceable_id').find(":selected").data("max");
        max = free > source ? source : free
        $("#movement_amount").attr({ "max": max, "min": 0.001});
    })
};

var ready;
ready = function() {
    datepicker_init();
    timepicker_init();
    movement();
    $('.collapsible').collapsible();
    $('ul.tabs').tabs();
    $('select').material_select();
    $('.tooltipped').tooltip({delay: 50});
    $('.button-collapse').sideNav({
        menuWidth: 280,
    });
    $('.modal').modal({
        endingTop: '10%',
        dismissible: false,
        complete: function() { $('.modal-content')[0].innerHTML = '' }
    });
};

$(document).on('turbolinks:load', ready);