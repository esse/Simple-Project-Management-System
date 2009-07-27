class Writeboard < ActiveRecord::Base
  belongs_to :user
  acts_as_versioned

end
