get '/home' do
  @error = session[:error]
  @user_surveys = current_user.created_surveys
  @all_surveys = Survey.all
  erb :dashboard
end

get '/survey/:id/stats' do
  @current_survey = Survey.find(params[:id])
  erb :stats
end

get '/survey/new' do
  erb :create_survey
end

post '/survey/:id/submit' do
  p '&' * 100
  p params
  current_survey = params[:id]
  params.keep_if {|k,_| /\A\d+\z/ === k}
  params.each_value do |v|
    Answer.create(user_id: current_user.id, choice_id: v)
  end
  Survey.find(current_survey).takers << current_user

  redirect "/survey/#{current_survey}/stats"
end

post '/survey/create' do
  puts "*" * 80
  puts params
  parse_form(params) #move this from the helper into here and define
  puts "*" * 80
  "I'm in the Post"
end

get '/survey/:id' do
  @current_survey = Survey.find(params[:id])
  if @current_survey.takers.include?(current_user)
    session[:error] = "You've already taken this survey"
    redirect '/home'
  end
  erb :view_survey
end

# post '/survey/:id/question/create' do
#   # this needs to be built out
#   redirect '/home'
# end

get '/form/question' do
  erb :"/survey/_create_qa", layout: false
end

get '/form/choice' do
  erb :"/survey/_create_choice", layout: false
end
