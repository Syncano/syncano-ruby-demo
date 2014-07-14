class User < ActiveRecord::Base
  # ----------------------------------------------------------------------
  # Devise
  # ----------------------------------------------------------------------
  # :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
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
end
