require_relative( '../db/sql_runner' )

class Instructor

  attr_reader( :name, :activity, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @activity = options['activity']
  end
  def save()
    sql = "INSERT INTO instructors
    (
      name,
      activity
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @activity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def members
    sql = "SELECT m.* FROM members m
    INNER JOIN sessions s ON s.member_id = m.id
    WHERE s.instructor_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def self.all()
    sql = "SELECT * FROM instructors"
    results = SqlRunner.run( sql )
    return results.map { |hash| Member.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM instructors
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Instructor.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM instructors"
    SqlRunner.run( sql )
  end

end
