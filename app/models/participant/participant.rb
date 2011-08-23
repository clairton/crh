class Participant::Participant < ActiveRecord::Base
  validates_presence_of :participant_person_id
end
