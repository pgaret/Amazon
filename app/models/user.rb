class User < ActiveRecord::Base
  
  has_many :reviews
  has_one :cart
  has_many :items, through: :cart

end
