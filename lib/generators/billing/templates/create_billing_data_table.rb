class CreateBillingDataTable < ActiveRecord::Migration
  def self.up
    create_table :billing_data do |t|
      t.integer :account_id
      t.string :billing_id
      t.references :plan
      t.boolean :annual_payment
      t.date :last_billing_date
      t.integer :subscription_time
      t.boolean :non_profit
      t.timestamps
    end
  end

  def self.down
    drop_table :billing_data
  end
end




