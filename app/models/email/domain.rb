class Email::Domain < ActiveRecord::Base
  has_many :User
end

