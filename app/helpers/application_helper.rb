module ApplicationHelper
  def tax_included_price(price)
    (price * 1.1).round(0).to_s(:delimited)
  end
end
