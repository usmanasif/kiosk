module OrdersHelper
  def display_amount(amount)
    ['$', '%.2f' % amount.to_f].join
  end
end
