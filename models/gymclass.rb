require_relative( '../db/sql_runner' )

class Gymclass

  attr_reader( :name, :activity, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @activity = options['activity']
  end
  def save()
    sql = "INSERT INTO gymclasses
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
    INNER JOIN booking b ON b.member_id = m.id
    WHERE b.gymclass_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def self.all()
    sql = "SELECT * FROM gymclasses"
    results = SqlRunner.run( sql )
    return results.map { |hash| Gymclass.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM gymclasses
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Gymclass.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM gymclasses"
    SqlRunner.run( sql )
  end

end
