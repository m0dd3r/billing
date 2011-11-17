class CreatePlanLimitFieldsTable < ActiveRecord::Migration
  def self.up
    create_table :plan_limit_fields do |t|
      t.integer :value
      t.references :field
      t.references :plan
      t.timestamps
    end
  end

  def self.down
    drop_table :plan_limit_fields
  end
end



