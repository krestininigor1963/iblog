class Comment < ApplicationRecord
include Visible

  #validates :user_id, presence: true
  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  belongs_to :article
  belongs_to :user
  #belongs_to :article, class_name: "Article", foreign_key: "article_id"
  #belongs_to :user, class_name: "User", foreign_key: "user_id"

end
