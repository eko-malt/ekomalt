module ApplicationHelper
  def weight_in_tones(weight)
    t('main.weight_in_tones', weight: number_with_precision(weight, precision: 3, delimiter: ' ', separator: ','))
  end

  def bag_amount(amount)
    t('main.bag_amount', amount: amount)
  end

  def price_with_uah(price)
    t('main.price_with_uah', price: number_with_precision(price, precision: 2, delimiter: ' ', separator: ','))
  end

  def active_class(item)
    :active if controller.controller_name.to_s == item.to_s || controller.action_name.to_s == item.to_s
  end

  def date_ukr(date)
    date.strftime('%d.%m.%Y')
  end

  def time_ukr(time)
    time.strftime('%H:%M')
  end
end
