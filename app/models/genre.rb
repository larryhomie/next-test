class Genre < ActiveRecord::Base
  attr_accessible :name

  has_many :taggings
  has_many :tvs, through: :taggings
end
