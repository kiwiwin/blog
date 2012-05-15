class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :commenter

	validates :body, :commenter, presence: true
end
