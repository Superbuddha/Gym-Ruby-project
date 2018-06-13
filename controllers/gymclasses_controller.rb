require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gymclass.rb' )
also_reload( '../models/*' )

get '/gymclasses' do
  @gymclasses = Gymclass.all()
  erb ( :"gymclasses/index" )
end

get '/gymclasses/new' do
  erb( :"gymclasses/new")
end

# gymclasses/15
get '/gymclasses/:id' do
  @gymclasses = Gymclass.find(params['id'].to_i)
  erb(:"gymclasses/show")
end

get '/gymclasses/:id/edit' do
  @gymclasses = Gymclass.find( params[:id] )
  erb( :"gymclasses/edit" )
end

post '/gymclasses' do
  @gymclass = Gymclass.new( params )
  @gymclass.save()
  redirect to '/gymclasses'
end

post '/gymclasses/:id' do
  Gymclass.new( params ).update
  redirect to '/gymclasses'
end

post '/gymclasses/:id/delete' do
gymclass = Gymclass.find( params[:id] )
gymclass.delete()
  redirect to '/gymclasses'
end
