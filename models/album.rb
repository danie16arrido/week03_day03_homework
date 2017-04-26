

class Album
  attr_reader :id, :name, :title, :genere, :artist_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @title = params['title']
    @genere = params['genere']
    @artist_id = params['artist_id']
  end


end