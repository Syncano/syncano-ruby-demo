class User < ActiveRecord::Base
  # ----------------------------------------------------------------------
  # Devise
  # ----------------------------------------------------------------------
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # ----------------------------------------------------------------------
  # Associations
  # ----------------------------------------------------------------------
  has_one :profile, dependent: :destroy
  has_many :notification_settings

  # ----------------------------------------------------------------------
  # Attributes
  # ----------------------------------------------------------------------
  accepts_nested_attributes_for :profile

  # ----------------------------------------------------------------------
  # Methods
  # ----------------------------------------------------------------------
  def notification_settings
    NotificationSetting.by_user_id(id)
  end
end