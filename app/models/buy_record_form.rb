class BuyRecordForm
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :area, :address, :build_name, :tel, :item_id, :user_id

  with_options presence: { message: "can't be blank" } do
    validates :token, :prefecture_id, :area, :address, :user_id, :item_id
  end

  validates :post_code, presence: { message: "can't be blank" },
  format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }

  validates :prefecture_id, numericality: { greater_than: 0, message: "can't be blank" }

  validates :tel, presence: { message: "can't be blank" }, 
  format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }, 
  length: { minimum: 10, too_short: "is too short" }

  

  def save
    buy_record = BuyRecord.create(item_id: item_id, user_id: user_id)
    DeliveryDestination.create(post_code: post_code, prefecture_id: prefecture_id, area: area, address: address, build_name: build_name, tel: tel, buy_record_id: buy_record.id)

  end
end
