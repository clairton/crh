class Adress < ActiveRecord::Base
  validates_presence_of :place_id, :person_id
end
