user = User.new(
  :display_name => "admin",
  :email => "admin@crh.org",
  :password => '123456'
)
user.save!(:validate => false)
#gambia para não dar problema na hora de importa o primeiro xml
item = Goods::Item.new(
  :name => "teste",
  :code => "teste"
)
item.save!(:validate => false)
