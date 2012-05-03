class User < ActiveRecord::Base
  attr_accessible :email, :name, :role
end
