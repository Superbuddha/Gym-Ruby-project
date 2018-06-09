require_relative('../db/sql/runner')

class Session

  attr_reader(:name, :instructor_id, :member_id, :id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options[name]
    @instructor_id = options['instructor_id'].to_i
    @member_id = options['member_id'].to_i
  end

  def save()
    sql = "INSERT INTO sessions
    (
      name,
      instructor_id,
      member_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @instructor_id, @member_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM sessions"
    results = SqlRunner.run( sql )
    return results.map { |session| Session.new( session ) }
  end

  def member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def instructor()
    sql = "SELECT * FROM instructors
    WHERE id = $1"
    values = [@instructor_id]
    results = SqlRunner.run( sql, values )
    return Instructor.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM sessions
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
