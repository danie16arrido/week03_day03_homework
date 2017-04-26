require_relative('../db/sql_runner.rb')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

class Artist
  
  attr_reader :id
  attr_accessor :name

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

  def Artist.all()
    sql = "
    SELECT * FROM artists;
    "
    result = SqlRunner.run(sql)
    artist_hashes = result.map { |artist| Artist.new(artist)}
    return artist_hashes
  end

  def albums()
    sql = "
    SELECT * FROM albums WHERE artist_id = #{@id};
    "
    result = SqlRunner.run(sql)
    albums_hashes = result.map { |album| Album.new(album)}
    return albums_hashes
  end

  def update()
    sql = "
    UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id}; 
    "
    SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM artists WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def Artist.find(sought_id)
    sql = "
    SELECT * FROM artists WHERE id = #{sought_id}
    "
    result = SqlRunner.run(sql)
    artist_hash = result.first
    found = Artist.new(artist_hash)
    return found
  end

end