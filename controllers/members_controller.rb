require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/members' do # index
  @members = Member.all()
  erb ( :"members/index" )
end

get '/members' do # new
  erb( :"members/new")
end

get '/members/:id' do # show
  # or [:id]?
  @member = Member.find( params['id'].to_i)
  erb( :"members/show" )
end

post '/members' do # create
  @member = Member.new( params )
  @member.save()
  erb( :"members/create")
end

get '/members/:id/edit' do # edit
  @member = Member.find( params[:id] )
  erb( :"member/edit" )
end

post '/members/:id' do # update
  Member.new( params ).update
  redirect to '/members'
end

post '/member/:id/delete' do # delete
  order = Member.find( params[:id] )
  order.delete()
  redirect to '/members'
end
