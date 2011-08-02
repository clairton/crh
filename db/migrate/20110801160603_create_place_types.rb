class CreatePlaceTypes < ActiveRecord::Migration
  def self.up
    create_table :place_types do |t|
      t.string :name, :limit => 200, :null=>false
      t.boolean :active, :default => true, :null=>false
      t.text :remark

      t.timestamps
    end    
    PlaceType.create(:id =>1 , :name => "Country")
    PlaceType.create(:id =>2 , :name => "State")
    PlaceType.create(:id =>3 , :name => "City")
    PlaceType.create(:id =>4 , :name => "Neighborhood")
    PlaceType.create(:id =>5 , :name => "Street")
  end
  def self.down
    drop_table :place_types
  end
end
