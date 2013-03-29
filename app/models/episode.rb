class Episode < ActiveRecord::Base
  
  attr_accessible :season, :title, :tv_id

  validates :tv_id,  :presence => true
  validates :title,  :presence => true
  validates :season, :presence => true

  belongs_to :tv

  #scope
  scope :all
end
