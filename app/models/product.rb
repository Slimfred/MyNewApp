class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :name, presence: true
  validates :price_in_cents, numericality: { only_integer: true }

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  # Gets the number of views for a product
  def views
    $redis.get("product:#{id}")
  end

  # Increments the number of views for a product
  def viewed!
    $redis.incr("product:#{id}")
  end

end
