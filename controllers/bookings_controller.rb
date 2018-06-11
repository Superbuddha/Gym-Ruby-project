require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/booking.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/gymclass.rb' )
also_reload( '../models/*' )

get '/bookings' do # index
  # @bookings or @booking?
  @bookings = Booking.all
  erb ( :"bookings/index" )
end

get '/bookings/new' do # new
  erb(:"bookings/new")
end
get '/bookings/:id' do # show
  @booking = Booking.find( params[:id] )
  erb( :show )
end

post '/bookings' do # create
  @booking = Booking.new(params)
  @booking.save
  erb( :"bookings/create")
end

get '/bookings/:id/edit' do # edit
  @booking = Booking.find( params[:id] )
  erb( :edit)
end

post '/bookings/:id' do # update
  Booking.new( params).update
  redirect to("/bookings")
end

post '/bookings/:id/delete' do # delete
  order = Booking.destroy(params[:id])
  order. delete()
  redirect to "/bookings"
end
