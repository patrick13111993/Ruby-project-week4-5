require_relative('../db/sql_runner')
require_relative('trainer')
require('date')

class Pokemon

  attr_reader(:name, :breed, :date_arrived, :id)
  attr_accessor(:trainerid, :picture)

  def initialize(options)
    @id = options['id'].to_i || 'null' 
    @name = options['name']
    @breed = options['breed']
    @date_arrived = options['date_arrived']
    @trainerid = options['trainerid'] || 'null'
    @picture = options['picture'] || 'null'
  end

  def save()
    sql = "INSERT INTO pokemon (
    name, breed, date_arrived, trainerid, picture ) VALUES 
    ('#{ @name }','#{ @breed }','#{ @date_arrived }', #{@trainerid}, '#{@picture}') 
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

  def self.delete_all()
    sql = "DELETE FROM pokemon;"
    SqlRunner.run(sql)
  end  

  def self.delete(id)
    sql = "DELETE FROM pokemon WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def self.find( id )
    sql = "SELECT * FROM pokemon WHERE id=#{id}"
    pokemon = SqlRunner.run( sql )
    result = Pokemon.new( pokemon.first )

    return result
  end

  def self.update(params)
    sql = "UPDATE pokemon SET trainerid = #{params['trainerid']} WHERE id = #{params['pokeid']};"
    SqlRunner.run(sql)
  end

  def time_since_arrival
    t = Date.today
    date_added = Date.parse(@date_arrived)
    timespan = (t - date_added).to_i
    return timespan
  end

  def is_adoptable?
    return @trainerid == 'null' && time_since_arrival >= 30
  end

  def self.can_adopt?
    adoptable = []
    pokemons = Pokemon.all()
    for pokemon in pokemons
      if pokemon.is_adoptable?
        adoptable << pokemon
      end
    end
    return adoptable.count != 0
  end

end