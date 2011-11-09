# CURRENT FILE :: lib/generators/team_page/templates/migration.rb
class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.string :name
      t.integer :payments_per_year
      t.decimal :price, :precision => 8, :scale => 2
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end

