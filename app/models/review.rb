class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, presence: true
  validates_numericality_of :rating
  validates_inclusion_of :rating, :in => 0..5
  # @rating = Rating.where( :rating => (1..5) )

end

# @foo = Foo.where( :number => (min..max) )
