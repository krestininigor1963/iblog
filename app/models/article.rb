class Article < ApplicationRecord
include Visible

    #validates :user_id, presence: true
	validates :title, presence: true
	validates :body, length: { minimum: 10 }, presence: true
	
	belongs_to :user
	has_many :comments, dependent: :destroy
end

