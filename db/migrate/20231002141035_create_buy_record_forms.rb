class CreateBuyRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :buy_records do |t|
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
