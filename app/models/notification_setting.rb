class NotificationSetting < Syncano::ActiveRecord::Base
  # ----------------------------------------------------------------------
  # Associations
  # ----------------------------------------------------------------------
  belongs_to :category

  # ----------------------------------------------------------------------
  # Attributes
  # ----------------------------------------------------------------------
  attribute :user_id, type: Integer, filterable: :data1
  attribute :min_price, type: Integer, filterable: :data2
  attribute :max_price, type: Integer, filterable: :data3

  # ----------------------------------------------------------------------
  # Validations
  # ----------------------------------------------------------------------
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :min_price, presence: true, numericality: { only_integer: true }
  validates :max_price, presence: true, numericality: { only_integer: true }

  # ----------------------------------------------------------------------
  # Scopes
  # ----------------------------------------------------------------------
  scope :by_price, -> (price) { where('min_price <= ? AND max_price >= ?', price, price) }
  scope :by_user_id, -> (user_id) { where('user_id = ?', user_id) }

  # ----------------------------------------------------------------------
  # Methods
  # ----------------------------------------------------------------------
  def user
    User.find_by_id(user_id)
  end

  def user=(object)
    self.user_id = User.find_by_id(object.id).try(:id)
  end
end