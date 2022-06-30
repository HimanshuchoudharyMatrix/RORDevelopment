class Post < ApplicationRecord
    paginates_per 25
    
    has_many :comments, as: :commentable, dependent: :destroy
    belongs_to :user
    
    has_attached_file :image
    validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }, presence: true
   
    validates :title, presence: true
    
    validates :description, length: { maximum: 1000} ,presence: true

   
    scope :published, -> { where( published: true ) }
    scope :unpublished, -> { where( published: false ) }

    
end
