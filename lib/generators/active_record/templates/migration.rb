class BillingCreate<%=table_name.camelize %> < ActiveRecord::Migration
  <% if ::Rails::VERSION::MAJOR == 3 && ::Rails::VERSION::MINOR >= 1 -%>
    def change
  <% else -%>
    def self.up
  <% end -%>
      create_table(:<%= table_name %>) do |t|
        t.references :billing_data

        <% attributes.each do |attribute| -%>
          t.<%= attribute.type %> :<%= attribute.name %>
        <% end -%>

        t.timestamps
      end
    end
  <% unless ::Rails::VERSION::MAJOR == 3 && ::Rails::VERSION::MINOR >= 1 -%>
    def self.down
      drop_table :<%= table_name %>
    end
  <% end -%>
end

