
#config/initializers/session_store.rb
if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_houses-api1', domain: 'https://houses-api1.herokuapp.com/'
  else
Rails.application.config.session_store :cookie_store, key: '_houses-api1'
  end