# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Idea.destroy_all

USERS = ['AtmaVichara', 'Dangodiply', 'Pinkrando', 'Megamess']
EMAILS = ['rando@gmail.com', 'someother@hotmail.com', 'gipsycrypto@yahoo.com', 'authcash@gmail.com']
PASSWORDS = ['password', '123456789']


CSV.foreach("./data/ideas.csv", headers: true) do |row|
  Idea.create!(title: row[0], body: row[1])
end
