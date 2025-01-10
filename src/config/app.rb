# frozen_string_literal: true

require 'hanami'
require 'warden'
module WeddingInvite
  class App < Hanami::App
    config.actions.sessions = :cookie, {
      key: 'wedding_invite.session',
      secret: settings.session_secret,
      expire_after: 60 * 60 * 24 * 365
    }

    config.middleware.use Warden::Manager do |manager|
      manager.default_strategies :password
      manager.failure_app =
        lambda do |env|
          Libus::Actions::AuthFailure::Show.new.call(env)
        end
    end
  end
end
