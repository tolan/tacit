module ApplicationHelper
  def curr_format(amount_in_cents)
    amount = amount_in_cents.to_f / 100
    number_to_currency(amount,
      unit: "€",
      separator: ",",
      delimiter: ".",
      format: "%n%u"
    )
  end
end
