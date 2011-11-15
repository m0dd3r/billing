class CreatePromoCodesTable < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.string :code
      t.date :valid_through
      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end
