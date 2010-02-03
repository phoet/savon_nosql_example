# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nosql_session',
  :secret      => '7a71e6fff96bbc32abbc824743c1d529435f4bf6e7c829ed5b15352ff899566d8410000b94126939c309322ae3a8e5c788cec0f64a0a18a73cd2223ddeff6f4e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
