class Taxe::Type < ActiveRecord::Base
  has_many :Values
end

