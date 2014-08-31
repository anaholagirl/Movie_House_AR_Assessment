class Rating < ActiveRecord::Base
  has_many :movies

  validates :name, :presence => true

  scope :r_rating, -> { where(name: 'R')}
end
