module ChargesHelper
  def pretty_amount(amount_in_cents)
    amount_in_cents / 100
  end
end
