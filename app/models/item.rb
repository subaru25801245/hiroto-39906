class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  belongs_to :category
  belongs_to :condition
  belongs_to :del_burden, class_name: 'DeliveryBurden', foreign_key: 'del_burden_id'
  belongs_to :prefecture
  belongs_to :del_day, class_name: 'DeliveryDay', foreign_key: 'del_day_id'
  has_one :buy_record
  has_one_attached :image

  validates :image, presence: { message: "can't be blank" }
  validates :name, presence: { message: "can't be blank" }
  validates :info, presence: { message: "can't be blank" }
  validates :price, presence: { message: "can't be blank" }, 
                    numericality: { only_integer: true, greater_than_or_equal_to: 300,
                       less_than_or_equal_to: 9_999_999, 
                       message: "is out of setting range" }
                       
  validates :price, numericality: { only_integer: true,message: "is invalid. Input half-width characters" }

  validates :category_id, numericality: { greater_than: 0, message: "can't be blank" }
  validates :condition_id, numericality: { greater_than: 0, message: "can't be blank" }
  validates :del_burden_id, numericality: { greater_than: 0, message: "can't be blank" }
  validates :prefecture_id, numericality: { greater_than: 0, message: "can't be blank" }
  validates :del_day_id, numericality: { greater_than: 0, message: "can't be blank" }


end
