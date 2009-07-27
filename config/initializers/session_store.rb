# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ava-system_session',
  :secret      => 'b5834f1cc8ab47479cb531463535716a233e364124b4ee5351ee5e216c4814956314a90981fdf5b65615179a95c56b4240a6d56ce8e32f67684a16bc1abd96a1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
