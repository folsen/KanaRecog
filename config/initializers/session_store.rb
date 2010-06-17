# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kanarecog_session',
  :secret      => '99e53a8d09057ed61a58b871d2ff756d67f01030cf115db22a1bce3808eb55e7305c93c95fe1079ff6e1344ae8e34595bb4c9e4246536ff594dc419c06b6bcd0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
