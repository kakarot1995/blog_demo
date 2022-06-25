# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding production database..."
karlroy = User.first_or_create!(email: 'karl.v.basadre@gmail.com',
                            password: 'password',
                            password_confirmation: 'password',
                            first_name: 'Karlroy',
                            last_name: 'Basadre',
                            role: User.roles[:admin])
karl = User.first_or_create!(email: 'karl.v.basadre@gmail.com',
                              password: 'password',
                              password_confirmation: 'password',
                              first_name: 'Karl',
                              last_name: 'Basadre')
Address.first_or_create!(strees: '123 Main st',
                          city: 'Anytown',
                          state: 'CA',
                          zip: '12345',
                          country: 'USA',
                          user: karlroy)
Address.first_or_create!(strees: '123 Main st',
                          city: 'Anytown',
                          state: 'CA',
                          zip: '12345',
                          country: 'USA',
                          user: karl)

elapsed = Benchmark.measure do
posts = []
Karlroy = User.first
Karl = User.second
1000.times do |x|
      puts "Creating post #{x}"
      post = Post.new(title: "Title #{x}",
                      body: "Body #{x} Words go here Idk",
                      user: User.first)

  10.times do |y|
      puts "Creating comment #{y} for post #{x}"
      post.comments.build(body: "Comment #{y}",
                            user: User.second)
  end
  posts.push(post)
end
Post.import(posts)
end


puts "Seeded development DB in #{elapsed.real} seconds"
