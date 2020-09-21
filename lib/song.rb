
class Song 
    attr_accessor :name, :artist

    @@all = []
    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    ## create your song name and artist name from the file. be careful of weird charaters. use .strip if necessary
    ## sone can be created from new using the new name 
    # artist can be created from new using the artist name. look for any helper methods
    ## return the song 
    def self.new_by_filename(file_name)
        name = file_name.split(" - ")[1]
        artist = file_name.split(" - ")[0]
        song = Song.new(name)
        song.artist_name = artist 
        song 
    end

    ## create the song using helper methods

    def artist_name=(artist_name)
        song_artist = Artist.find_or_create_by_name(artist_name)
        @artist = song_artist
        @artist.add_song(self)  
    end 
end 