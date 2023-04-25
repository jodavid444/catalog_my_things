require_relative './modules/author'
require_relative './modules/book'
require_relative './modules/game'
require_relative './modules/item'
require_relative './modules/label'
require_relative './modules/music_album'
require_relative './modules/source'

class App
  def initialize(things)
    @things = things
  end

def list_music_albums
  count = 0
  puts 'Avaible music albums are:'
  @things.music_albums.each do |music_album|
    puts "#{count})This music album is in #{music_album.genre.name} genre and published at #{music_album.publish_date} and  #{music_album.on_spotify ? "available" : "not available"} on Spotify."
    count += 1 
  end
end

def create_music_album
  music_album = add_music_album
  genre = add_music_album_genre
  music_album.genre = genre
  @things.add_music_album(music_album)
  puts "Music album added successfully!"
end

def add_music_album
  print "Does music album avaible on the spotify? [Y/N]: "
  on_spotify = gets.chomp.downcase == 'y'
  puts "Enter music album's published date(format: YYYY/MM/DD): "
  published_date =  Date.parse(gets.chomp)
  music_album = MusicAlbum.new(on_spotify, published_date)
  return music_album
end

def add_music_album_genre
  create_genre
end

def create_genre
  print "Enter genre: "
  genre_name = gets.chomp
  genre = Genre.new(genre_name)
  @things.add_genre(genre)
  return genre
end

def create_labels
  print "Enter label name: "
  label_name = gets.chomp
  label = Label.new(label_name, 'Unkown')
  @things.add_label(label)
  return label
end

def list_genres
  puts 'Avaible genres are:'
  @things.genres.each do |genre|
    puts genre
  end
end
end
