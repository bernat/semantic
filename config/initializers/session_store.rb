# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_semantic_session',
  :secret => 'c1d8b83e91cd676143e64094884a57c25b4a0ef0ac46ec59616d44ca69de40b6477284fd052cba199cd3bbfdfba7c4be5a55b8d0fc07e3dbfc7b380ef854fe9f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
