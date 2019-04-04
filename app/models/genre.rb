class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    Slugifiable.call(self.name)
  end

  def self.find_by_slug(string)
      value = string.split("-").join(" ")
      self.where("lower(name) = ?", value ).first
   end

end
