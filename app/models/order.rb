class Order < ApplicationRecord
  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  validates :total, presence: true

  before_validation :set_total!

  def set_total!
    self.total = products.map(&:price).sum
  end
end
