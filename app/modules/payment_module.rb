module PaymentModule
  def pay_item(item, token)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,  
      card: token,  
      currency: 'jpy'  
    )
  end
end