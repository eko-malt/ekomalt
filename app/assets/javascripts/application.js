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

Date.prototype.addHours = function(hours) {
    var result = new Date(this.valueOf());
    result.setHours(result.getHours() + hours);
    return result;
};

function formatDate(date) {
    var day = date.getDate();
    if (day < 10) { day = '0' + day }
    var month = date.getMonth() + 1;
    if (month < 10) { month = '0' + month }
    var year = date.getFullYear();
    return day + '.' + month + '.' + year;
}

function formatTime(date) {
    var hours = date.getHours();
    if (hours < 10) { hours = '0' + hours }
    var minutes = date.getMinutes();
    if (minutes < 10) { minutes = '0' + minutes }
    return hours + ':' + minutes;
}

var set_malt = function() {
    $('.malt_button').click(function() {
        $('.malt_button_pink').removeClass('malt_button_pink');
        $(this).addClass('malt_button_pink');
        var duration = parseInt($(this).attr("data-duration"));
        var start_date = new Date($('#dates_start_date').val().split('.').reverse().join(' ') + ' ' + $('#dates_start_time').val());
        var finish_date = start_date.addHours(duration);
        $("label[for='dates_finish_date']").addClass('active');
        $('#dates_finish_date').val(formatDate(finish_date));
        $("label[for='dates_finish_time']").addClass('active');
        $('#dates_finish_time').val(formatTime(finish_date));
    })
};

var ready;
ready = function() {
    datepicker_init();
    timepicker_init();
    movement();
    set_malt();
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