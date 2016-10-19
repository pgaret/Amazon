class UsersController < ApplicationController
  get '/users/:id/index' do
    @user = User.all.find(params["id"].to_i)
    @items = Item.all
    if @user.login == true
      erb :index
    else
      erb :badlogin
    end
  end

  get '/users/:id' do
    @user = User.all.find(params["id"])
    if @user.login == false
      erb :login
    else
      erb :badlogin
    end
  end
end
