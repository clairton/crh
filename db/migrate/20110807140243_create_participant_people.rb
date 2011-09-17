class CreateParticipantPeople < ActiveRecord::Migration
  def self.up
    create_table :participant_people do |t|
      t.string :first_name, :limit => 200, :null=>false
      t.string :last_name, :limit => 200
      t.string :nickname, :limit => 200
      t.date :birthday
      t.string :code, :limit => 20, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :participant_people
  end
end

