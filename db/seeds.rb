# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pet.create(name: "John", breed: "Corgi", animal_type: "Dog", shelter_id: 1, is_adopted: false, picture_url: "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")
Pet.create(name: "Toad", breed: "Tucan", animal_type: "Bird", shelter_id: 1, is_adopted: true, picture_url: "https://i.pinimg.com/originals/36/b3/6c/36b36cd49ea02d950bf980e7d38ac247.jpg")
Pet.create(name: "Low", breed: "Pug", animal_type: "Dog", shelter_id: 1, is_adopted: false, picture_url: "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")
Pet.create(name: "John", breed: "Corgi", animal_type: "Dog", shelter_id: 1, is_adopted: true, picture_url: "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")