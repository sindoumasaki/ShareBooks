class Book < ApplicationRecord
  # アソシエーション=================================================
  belongs_to :user
  belongs_to :book_big_genre
  has_many :comments,           dependent: :destroy
  has_many :book_favorites,     dependent: :destroy

  # バリデーション===================================================
  validates :title,   presence: true
  validates :digest,  presence: true

  # 画像投稿のための記述=============================================
  attachment :book_image

  # 引数のuserがいいねしているかどうか確認するメソッド===============
  def book_favorited_by?(user)
    book_favorites.where(user_id: user.id).exists?
  end

# いいねランキングのメソッド
  def self.book_top3
    Book.find(BookFavorite.joins(:book).group(:book_id).order('count(book_id) DESC').limit(3).pluck(:book_id))
  end

  def self.book_top10
    Book.find(BookFavorite.joins(:book).group(:book_id).order('count(book_id) DESC').limit(10).pluck(:book_id))
  end

  # 本日の新規投稿を検索するメソッド
  scope :new_books, -> { where(created_at: Time.zone.now.all_day)}
end
