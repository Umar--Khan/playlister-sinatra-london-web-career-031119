class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    Slugifiable.call(self.name)
  end

  def self.find_by_slug(string)
    # convert slug to name
    # self.find_by(name: params[:slug].downcase)
    value = string.split("-").join(" ")
    self.where("lower(name) = ?", value ).first
    # where(name: /^#{name.slug}$/i)
   end

    # binding.pry
    # "ada"

   
end
