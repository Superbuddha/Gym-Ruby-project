require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gymclass.rb' )
also_reload( '../models/*' )

get '/gymclasses' do # index
  @gymclasses = Gymclass.all()
  erb ( :"gymclasses/index" )
end

get '/gymclasses/:id' do # show
  @gymclasses = Gymclass.find(params['id'].to_i)
  erb(:"gymclasses/show")
end

get '/gymclasses/:id/edit' do # edit
  @gymclasses = Gymclass.find( params[:id] )
  erb( :"gymclasses/edit" )
end

get '/gymclasses/new' do # new
  erb( :"gymclasses/new")
end

post '/gymclasses' do # create
  @gymclasses = Gymclass.new( params )
  @gymclass.save()
  erb( :"gymclass/create")
end

post '/gymclasses/:id' do # update
  Gymclass.new( params ).update
  redirect to '/gymclasses'
end

post '/gymclasses/:id/delete' do #delete
gymclass = Gymclass.find( params[:id] )
gymclass.delete()
  redirect to '/gymclasses'
end
