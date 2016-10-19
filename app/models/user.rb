class User < ActiveRecord::Base
  include BCrypt
  has_many :reviews
  has_one :cart
  has_many :items, through: :cart

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
end
