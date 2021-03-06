require_relative('../db/sql_runner.rb')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

class Album

  attr_reader :id
  attr_accessor :title, :genre, :artist_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @title = params['title']
    @genre = params['genre']
    @artist_id = params['artist_id']
  end

  def save()
    sql = "
    INSERT INTO albums (title, genre, artist_id) 
    VALUES
    ('#{@title}', '#{@genre}', #{@artist_id})
    RETURNING *;
    "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def Album.all()
    sql = "
    SELECT * FROM  albums;
    "
    result = SqlRunner.run(sql)
    album_hashes = result.map { |album| Album.new(album)}
    return album_hashes
  end

  def artist()
    sql ="
    SELECT * FROM artists WHERE id = #{@artist_id};
    "
    result = SqlRunner.run(sql)
    artist_hash = Artist.new(result.first)
    return artist_hash 
  end

  def update()
    sql = "
    UPDATE albums SET 
    (title, genre, artist_id) = ('#{@title}', '#{@genre}', #{@artist_id})
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM albums WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def Album.find(sought_id)
    sql = "
    SELECT * FROM albums WHERE id = #{sought_id}
    "
    result = SqlRunner.run(sql)
    album_hash = result.first
    found = Album.new(album_hash)
    return found
  end

end