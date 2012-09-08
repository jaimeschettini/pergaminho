class CreateDefaultUser < ActiveRecord::Migration
  def up
  	User.create(:username => "admin", :email => "admin@sapienti.com.br", :name => "Admin", :password => "admin", :password_confirmation => "admin")
  end

  def down
  	User.destroy(User.first)
  end
end
