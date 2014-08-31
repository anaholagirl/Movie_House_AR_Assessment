class Movie < ActiveRecord::Base
  has_many :customers
  belongs_to :rating
end
