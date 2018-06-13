require_relative( '../db/sql_runner' )


class Member
attr_accessor( :name, :address, :telephone, :email, :age )
  attr_reader(  :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @telephone = options['telephone'].to_i
    @email = options['email']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO members
    (
      name,
      address,
      telephone,
      email,
      age
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @address, @telephone, @email, @age]
    results = SqlRunner.run(sql,values)
    @id = results.first()['id'].to_i
  end

  def gymclasses()
    sql = "SELECT g.* FROM gymclasses g
    INNER JOIN bookings b ON
    b.gymclass_id = g.id WHERE b.member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |gymclass| Gymclass.new(gymclass) }
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run(sql)
    return results.map { |member| Member.new(member)}
  end

def update()
  sql = "UPDATE members
  SET
  (
  name,
  address,
  telephone,
  email,
  age
)
=
(
  $1, $2, $3, $4, $5
)
  WHERE id = $6"
  values = [@name, @address, @telephone, @email, @age, @id]
  SqlRunner.run( sql,values )
end


  def self.find(id)
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run( sql )
  end

end
