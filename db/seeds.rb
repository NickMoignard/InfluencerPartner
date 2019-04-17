# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Creators
Creator.create([
    {:name => 'Swagger Souls', :code => 'swagger', :profit_share => :profit },
    {:name => 'INoToRiOuS', :code => 'inut', :profit_share => :profit },
    {:name => 'Fitz', :code => 'fitz', :profit_share => :profit },
    {:name => 'Anything4Views', :code => 'views', :profit_share => :profit }
])

ProductTag.create({:tag => 'merch'})