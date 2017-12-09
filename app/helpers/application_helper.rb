module ApplicationHelper

  def weight_in_tones(weight)
    t('main.weight_in_tones', weight: number_with_precision(weight, precision: 3, delimiter: ' ', separator: ','))
  end

  def bag_amount(amount)
    t('main.bag_amount', amount: amount)
  end

end