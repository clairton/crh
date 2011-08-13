class Address::Place < ActiveRecord::Base
  validates_uniqueness_of :name, :scope => :type,:scope => :address_place_id
  validates_uniqueness_of :code, :scope => :type,:scope => :address_place_id
end