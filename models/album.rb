require_relative('../db/sql_runner.rb')

class Album
  attr_reader :id, :name, :title, :genere, :artist_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @title = params['title']
    @genere = params['genere']
    @artist_id = params['artist_id']
  end

  def save()
    sql = "
    INSERT INTO albums (name, title, genere, artist_id) 
    VALUES
    ('#{@name}', '#{@title}', '#{@genere}', #{@artist_id})
    RETURNING *;
    "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end


end