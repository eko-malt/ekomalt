//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require materialize
//= require rails.validations
//= require rails.validations.simple_form
//= require_tree .

var datepicker_init;
datepicker_init = function() {
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

var ready;
ready = function() {
    datepicker_init();
    $('.collapsible').collapsible();
    $('ul.tabs').tabs();
    $('select').material_select();
    $('.tooltipped').tooltip({delay: 50});
    $("#top_date").on("click", function() {
        $('#')
        //$("#calendar").trigger('click');
        //console.log('show_calendar');
    });
    $('.modal').modal({
        endingTop: '10%',
        dismissible: false,
        complete: function() { $('.modal-content')[0].innerHTML = '' }
    });
};

$(document).on('turbolinks:load', ready);