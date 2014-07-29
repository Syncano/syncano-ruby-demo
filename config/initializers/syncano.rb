# Syncano instance name
SYNCANO_INSTANCE_NAME = ENV['SYNCANO_INSTANCE_NAME']
# Syncano api key
SYNCANO_API_KEY = ENV['SYNCANO_API_KEY']
# Syncano ActiveRecord
SYNCANO_ACTIVERECORD_COLLECTION = Syncano.client.projects.first.collections.first