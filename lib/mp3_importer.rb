class MP3Importer 
    attr_accessor :path, :song 

    @@all = []
## accepts a file path to parse mp3 files 

    def initialize(path)
        @path = path
        @@all << self 
    end 

    ## loads all of mp3 files to the path directory 
    ##normalizes the file name to just the mp3 filename with na path 
    def files 
        @files = Dir.glob("#{path}/*.mp3")
        @files.collect! {|filename| filename.gsub(/#{path}\//, "")}
        @files
    end 

    def import
        self.files.each {|file_name| Song.new_by_filename(file_name)}
    end
end 