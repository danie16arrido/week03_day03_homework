class Artist
  
  attr_reader :id, :name

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end

  def save()
    sql = "
    INSERT INTO artists (name) VALUES ('#{@name}')
    "
  end
end