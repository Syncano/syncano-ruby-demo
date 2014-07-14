class NotificationSetting < ActiveRecord::Base
  # ----------------------------------------------------------------------
  # Associations
  # ----------------------------------------------------------------------
  belongs_to :category
  belongs_to :user

  # ----------------------------------------------------------------------
  # Validations
  # ----------------------------------------------------------------------
  validates :category, presence: true
  validates :user, presence: true
end
