# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cheers_session',
  :secret      => '20706541be82085fea9a8dd2f9ad9bfaf085d662e361774ecf65d91e309464e25e4d06cf7d42c26c8ddccb1906b446a273b925c21654da8eeedee1b58c55492e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
