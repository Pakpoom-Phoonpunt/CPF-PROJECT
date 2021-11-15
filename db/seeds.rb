# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
factory = Factory.create(name:"CPF")
department = Department.create(name:"chicken", factory_id: factory.id)
user= Account.create(name: "Im ma Manager", username: "manager", password: "1", factory_id: factory.id, role: "Manager")

user2= Account.create(name: "Im ma Admin", username: "admin", password: "1", factory_id: factory.id, role: "Admin")