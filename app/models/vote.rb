class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :song

  validates :song_id, presence: true

  # after_save :update_vote_points

  # def update_vote_points
  #   self.vote == true ? self.song.points += 1 : self.song.points -= 1
  #   self.song.save
  # end

end