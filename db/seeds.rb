# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: 'Admin')
Role.create(name: 'Developer')
User.create(email: 'admin@gmail.com', password: '123456', role_id: 1)
User.create(email: 'dev1@gmail.com', password: '123456', role_id: 2, name: 'Developer1')
User.create(email: 'dev2@gmail.com', password: '123456', role_id: 2, name: 'Developer2')
User.create(email: 'dev3@gmail.com', password: '123456', role_id: 2, name: 'Developer3')
User.create(email: 'dev4@gmail.com', password: '123456', role_id: 2, name: 'Developer4')