class Post < ActiveRecord::Base
  attr_accessible :content, :title
 	validates :title, :content, presence: true
	validates :title, length: { minimum: 5 }

	has_many :comments, dependent: :destroy
end
