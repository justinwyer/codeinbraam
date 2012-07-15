# Load the rails application
require File.expand_path('../application', __FILE__)
require 'active_record/connection_adapters/postgresql_adapter'

# Initialize the rails application
Twit::Application.initialize!
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter::NATIVE_DATABASE_TYPES[:primary_key] = "bigserial primary key"