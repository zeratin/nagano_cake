# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 Admin.create(email: 'admin@mail', password: 'password')
 Customer.create(email: 'test@test', password: '000000', postal_code: '0000000', address: '大阪府大阪市東淀川区', telephon_number: '09000000000')