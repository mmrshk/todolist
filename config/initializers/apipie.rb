Apipie.configure do |config|
  config.app_name                = "Todolist"
  config.api_base_url            = "/api/v1"
  config.doc_base_url            = "/apipie"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
  config.translate               = false
  config.default_locale          = nil
  config.show_all_examples       = true
end
