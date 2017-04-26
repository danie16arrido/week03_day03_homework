require_relative('../db/sql_runner.rb')

class Artist
  
  attr_reader :id, :name

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end

  def save()
    sql = "
    INSERT INTO artists (name) VALUES ('#{@name}')
    RETURNING *;
    "
    result = SqlRunner.run(sql) 
    @id = result.first()['id'].to_i
  end
end