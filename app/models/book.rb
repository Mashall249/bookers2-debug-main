class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :title, presence:true
  validates :body, presence:true, length:{maximum:200}

  after_create do
    user.followers.each do |follower|
      notifications.create(user_id: follower.id)
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(name: content)
    elsif method == 'forward'
      Book.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Book.where('name LIKE ?', '%' + content)
    else
      Book.where('name LIKE ?', '%' + content + '%')
    end
  end
end
