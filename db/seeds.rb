# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

Role.create(name: 'LeadGenerator') if Role.where(name: 'LeadGenerator').last.blank?
Role.create(name: 'Manager') if Role.where(name: 'Manager').last.blank?
Role.create(name: 'Admin') if Role.where(name: 'Admin').last.blank?

EmailTemplate.create(content: 'Hi welcome to the board', subject: 'welcome to the board')
EmailTemplate.create(content: 'Hi, Please let us know', subject: 'reminder')

User.create(name: 'admin', email: 'admin@yopmail.com', password: '123456', password_confirmation: '123456', role_id: 3)
User.create(name: 'manager', email: 'manager@yopmail.com', password: '123456', password_confirmation: '123456', role_id: 2)
User.create(name: 'leadgenerator', email: 'lg@yopmail.com', password: '123456', password_confirmation: '123456', role_id: 1)