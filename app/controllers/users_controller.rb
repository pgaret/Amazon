class UsersController < ApplicationController
  get '/users/:id/index' do
    @user = User.all.find(params["id"])
    @items = Item.all.select {|item| item.cart_id != 0}
    if @user.login == true
      erb :index
    else
      erb :login
    end
  end

  get '/users/:id' do
    @user = User.all.find(params["id"])
    if @user.login == true
      erb :'user/show'
    else
      erb :login
    end
  end
end
