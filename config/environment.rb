# Load the rails application
require File.expand_path('../application', __FILE__)


##############################
## todo/fix: add somewhere else? better place? why? why not?

# logging config
# todo/fix: configure logging here - find a better place??
# use just an initializer??
require 'logutils/db' # LogDb n LogDb::Models
require 'logutils/server' # LogDb::Server
LogUtils::Logger.root.level = :info # do not output debug msgs



# Initialize the rails application
Beerday::Application.initialize!
