class NotificationSetting < ActiveRecord::Base
  # ----------------------------------------------------------------------
  # Associations
  # ----------------------------------------------------------------------
  belongs_to :category
  belongs_to :user

  # ----------------------------------------------------------------------
  # Callbacks
  # ----------------------------------------------------------------------
  before_save :default_values

  # ----------------------------------------------------------------------
  # Validations
  # ----------------------------------------------------------------------
  validates :category, presence: true
  validates :user, presence: true

  # ----------------------------------------------------------------------
  # Scopes
  # ----------------------------------------------------------------------
  scope :by_price, -> (price) { where('min_price <= ? AND max_price >= ?', price, price) }

  private

  def default_values
    self.min_price ||= 0
  end
end