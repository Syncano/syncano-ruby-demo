class Auction < Syncano::ActiveRecord::Base
  # ----------------------------------------------------------------------
  # Associations
  # ----------------------------------------------------------------------
  belongs_to :category

  # ----------------------------------------------------------------------
  # Attributes
  # ----------------------------------------------------------------------
  attribute :title, type: String
  attribute :text, type: String
  attribute :user_id, type: Integer, filterable: :data1
  attribute :price, type: Integer, filterable: :data2

  # ----------------------------------------------------------------------
  # Validations
  # ----------------------------------------------------------------------
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :title, presence: true
  validates :text, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  # ----------------------------------------------------------------------
  # Scopes
  # ----------------------------------------------------------------------
  scope :by_user_id, ->(user_id) { where('user_id = ?', user_id) }
  scope :by_category_id, ->(category_id) { where('category_id = ?', category_id) }
  scope :by_price_between, ->(min_price, max_price) { where('price >= ? AND price <= ?', min_price, max_price) }

  # ----------------------------------------------------------------------
  # Methods
  # ----------------------------------------------------------------------
  def belongs_to_user?(user)
    user_id == user.try(:id)
  end
end