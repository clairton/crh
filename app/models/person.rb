class Person < ActiveRecord::Base
  has_many :Phone
  has_many :Address
end

