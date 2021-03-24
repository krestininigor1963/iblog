class Article < ApplicationRecord
include Visible

	validates :title, presence: true
	validates :body, length: { minimum: 10 }, presence: true
	has_many :comments, dependent: :destroy
end

