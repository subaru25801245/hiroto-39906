class CreateBuyRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :buy_records do |t|

      t.timestamps
    end
  end
end
