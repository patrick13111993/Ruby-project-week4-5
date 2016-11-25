require_relative('../db/sql_runner')

class House

  attr_reader(:name, :id)

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
  end