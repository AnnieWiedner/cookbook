class User < ActiveRecord::Base
  self.table_name = 'users'
  has_many :recipes
  has_secure_password

end
