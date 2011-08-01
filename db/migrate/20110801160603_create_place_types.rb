class CreatePlaceTypes < ActiveRecord::Migration
  def self.up
    create_table :place_types do |t|
      t.string :name, :limit => 200, :null=>false
      t.boolean :active, :default => true, :null=>false
      t.text :remark

      t.timestamps
    end

    @place = new PlaceType
    @place.is = 1
    @place.name = 'Country'
    @place.save


    @place = new PlaceType
    @place.is = 2
    @place.name = 'State'
    @place.save

    @place = new PlaceType
    @place.is = 3
    @place.name = 'City'
    @place.save

    @place = new PlaceType
    @place.is = 4
    @place.name = 'Neighborhood'
    @place.save

    @place = new PlaceType
    @place.is = 5
    @place.name = 'Street'
    @place.save

  end

  def self.down
    drop_table :place_types
  end
end
