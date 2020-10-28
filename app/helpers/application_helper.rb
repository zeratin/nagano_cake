module ApplicationHelper
  def tax_included_price(price)
    (price * 1.1).round.to_s(:delimited)
  end
end
