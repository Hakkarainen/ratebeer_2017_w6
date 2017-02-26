class Beer < ActiveRecord::Base
  include RatingAverage
  
  belongs_to :brewery
  belongs_to :style
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { uniq }, through: :ratings, source: :user

  validates :name, presence: true
  validates :style_id, presence: true

  def to_s
    "#{name} #{brewery.name}"
  end

  def self.top(n)
    sorted_by_rating_in_desc_order = Beer.all.sort_by{ |b| -(b.average_rating || 0) }
    sorted_by_rating_in_desc_order[0, n]
  end

  def best_beers
  return nil if ratings.empty?
  ratings_of_beers = ratings.group_by { |r| r.beer }
  averages_of_beers = []
  ratings_of_beers.each do |brewery, ratings|
  averages_of_beers << {
       brewery: brewery,
       rating: ratings.map(&:score).sum / ratings.count.to_f
   }
    end
 end

  def best_breweries
    return nil if ratings.empty?

    ratings_of_breweries = ratings.group_by { |r| r.beer.brewery }
    averages_of_breweries = []
    ratings_of_breweries.each do |brewery, ratings|
      averages_of_breweries << {
          brewery: brewery,
          rating: ratings.map(&:score).sum / ratings.count.to_f
      }
    end
  end
end