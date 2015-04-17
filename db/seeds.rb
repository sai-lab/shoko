# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_password = SecureRandom.hex 8
User.create email: 'shoko-admin@example.com', name: '書庫管理者', admin_flag: true, password: admin_password, password_confirmation: admin_password
print "\e[31m!! shoko-admin : #{admin_password} !!\e[0m\n"
