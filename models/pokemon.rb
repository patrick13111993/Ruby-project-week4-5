require_relative('../db/sql_runner')
require_relative('trainer')

class Pokemon

  attr_reader(:name, :breed, :date_arrived, :id, :trainerid)

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @breed = options['breed']
    @date_arrived = options['date_arrived']
    @trainerid = nil || options['trainerid']
  end


  def save()
    sql = "INSERT INTO pokemon (
    name,breed,date_arrived,trainerid ) VALUES 
    ('#{ @name }','#{ @breed }','#{ @date_arrived }',#{ @trainerid }) 
    RETURNING *"
    pokemon_data = SqlRunner.run(sql)
    @id = pokemon_data.first()['id'].to_i
  end

  def trainer
    sql = "SELECT * FROM trainers
    WHERE id = #{@trainerid} "
    trainer_data = SqlRunner.run(sql)
    return Trainer.new(trainer_data.first)
  end

  def self.all()
    sql = "SELECT * FROM pokemon;"
    pokemons = SqlRunner.run( sql )
    result = pokemons.map { |pokemon| Pokemon.new( pokemon ) }
    return result
  end
end