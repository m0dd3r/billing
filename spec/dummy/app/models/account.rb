class Account < ActiveRecord::Base
  # Include billing module, :billable
  include :billable
end
