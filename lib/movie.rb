class Movie < ActiveRecord::Base
  has_many :customers,
           :dependent => :destroy,
           :foreign_key => 'movie_id'

  before_destroy :clear_customers
  belongs_to :rating

  validates :name, :presence => true

  scope :unsuitable, -> { joins(:rating).group('movies.id').merge(Rating.r_rating) }

  def clear_customers
    customers.clear
  end
 end
