# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mom = Creator.create(name:"Mom")
dad = Creator.create(name:"Dad")
child = Creator.create(name:"Child")

Activity.create(title:"Swim", description:"at the beach", author_id:mom.id)
Activity.create(title:"bike", description:"from home", author_id:dad.id)
Activity.create(title:"fly kites", description:"at the park", author_id:child.id)