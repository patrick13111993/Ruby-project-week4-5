require_relative('../db/sql_runner')

class Trainer

  attr_reader(:name, :id)

  def initialize(options)
    @id =  options['id'].to_i || 'null'
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO trainers (
    name ) VALUES 
    ('#{ @name }') 
    RETURNING *"
    trainer_data = SqlRunner.run(sql)
    @id = trainer_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM trainers"
    trainers = SqlRunner.run( sql )
    result = trainers.map { |trainer| Trainer.new( trainer ) }
    return result
  end

  def self.delete_all()
  sql = "DELETE FROM trainers;"
  SqlRunner.run(sql)
  end

  def self.find( id )
    sql = "SELECT * FROM trainers WHERE id=#{id}"
    trainer = SqlRunner.run( sql )
    result = Trainer.new( trainer.first )

    return result
  end

end