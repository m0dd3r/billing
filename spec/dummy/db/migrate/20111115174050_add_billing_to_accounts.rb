class AddBillingToAccounts < ActiveRecord::Migration
  def self.up
    change_table(:accounts) do |t|
      t.references :billing_data
    end
          t.string :email
      end
  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end