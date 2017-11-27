//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require materialize
//= require_tree .

var ready;
ready = function() {
    $('.collapsible').collapsible();
    $('ul.tabs').tabs();
    $('select').material_select();
    $('.modal').modal();
    $('.datepicker').pickadate({
        labelMonthNext: 'Наступний місяць',
        labelMonthPrev: 'Попередній місяць',
        labelMonthSelect: 'Оберіть місяць',
        labelYearSelect: 'Оберіть рік',
        monthsFull: [ 'Січень', 'Лютий', 'Березень', 'Квітень', 'Травень', 'Червень', 'Липень', 'Серпень', 'Вересен', 'Жовтень', 'Листопад', 'Грудень' ],
        monthsShort: [ 'Січень', 'Лютий', 'Березень', 'Квітень', 'Травень', 'Червень', 'Липень', 'Серпень', 'Вересен', 'Жовтень', 'Листопад', 'Грудень' ],
        // monthsShort: [ 'Січ', 'Лют', 'Бер', 'Кві', 'Тра', 'Чер', 'Лип', 'Сер', 'Вер', 'Жов', 'Лис', 'Гру' ],
        weekdaysFull: [ 'Неділя', 'Понеділок', 'Вівторок', 'Середа', 'Червер', "П'ятниця", 'Субота' ],
        weekdaysShort: [ 'Нд', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб' ],
        weekdaysLetter: [ 'Нд', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб' ],
        format: 'dd/mm/yyyy',
        today: false,
        clear: 'Очистити',
        close: 'Закрити',
        firstDay: 1,
        closeOnSelect: true
    });

};

$(document).on('turbolinks:load', ready);