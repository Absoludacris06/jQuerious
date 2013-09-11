post '/user/signin' do
  @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect '/'    
    else
      @error = "Bad E-Mail/Password combination"
      erb :index
    end
end  

post '/user/new' do

  user = User.new(params)
  if user.save
    session[:user_id] = user.id 
    redirect '/home'
  else
    @error = "Invalid account creation info"
    erb :index
    # redirect to('/')
  end
end


get '/logout' do
  session.clear
  redirect '/'
end

get '/' do
  if current_user
    @users_surveys = current_user.surveys
    redirect '/home'
  else
    erb :index#, :layout => false #why is layout false?
  end
end

# get '/signin' do
#   erb :_signin, layout: false
# end

# get '/signup' do
#   erb :_signup, layout: false
# end

