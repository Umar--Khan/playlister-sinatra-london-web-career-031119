class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    Slugifiable.call(self.name)
  end

  def self.find_by_slug(string)
      value = string.split("-").join(" ")
      self.where("lower(name) = ?", value ).first
   end
end
