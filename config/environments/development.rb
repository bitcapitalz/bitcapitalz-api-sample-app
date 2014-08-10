DoorkeeperDeviseClient::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  #config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
end

#DOORKEEPER_APP_ID = "0b75bbb82196c1855519be5ebeb96dd7d3935f470c813313a10fd2d2babb023d"
#DOORKEEPER_APP_SECRET = "e2caeb2d8d6a5118e0eda8651af4007bbfdf4b0353021e09e089d6707aca756a"
#DOORKEEPER_APP_URL = "http://ja.bitcapitalz.dev:3000"


DOORKEEPER_APP_ID = "8fc695aa5cf36a738495e89a45ab20359fe045b3628c8029ff92d5c563cd7467"
DOORKEEPER_APP_SECRET = "cca68f27db51abda1e14da0e4f2c7546e1b65e54f3c402a7d81862be038a8b9e"
DOORKEEPER_APP_URL = "https://ja.bitcapitalz.com"


#DOORKEEPER_APP_ID = "cc3b64147eba0c77ede2aceb10d0887a667405737004dea6d6eb7510604143cd"
#DOORKEEPER_APP_SECRET = "63d05e8abb7a92fb60de89ee081132fea2ffbbc046af0b9bc130851e78ade22c"
#DOORKEEPER_APP_URL = "https://doorkeeper-provider.herokuapp.com"
