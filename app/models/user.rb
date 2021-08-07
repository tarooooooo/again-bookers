class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :book_comments, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true, length: {minimum: 2,maximum: 20} , uniqueness: true
  validates :introduction, length: { maximum: 50 }



  def already_liked?(book)
    self.likes.exists?(book_id: book.id)
  end
end
