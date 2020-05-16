# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.create(name: 'Spike', birth_date: '2015/01/20', color: 'brown', sex: 'M', description: "It's a cat")

Cat.create(name: 'Sakana', birth_date: '2017/01/21', color: 'black', sex: 'M', description: "It's a fish")

Cat.create(name: 'Rocky', birth_date: '2011/03/10', color: 'orange', sex: 'F', description: "It's another cat")