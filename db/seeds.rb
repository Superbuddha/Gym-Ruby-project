require_relative( "../models/instructor.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/session.rb" )
require("pry-byebug")

Session.delete_all()
Instructor.delete_all()
Member.delete_all()

instructor1 = Instructor.new({
  "name" => "Romero",
  "activity" => "Boxing"
})

instructor1.save()

instructor2 = Instructor.new({
  "name" => "Mark",
  "activity" => "Brazilian Jiu Jistsu"
})

instructor2.save()

instructor3 = Instructor.new({
  "name" => "Joanna",
  "activity" => "Yoga"
})

instructor3.save()

instructor4 = Instructor.new({
  "name" => "Newell",
  "activity" => "Pilates"
})

instructor4.save()

member1 = Member.new({
  "name" => "Maggie",
  "age" => 30
})

member1.save()

member2 = Member.new({
  "name" => "Rick",
  "age" => 25
})

member2.save()

member3 = Member.new({
  "name" => "Celine",
  "age" => 15
})

member3.save()

member4 = Member.new({
  "name" => "Glenn",
  "age" => 30
})

member4.save()

session1 = Session.new({
  "name" => "Sparring"
  "member_id" => member1.id,
  "instructor_id" => instructor1.id
})

session1.save()

session2 = Session.new({
  "name" => "Fundamentals"
  "member_id" => member2.id,
  "instructor_id" => instructor2.id
})

session2.save()

session3 = Session.new({
  "name" => "Ashtanga Yoga"
  "member_id" => member3.id,
  "instructor_id" => instructor3.id
})
session3.save()

session4 = Session.new({
  "name" => "Pilates Intermediate"
  "member_id" => member4.id,
  "instructor_id" => instructor4.id
})

session4.save()

binding.pry
nil
