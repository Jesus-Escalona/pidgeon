class RelationsController < ApplicationController
	before_action :authenticate

	def index
		@followers = @logged_in_user.fans
		@followings = @logged_in_user.follows
	end
end
