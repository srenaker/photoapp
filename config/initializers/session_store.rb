# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_photoalbums_session',
  :secret      => 'fc566aa3e0696d87766675894356c8e51458f452c7d1c8b04be1dee8fd7f873d0db6aa3ad5bf7864e018c04905f02159e152d6bb45570704ca7acbc437998cee'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
