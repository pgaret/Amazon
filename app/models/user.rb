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

  def create_account(new_password)
    self.password = new_password
    self.save
    Cart.create(user_id: self.id)
    self.log_in
  end

  def log_out
    self.login = false
    self.save
    empty = User.find(1)
    empty.login = true
    empty.save
  end

  def log_in
    self.login = true
    self.save
    empty = User.find(1)
    empty.login = false
    empty.save
  end

  def add_item(item_id)
    item = Item.find(item_id)
    item.cart_id = self.cart.id
    item.save
  end
end
