require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/session.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/instructor.rb' )
require_relative( '../models/action.rb' )
also_reload( '../models/*' )

get '/sessions' do
  @sessions = Session.all
  @actions = Action.all
  erb ( :"sessions/index" )
end

get '/sessions/new' do
  @members = Member.all
  @instructors = Instructor.all
  erb(:"sessions/new")
end

post '/sessions' do
  session = Session.new(params)
  session.save
  redirect to("/sessions")
end

post '/sessions/:id/delete' do
  Session.destroy(params[:id])
  redirect to("/sessions")
end
