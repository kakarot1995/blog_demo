# run seed file base environment
puts "Seeding database"
load(Rails.root.join('do', 'seeds', "#(Rails.env.downcase).rb"))
