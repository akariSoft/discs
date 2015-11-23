require 'dragonfly'
require 'dragonfly-activerecord/store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "949587a77c5a871a8fc3e7b50138792bbfdfefe5ee270818a60b5578c425a557"

  url_format "/media/:job/:name"

  # datastore :file,
  #   root_path: Rails.root.join('public/system/dragonfly', Rails.env),
  #   server_root: Rails.root.join('public')

  datastore Dragonfly::ActiveRecord::Store.new
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
