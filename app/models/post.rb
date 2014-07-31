class Post < ActiveRecord::Base
	has_many :comments

	validates :name, :text, :presence => true
	validates :name, :length => { :minimum => 2 }
	validates :text, :length => { :minimum => 2 }

	default_scope { order('created_at DESC') }	
end
