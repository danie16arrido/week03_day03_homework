require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

artist1 = Artist.new({'name' => 'Therion'})
artist1.save()
artist2 = Artist.new({'name' => 'Haggard'})
artist2.save()

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

a3 = {
  'title' => 'And Thou Shalt Trust... the Seer',
  'genere' => 'Symphonic Metal',
  'artist_id' => artist2.id
}
album3 = Album.new(a3)
album3.save()


binding.pry
nil