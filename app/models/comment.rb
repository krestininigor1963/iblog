class Comment < ApplicationRecord
include Visible


  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  #validates :body, length: { minimum: 10 }, presence: true
  belongs_to :article
end
