namespace :db do
  # description
  desc "Clear the DB and fill with excellent sample data"
  #names task
  task :populate => :environment do
    require 'populator'
    require 'faker'
    #clears out all db
    [Artist, Song].each(&:destroy_all)

    #can do this bc we have already seeded out db w genres
    Genre.all.each do |genre|
      #create
      Artist.populate(5) do |artist|
        artist.name = Faker::App.name
        artist.genre_id = genre.id

      #Create varied number of songs per artist
      Song.populate(8..16) do |song|
        song.title = Faker::Hipster.words(3).join(' ')
        song.artist_id = artist.id
      end
      end
    end
    puts "done"
  end
end