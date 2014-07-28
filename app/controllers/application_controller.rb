class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :get_years
	
	def get_years
	  posts = Post.all
	  @years = []  
	  if !posts.empty?
	    newer_year = posts[0].created_at.year
	    older_year = posts[-1].created_at.year
	    if older_year != newer_year
	      more_years =* (older_year..newer_year)
	      more_years.each do |aux|
	        @years.push(aux)
	      end
	    else
	      @years.push(newer_year)
	    end
	  end      
	end
end
