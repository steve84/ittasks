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

Role.create(:name => 'Admin', :description => 'Administrator of the service')
Role.create(:name => 'User', :description => 'Principal')
Role.create(:name => 'Abo1', :description => 'Students/RAV')
Role.create(:name => 'Abo2', :description => 'Freelancer')
Role.create(:name => 'Abo3', :description => 'Companies')

user = User.new
user.email = 'admin@ittask.com'
user.password = '12345678'
user.password_confirmation = '12345678'
user.role_id = 1
user.name = 'Admin'
user.location = Location.new
user.location.update(:street => 'Golden Gate', :plz => '1234', :city => 'San Francisco', :country => 'USA')
user.save!

user = User.new
user.email = 'user@ittask.com'
user.password = '12345678'
user.password_confirmation = '12345678'
user.role_id = 2
user.name = 'User'
user.location = Location.new
user.location.update(:street => 'Bahnhofstrasse', :plz => '8000', :city => 'Zürich', :country => 'Switzerland')
user.save!

for i in 1..10
	user = User.new
	user.email = 'abo' + i.to_s() + '@ittask.com'
	user.password = '12345678'
	user.password_confirmation = '12345678'
	user.role_id = 3
	user.name = 'Abo ' + i.to_s()
	user.location = Location.new
	user.location.update(:street => 'Kirchstrasse', :plz => '2540', :city => 'Grenchen', :country => 'Schweiz')
	user.save!
end

for i in 1..100
	Task.create(:title => 'Task '+i.to_s(), :description => 'Description '+i.to_s(), :principal_id => 1 + rand(10), :start => Time.now, :end => Time.now)
end

for i in 1..100
	for j in 3..10
		Offer.create(:remark => 'Remark '+i.to_s(), :amount => rand(1000), :task_id => i, :user_id => j)
	end
end
