class Comment < ActiveRecord::Base
	belongs_to :post

	validates :name, :text, :presence => true
	validates :name, :length => { :minimum => 2 }
	validates :text, :length => { :minimum => 2 }
end
