class Customer < ActiveRecord::Base
  belongs_to :movie

  validates :name, :presence => true
end
