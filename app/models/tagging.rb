class Tagging < ActiveRecord::Base
  belongs_to :genre
  belongs_to :tv
  # attr_accessible :title, :body
end
