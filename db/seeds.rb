# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.delete(User.all)

User.create(name: 'Zaccarias',
  photo: 'https://unsplash.com/photos/tAvpDE7fXgY',
  bio: 'Graphic Designer and Ruby on Rails educator')

User.create(name: 'Shydra',
  photo: 'https://unsplash.com/photos/i2hoD-C2RUA',
  bio: 'Train smasher and Rails developer')

User.create(name: 'Eustela',
  photo: 'https://unsplash.com/photos/_H6wpor9mjs',
  bio: 'Guardian of the bakes and Ruby on Rails philosopher')

Post.create(title: 'First Post', text: 'This is the first post', author_id: 1)
Post.create(title: 'Second Post', text: 'This is the second post', author_id: 1)
Post.create(title: 'Third Post', text: 'This is the third post', author_id: 1)

Comment.create(author_id: 1, post_id: 1, text: 'Super cool post')
Comment.create(author_id: 1, post_id: 1, text: 'Exquisite post!')
Comment.create(author_id: 1, post_id: 1, text: 'I love this post!')
Comment.create(author_id: 1, post_id: 1, text: 'This post is amazing!')
Comment.create(author_id: 1, post_id: 1, text: 'This post is INSANE!')
Comment.create(author_id: 1, post_id: 1, text: 'This post is the best!')
Comment.create(author_id: 1, post_id: 1, text: 'This post is LEGIT!')
