class Phone < ActiveRecord::Base
  validates_presence_of :person_id
end
