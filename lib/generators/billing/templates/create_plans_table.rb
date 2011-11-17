class CreatePlansTable < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.integer :price_per_month
      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end

