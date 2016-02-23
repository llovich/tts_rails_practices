namespace :db do
  # description
  desc "Clear the DB and fill with excellent sample data"
  #names task
  task :populate => :environment do
    require 'populator'
    require 'faker'
    #clears out all db
    [Owner, Dog].each(&:destroy_all)

    #can do this bc we have already seeded out db w breeds
    Breed.all.each do |breed|
      #create 5 owners
      Owner.populate(5) do |owner|
        owner.name = Faker::Name.name
        owner.phone = Faker::PhoneNumber.cell_phone

      #Create varied number of dogs per owner
      Dog.populate(1..4) do |dog|
        dog.name = Faker::Hipster.word.titleize
        dog.age = Faker::Number.number(1)
        dog.breed_id = breed.id
        dog.owner_id = owner.id
      end
      end
    end
    puts "done"
  end
end