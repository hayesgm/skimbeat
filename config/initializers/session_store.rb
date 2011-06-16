# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_skimbeat_session',
  :secret      => '8b5aa2a6930fc2e523af40dc30dac09c406205fca2ff52116dc27556b6f5bbb707ed0a93c2bb30f6399a423fccc99121c47abd500100838098305db7b33d66a3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
