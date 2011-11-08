user = User.new(
  :display_name => "admin",
  :email => "admin@crh.org",
  :password => '123456'
)
user.save!(:validate => false)