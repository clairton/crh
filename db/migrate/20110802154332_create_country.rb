class CreateCountry < ActiveRecord::Migration
  def self.up
      Country.create(:name => "Brasil", :acronym => "BR")
  end

  def self.down
  end
end
