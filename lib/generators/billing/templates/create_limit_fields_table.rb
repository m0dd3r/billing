class CreateLimitFieldsTable < ActiveRecord::Migration
  def self.up
    create_table :limit_fields do |t|
      t.integer :value
      t.references :field
      t.string :limitable_type
      t.integer :limitable_id
      t.timestamps
    end
  end

  def self.down
    drop_table :limit_fields
  end
end



