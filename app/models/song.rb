class Song < ActiveRecord::Base

  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true

  after_create :default_zero_votes

  # def vote_count
  #   self.votes.size
  # end

  # def comment_count
  #   self.comments.size
  # end

  # validates :url, allow_blank: true, format: { :with => /\A(https?:\/\/)([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?/i, :message => "not valid! Please include http://"}

  def default_zero_votes
    self.votes = 0 unless self.votes
    self.save
  end

  # def average_rating
  #   self.reviews.average(:rating)
  # end

end