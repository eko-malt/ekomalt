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

end