class Tv < ActiveRecord::Base
  attr_accessible :story, :title, :genre_list

  validates :title,  :presence => true
  validates :story, :presence => true

  has_many :episodes, :dependent => :destroy

  has_many :taggings
  has_many :genres, through: :taggings

  def self.tagged_with(name)
  	Genre.find_by_name!(name).tvs
  end

  def self.genre_counts
  	Genre.select("genres.*, count(taggings.genre_id) as count").joins(:taggings).group("taggings.genre_id")
  end

  def genre_list
  	genres.map(&:name).join(", ")
  end

  def genre_list=(names)
  	self.genres = names.split(", ").map do |n|
  		Genre.where(name: n.strip).first_or_create!
  	end
  end

  def self.search(search)
    if search
      where 'title LIKE ?', "%#{search}%"
    else
      scoped
    end
  end

end
