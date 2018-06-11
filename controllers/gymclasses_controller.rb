require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gymclass.rb' )
also_reload( '../models/*' )

get '/gymclasses' do
  @gymclasses = Gymclass.all()
  erb ( :"gymclasses/index" )
end

get '/gymclasses/:id' do
  @gymclasses = Gymclasss.find(params['id'].to_i)
  erb(:"gymclasses/show")
end

get '/gymclasses/:id/edit' do
  @gymclasses = Gymclass.find( params[:id] )
  erb( :"gymclasses/edit" )
end

post '/gymclasses/:id' do
  Gymclass.new( params ).update
  redirect to '/gymclassess'
end
