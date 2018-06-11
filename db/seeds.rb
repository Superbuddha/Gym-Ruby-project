require_relative( "../models/gymclass.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/booking.rb" )
require("pry-byebug")

Booking.delete_all()
Gymclass.delete_all()
Member.delete_all()

gymclass1 = Gymclass.new({
  "name" => "Monday 5pm",
  "activity" => "Boxing"
})

gymclass1.save()

gymclass2 = Gymclass.new({
  "name" => "Tuesday 5pm",
  "activity" => "Brazilian Jiu Jistsu"
})

gymclass2.save()

gymclass3 = Gymclass.new({
  "name" => "Wednesday 5pm",
  "activity" => "Kung Fu"
})

gymclass3.save()

gymclass4 = Gymclass.new({
  "name" => "Thursday 5pm",
  "activity" => "MMA"
})

gymclass4.save()

member1 = Member.new({
  "name" => "Joanna",
  "address" => "St George's Road",
  "telephone" => 23456,
  "email" => "Joanna@email.com",
  "age" => 23
})

member1.save()

member2 = Member.new({
  "name" => "Rick",
  "address" => "Byres Road",
  "telephone" => 34567,
  "email" => "Rick@email.com",
  "age" => 34
})

member2.save()

member3 = Member.new({
  "name" => "Celine",
  "address" => "Nile Street",
  "telephone" => 45678,
  "email" => "Celine@email.com",
  "age" => 19
})

member3.save()

member4 = Member.new({
  "name" => "Glenn",
  "address" => "Sauchiehall Street",
  "telephone" => 56789,
  "email" => "Glenn@email.com",
  "age" => 30
})

member4.save()

member5 = Member.new({
  "name" => "Morty",
  "address" => "Clarendon Place",
  "telephone" => 12345,
  "email" => "morty@email.com",
  "age" => 45
  })
member5.save()

member6 = Member.new({
  "name" => "Jamie",
  "address" => "High Street",
  "telephone" => 01234,
  "email" => "jamie@email.com",
  "age" => 40
  })
member6.save()

booking1 = Booking.new({
  "member_id" => member1.id,
  "gymclass_id" => gymclass1.id
})
booking1.save()

booking2 = Booking.new({
  "member_id" => member2.id,
  "gymclass_id" => gymclass2.id
})

booking2.save()

booking3 = Booking.new({
  "member_id" => member3.id,
  "gymclass_id" => gymclass3.id
})
booking3.save()

booking4 = Booking.new({
  "member_id" => member4.id,
  "gymclass_id" => gymclass4.id
})

booking4.save()


booking5 = Booking.new({
  # "member_id" => member1.id,
  "member_id" => member5.id,
"gymclass_id" => gymclass1.id
})
booking5.save()


booking6 = Booking.new({
  "member_id" => member6.id,
  "gymclass_id" => gymclass4.id
})

booking6.save()

booking7 = Booking.new({
  "member_id" => member5.id,
  "gymclass_id" => gymclass4.id
})

booking7.save()


booking8 = Booking.new({
  "member_id" => member6.id,
  "gymclass_id" => gymclass2.id
})

booking8.save()

binding.pry
nil
