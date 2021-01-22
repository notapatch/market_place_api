class Order < ApplicationRecord
  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  validates :total, presence: true

  before_validation :set_total!

  def set_total!
    self.total = products.map(&:price).sum
  end

  # @param product_ids_and_quantities [Array<Hash>] something like this
  # `[{product_id: 1, quantity: 2}]`
  # @yield [Placement] placements build
  def build_placements_with_product_ids_and_quantities(product_ids_and_quantities)
    product_ids_and_quantities.each do |product_id_and_quantity|
      placement = placements.build(product_id: product_id_and_quantity[:product_id])
      yield placement if block_given?
    end
  end
end
