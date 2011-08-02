class CreateState < ActiveRecord::Migration
  def self.up
      State.create(:name => "Amazonas", :acronym => "AM")
      State.create(:name => "Amapá", :acronym => "AP")
      State.create(:name => "Bahia", :acronym => "BA")
      State.create(:name => "São Paulo", :acronym => "SP")
      State.create(:name => "Rio de Janeiro", :acronym => "RJ")
      State.create(:name => "Espírito Santo", :acronym => "ES")
      State.create(:name => "Minas Gerais", :acronym => "MG")
      State.create(:name => "Sergipe", :acronym => "SE")
      State.create(:name => "Alagoas", :acronym => "AL")
      State.create(:name => "Pernambuco", :acronym => "PE")
      State.create(:name => "Paraíba", :acronym => "PB")
      State.create(:name => "Rio Grande do Norte", :acronym => "RN")
      State.create(:name => "Maranhão", :acronym => "MA")
      State.create(:name => "Ceará", :acronym => "CE")
      State.create(:name => "Piauí", :acronym => "PI")
      State.create(:name => "Pará", :acronym => "PA")
      State.create(:name => "Roraima", :acronym => "RR")
      State.create(:name => "Rondonia", :acronym => "RO")
      State.create(:name => "Mato Grosso do Sul", :acronym => "MS")
      State.create(:name => "Mato Grosso", :acronym => "MT")
      State.create(:name => "Goiás", :acronym => "GO")
      State.create(:name => "Paraná", :acronym => "PR")
      State.create(:name => "Santa Catarina", :acronym => "SC")
      State.create(:name => "Rio Grande do Sul", :acronym => "RS")
      State.create(:name => "Acre", :acronym => "AC")
  end

  def self.down
  end
end
