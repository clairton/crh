class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :phone_number, :limit => 15
      t.string :adress_number, :limit => 15
      t.string :name, :limit => 200
      t.string :remark
      t.boolean :active, :null => false, :default => true
      t.string :type
      t.integer :place_id
      t.string :acronym

      t.timestamps
    end
    @country = Country.create(:name => "Brasil", :acronym => "BR", :phone_number => "55", :adress_number => "1058")    
    State.create(:name => "Amazonas", :acronym => "AM", :adress_number => "13",:place_id => @country.id)
    State.create(:name => "Amapá", :acronym => "AP", :adress_number => "16",:place_id => @country.id)
    State.create(:name => "Bahia", :acronym => "BA", :adress_number => "29",:place_id => @country.id)
    State.create(:name => "São Paulo", :acronym => "SP", :adress_number => "35",:place_id => @country.id)
    State.create(:name => "Rio de Janeiro", :acronym => "RJ", :adress_number => "33",:place_id => @country.id)
    State.create(:name => "Espírito Santo", :acronym => "ES", :adress_number => "32",:place_id => @country.id)
    State.create(:name => "Minas Gerais", :acronym => "MG", :adress_number => "31",:place_id => @country.id)
    State.create(:name => "Sergipe", :acronym => "SE", :adress_number => "28",:place_id => @country.id)
    State.create(:name => "Alagoas", :acronym => "AL", :adress_number => "27",:place_id => @country.id)
    State.create(:name => "Pernambuco", :acronym => "PE", :adress_number => "26",:place_id => @country.id)
    State.create(:name => "Paraíba", :acronym => "PB", :adress_number => "25",:place_id => @country.id)
    State.create(:name => "Rio Grande do Norte", :acronym => "RN", :adress_number => "24",:place_id => @country.id)
    State.create(:name => "Maranhão", :acronym => "MA", :adress_number => "21",:place_id => @country.id)
    State.create(:name => "Ceará", :acronym => "CE", :adress_number => "23",:place_id => @country.id)
    State.create(:name => "Piauí", :acronym => "PI", :adress_number => "22",:place_id => @country.id)
    State.create(:name => "Pará", :acronym => "PA", :adress_number => "15",:place_id => @country.id)
    State.create(:name => "Roraima", :acronym => "RR", :adress_number => "14",:place_id => @country.id)
    State.create(:name => "Rondonia", :acronym => "RO", :adress_number => "24",:place_id => @country.id)
    State.create(:name => "Mato Grosso do Sul", :acronym => "MS", :adress_number => "50",:place_id => @country.id)
    State.create(:name => "Mato Grosso", :acronym => "MT", :adress_number => "51",:place_id => @country.id)
    State.create(:name => "Goiás", :acronym => "GO", :adress_number => "52",:place_id => @country.id)
    State.create(:name => "Paraná", :acronym => "PR", :adress_number => "41",:place_id => @country.id)
    State.create(:name => "Santa Catarina", :acronym => "SC", :adress_number => "42",:place_id => @country.id)
    State.create(:name => "Rio Grande do Sul", :acronym => "RS", :adress_number => "43",:place_id => @country.id)
    State.create(:name => "Acre", :acronym => "AC", :adress_number => "12",:place_id => @country.id)
  end

  def self.down
    drop_table :places
  end
end
