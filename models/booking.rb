require_relative('../db/sql_runner')

class Booking

  attr_accessor(:gymclass_id, :member_id, :id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @gymclass_id = options['gymclass_id'].to_i
    @member_id = options['member_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (
      gymclass_id,
      member_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@gymclass_id, @member_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run( sql )
    return results.map { |booking| Booking.new( booking ) }
  end

  def member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def gymclass()
    sql = "SELECT * FROM gymclasses
    WHERE id = $1"
    values = [@gymclass_id]
    results = SqlRunner.run( sql, values )
    return Gymclass.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM bookings
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
