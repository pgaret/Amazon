class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    if User.all.find{|user| user.login == true} then @user = User.all.find{|user| user.login == true}
    else
      @user = User.find(1)
      @user.login = true;
      @user.save
    end
    redirect "/users/#{@user.id}/index"
  end

  get '/login' do
    @user = User.find(1)
    @users = User.all
    erb :login
  end

  post '/login' do
    @new_user = User.all.find_or_create_by(name: params["name"])
    if @new_user.password_hash == nil
      @new_user.create_account(params[:password])
      redirect "/users/#{@new_user.id}/index"
    else
      if @new_user.password == params["password"]
        @new_user.log_in
        redirect "/users/#{@new_user.id}/index"
      else
        @user = User.find(1)
        erb :badlogin
      end
    end
  end

  get '/logout/:id' do
    User.find(params[:id]).log_out
    redirect '/login'
  end

end
