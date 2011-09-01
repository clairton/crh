class Participant::Type < ActiveRecord::Base
  validates_presence_of :participant_person_id
  validates_uniqueness_of :participant_person_id, :scope => :type
end
