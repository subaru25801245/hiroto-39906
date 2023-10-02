class CreateDeliveryDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_destinations do |t|
      t.string :post_code
      t.integer :prefecture_id
      t.string :area
      t.string :address
      t.string :build_name
      t.string :tel
      t.references :buy_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
