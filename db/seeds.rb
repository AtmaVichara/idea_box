# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Idea.destroy_all
Image.destroy_all
User.destroy_all
Category.destroy_all

IMAGES = [["red panda", "http://www.freepngimg.com/download/red_panda/8-2-red-panda-transparent.png"],
          ["one punch man", "http://img1.ak.crunchyroll.com/i/spire3/3614810e9ada5235038e8deb4adc264c1447729591_large.jpg"],
          ["socrates", "https://joaomfjorge.files.wordpress.com/2015/06/philosophy-icon.png"],
          ["weightlifting", "https://www.spreadshirt.com/image-server/v1/mp/designs/13409433,width=178,height=178/weightlifter-weightlifting-woman.png"],
          ["meditation", "https://d30y9cdsu7xlg0.cloudfront.net/png/17148-200.png"]]
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

IMAGES.each do |image|
  Image.create!(image_url: image[1], name: [0])
end
