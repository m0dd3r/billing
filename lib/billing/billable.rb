module Billing
  module Billable

    def self.included(base)
      base.has_one :billing_data, :class_name => "#{base.name}BillingData"
      base.send :include, InstanceMethods
    end

    module InstanceMethods
      def method_missing(meth, *args, &block)
        if meth.to_s =~ /(.+)_limit$/
          self.billing_data.limit_fields.each do |lf|
          if lf.field_name.casecmp($1) == 0
            return lf.value
          end
          end
        return nil
        else
          super
        end
      end
    end
  end
end
