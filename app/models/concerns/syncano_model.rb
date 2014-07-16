module SyncanoModel
  extend ActiveSupport::Concern
  include ActiveAttr::Model

  included do
    attribute :id, type: Integer
  end

  module ClassMethods
    def all
      folder.data_objects.all.collect{ |data_object| new(data_object) }
    end

    def first
      new(folder.data_objects.first)
    end

    def last
      new(folder.data_objects.last)
    end

    def find(id)
      new(folder.data_objects.find(id))
    end

    private

    def folder
      raise NotImplementedError.new('You must implement folder method.')
    end
  end

  def initialize(params = {})
    if params.is_a?(Syncano::Resources::DataObject)
      super(params.attributes.merge(id: params.id))
    else
      params.delete(:id)
      super(params)
    end
  end

  def save
    saved = false

    if valid?
      data_object = persisted? ? self.class.folder.data_objects.find(id) : self.class.folder.data_objects.new
      data_object.attributes = attributes.except(:id)
      data_object.save

      if data_object.saved?
        self.id = data_object.id
        saved = true
      end
    end

    saved
  end

  def destroy
    data_object = self.class.folder.data_objects.find(id)
    data_object.destroy
    data_object.destroyed
  end

  def new_record?
    !persisted?
  end

  def persisted?
    id.present?
  end
end