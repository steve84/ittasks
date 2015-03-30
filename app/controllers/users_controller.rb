class UsersController < ApplicationController
	before_action :get_users, only: :index
	before_action :get_user, only: :show

	def index
	end

	def show
	end

	private
		def get_users
			@users = User.all.page(params[:page]).per(5)
			@avg_ratings = Hash.new
			@users.each do |user|
				ratings = Array.new
				tasks = Task.where('principal_id = ?', user.id)
				tasks.each do |task|
					rate = task.rates('overall')
					if rate.size > 0
						ratings << task.rates('overall').first.stars
					end
				end
				if ratings.size > 0
					@avg_ratings[user.id.to_s()] = ( ratings.sum() / ratings.size() )
				else
					@avg_ratings[user.id.to_s()] = 0
				end
			end 


		end

		def get_user
			@user = User.find(params[:id])
		end
end
