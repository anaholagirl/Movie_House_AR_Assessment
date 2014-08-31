class Movie < ActiveRecord::Base
  has_many :customers
  belongs_to :rating

  validates :name, :presence => true

  scope :unsuitable, -> { joins(:rating).group('movies.id').merge(Rating.r_rating) }
 end
