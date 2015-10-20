class User < ActiveRecord::Base

  # validates_presence_of :email,
  #                       :username,
  #                       :password

  # validates_uniqueness_of :email,
  #                         :username

  has_many :songs, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

end