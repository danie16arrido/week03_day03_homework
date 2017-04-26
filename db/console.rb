require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

artist1 = Artist.new({'name' => 'Dan the man'})
artist1.save()

a1 = {
  'title' => 'Dark Side of the moon',
  'genere' => 'pop',
  'artist_id' => artist1.id
}
album1 = Album.new(a1)
album1.save()







binding.pry
nil