class Post < ActiveRecord::Base
	has_many :comments

	default_scope { order('created_at DESC') }	
end
