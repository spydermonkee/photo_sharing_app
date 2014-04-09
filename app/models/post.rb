class Post < ActiveRecord::Base
  has_many :tags
  belongs_to :user

  has_attached_file :photo
  validates_attachment :photo, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end
