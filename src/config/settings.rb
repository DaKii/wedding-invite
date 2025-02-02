# frozen_string_literal: true

module WeddingInvite
  class Settings < Hanami::Settings
    # Define your app settings here, for example:
    #
    # setting :my_flag, default: false, constructor: Types::Params::Bool

    setting :database_url, constructor: Types::String
    setting :db_username, constructor: Types::String
    setting :db_password, constructor: Types::String
    setting :session_secret, constructor: Types::String
  end
end
