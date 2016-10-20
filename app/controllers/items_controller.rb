class ItemsController < ApplicationController
  get '/users/:u_id/items/:i_id' do
    @user, @item = User.find(params[:u_id]), Item.find(params[:i_id])
    erb :'/item/show'
  end

  post '/users/:u_id/items/:i_id' do
    User.find(params[:u_id]).add_item(params[:i_id])
    redirect "/users/#{params[:u_id].to_i}/items/#{params[:i_id].to_i}"
  end
end
