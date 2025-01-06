# frozen_string_literal: true

require 'hanami'
module WeddingInvite
  class App < Hanami::App
    config.actions.sessions = :cookie, {
      key: 'wedding_invite.session',
      secret: settings.session_secret,
      expire_after: 60 * 60 * 24 * 365
    }
  end
end
