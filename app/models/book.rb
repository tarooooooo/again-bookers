class Book < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :book_comments, dependent: :destroy
  
  validates :title , presence: true
  validates :body , length: {maximum: 200}, presence: true
  
  def self.looks(searches, words)
    if searches == "perfect_match"
      @book = Book.where("title LIKE ?", "#{words}")
    elsif searches == "forward_match"
      @book = Book.where("title LIKE ?", "#{words}%")
    elsif searches == "backword_match"
      @book = Book.where("title LIKE ?", "#{words}")
    else
      @book = Book.where("title LIKE ?", "%#{words}%")
    end
  end
end
