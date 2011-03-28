# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ibctut_session',
  :secret      => '25743d428c97b15691ef13a4664fbe7081ffad33c272e6b0cc61c353bdd98d265cfd3fe7a06120bfe48ceb49da07a2a2647bd77dbfb3e4e00c5bf9a40a1e1b19'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
