class User < ActiveRecord::Base
  attr_accessible :email, :name, :role
  after_create :update_name

  def update_name
    self.name = email.split('@').first.gsub('.',' ').titleize
    save
  end
end
