class Recipe < ActiveRecord::Base
  self.table_name = 'recipes'
  belongs_to :user

end
