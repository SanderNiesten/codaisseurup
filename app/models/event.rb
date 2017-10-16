class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }

  def bargain?
    price < 30
  end

  def self.order_by_price
    order(:price)
  end

  def self.alphabetical
    order(name: :asc)
  end

  scope :active, -> { where(active: true) }



# onderstaand van een opdracht op maandag 16 oktober
#  scope :starts_before_ends_after, ->(starts_at, ends_at) {
#  where('starts_at < ? AND ends_at > ?', starts_at, ends_at)
#}
end
