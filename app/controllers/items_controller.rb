class ItemsController < ApplicationController
  get '/users/:u_id/items/:i_id' do
    @user, @item = User.find(params[:u_id]), Item.find(params[:i_id])
    erb :'/item/show'
  end
end
