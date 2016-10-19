class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    redirect "/users/1/index"
  end

  get '/login' do
    @users = User.all
    erb :login
  end

  post '/login' do
    @user = User.all.find_or_create_by(name: params["name"])
    if @user.password == nil
      @user.password = params["password"]
      @user.update(params)
      @user.login = "true"
      redirect "/users/#{@user.id}/index"
    else
      if @user.password == params["password"]
        @user.login = "true"
        redirect "/users/#{@user.id}/index"
      else
        erb :badlogin
      end
    end
  end

end
