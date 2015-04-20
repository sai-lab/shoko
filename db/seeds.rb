# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create email: 'shoko-admin@example.com', name: '書庫管理者', admin_flag: true, password: 'password', password_confirmation: 'password'
print "\e[31m!! shoko-admin : password !!\e[0m\n"
