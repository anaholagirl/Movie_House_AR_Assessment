class Movie < ActiveRecord::Base
  has_many :customers
  belongs_to :rating

  validates :name, :presence => true

  scope :r_movie, -> { where(rating: 'R')}
end
