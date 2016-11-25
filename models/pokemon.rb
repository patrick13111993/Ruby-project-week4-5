require_relative('../db/sql_runner')
require_relative('trainer')

class Pokemon

  attr_reader(:name, :breed, :date_arrived, :id, :pokeid)

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @breed = options['breed']
    @date_arrived = options['date_arrived']
    @pokeid = options['pokeid']
  end
end