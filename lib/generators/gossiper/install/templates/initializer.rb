<%- test_folder = defined?(RSpec) ? 'rspec' : 'test' -%>
Gossiper.configure do |config|
  # Change the default user class
  config.default_notification_user_class = 'User'

  # change the default class of the configurations
  config.default_notification_config_class = 'Gossiper::EmailConfig'

  # email the email sender
  config.default_from = 'from@example.com'

  # The list of emails to send copies to
  # config.default_cc   = ['user@example.com']

  # The list of emails to send hidden copies to
  # config.default_bcc   = ['user@example.com']

  # change the path where the notifications should be placed
  config.notifications_root_folder = Rails.root.join('app/models')

  # the notifications test folder
  config.notifications_test_folder = Rails.root.join("<%= test_folder %>", "models")

  # The process to be run before a controller action is executed
  # Can also implemented in the application controller
  # by ovewriting the ApplicationController::gossiper_authorization
  #
  # See: Gossiper::ApplicationController#gossiper_authorization
  #
  config.authorize_with do
    # Example:

    # unless current_user.is_admin?
    #   redirect_to root_path, notice: 'Get outta here!'
    # end
  end
end
