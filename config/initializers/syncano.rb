# # Syncano instance name
# SYNCANO_INSTANCE_NAME = 'instance_name'
# # Syncano api key
# SYNCANO_API_KEY = 'api_key'


# Syncano instance name
SYNCANO_INSTANCE_NAME = 'ancient-tree-409330'
# Syncano api key
SYNCANO_API_KEY = 'f527ab610cc0748b37f6c4b54dcf0dcb21675f0a'

SYNCANO_CLIENT = Syncano.client
SYNCANO_PROJECT = SYNCANO_CLIENT.projects.find(1540)
SYNCANO_COLLECTION = SYNCANO_PROJECT.collections.first