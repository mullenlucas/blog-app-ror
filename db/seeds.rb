# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.delete(User.all)

User.create(name: 'Zaccarias',
  photo: 'https://unsplash.com/photos/tAvpDE7fXgY',
  bio: 'Graphic Designer and Ruby on Rails educator')

User.create(name: 'Shydra',
  photo: 'https://unsplash.com/photos/i2hoD-C2RUA',
  bio: 'Train smasher and Rails developer')

User.create(name: 'Eustela',
  photo: 'https://unsplash.com/photos/_H6wpor9mjs',
  bio: 'Guardian of the bakes and Ruby on Rails philosopher')
