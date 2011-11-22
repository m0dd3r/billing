module Billing
  module Limitable
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def acts_as_limitable(table_name = :field)
        limit_table = "limit_#{table_name.to_s.pluralize}"
        attr_accessible "#{limit_table}_attributes".intern
        has_many limit_table.intern, :as => :limitable, :dependent => :destroy
        has_many table_name.to_s.pluralize.intern, :through => limit_table.intern
        accepts_nested_attributes_for limit_table.intern, :allow_destroy => true
      end
    end
    module InstanceMethods

      def limitable?
        true
      end
    end
  end
end
ActiveRecord::Base.send :include, Billing::Limitable
