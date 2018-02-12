# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Idea.destroy_all
User.destroy_all
Category.destroy_all

USERS = ['AtmaVichara', 'Dangodiply', 'Pinkrando', 'Megamess']
EMAILS = ['rando@gmail.com', 'someother@hotmail.com', 'gipsycrypto@yahoo.com', 'authcash@gmail.com']
CATEGORIES = ['World Domination', 'Grand Mistakes', 'Epiphanies', 'Childish Banter']


USERS.each_with_index do |user, index|
  User.create!(username: user, email: EMAILS[index], password: 'password')
end

CATEGORIES.each do |cat|
  Category.create!(name: cat)
end

CSV.foreach("./data/ideas.csv", headers: true) do |row|
  Idea.create!(
    title: row[0],
    body: row[1],
    category_id: Category.all.sample.id,
    user_id: User.all.sample.id
  )
end
