require_relative( '../db/sql_runner' )

class Member

  attr_reader( :name, :age, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO members
    (
      name,
      age
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @age]
    results = SqlRunner.run(sql,values)
    @id = results.first()['id'].to_i
  end

  def instructors()
    sql = "SELECT i.* FROM gymclasses i
    INNER JOIN booking b ON
    b.gymclass_id = i_id WHERE b.member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql)
    return results.map { |gymclass| Gymclass.new(gymclass) }
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run(sql)
    return results.map { |member| Member.new(member)}
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
