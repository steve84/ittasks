# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Technology.create(:title => 'PHP', :description => 'Description PHP')
Technology.create(:title => 'Ruby on Rails', :description => 'Description RoR')
Technology.create(:title => 'Java', :description => 'Description Java')

Category.create(:title => 'Web Services', :description => 'Description Web Services')
Category.create(:title => 'Security', :description => 'Description Security')
Category.create(:title => 'Design', :description => 'Description Design')
