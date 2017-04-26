require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

artist1 = Artist.new({'name' => 'Therion'})
artist1.save()
artist2 = Artist.new({'name' => 'Haggard'})

a1 = {
  'title' => 'Awaking the Centuries',
  'genere' => 'Neo Classical Metal',
  'artist_id' => artist2.id
}
album1 = Album.new(a1)
album1.save()

a2 = {
  'title' => 'Vobin',
  'genere' => 'Symphonic Metal',
  'artist_id' => artist1.id
}
album2 = Album.new(a2)
album2.save()

a2 = {
  'title' => 'And Thou Shalt Trust... the Seer',
  'genere' => 'Symphonic Metal',
  'artist_id' => artist2.id
}
album2 = Album.new(a2)
album2.save()


binding.pry
nil