class Auction
  include SyncanoModel

  # ----------------------------------------------------------------------
  # Attributes
  # ----------------------------------------------------------------------
  attribute :user_id, type: Integer
  attribute :title, type: String
  attribute :description, type: String
  attribute :price, type: Float

  # ----------------------------------------------------------------------
  # Validations
  # ----------------------------------------------------------------------
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  # ----------------------------------------------------------------------
  # Methods
  # ----------------------------------------------------------------------
  def belongs_to_user?(user)
    user_id == user.try(:id)
  end

  private

  def self.folder_name
    'Auctions'
  end

  def self.folder
    SYNCANO_COLLECTION.folders.find_by_name(folder_name)
  end
end