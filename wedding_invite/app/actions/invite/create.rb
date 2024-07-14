# frozen_string_literal: true

module WeddingInvite
  module Actions
    module Invite
      class Create < WeddingInvite::Action
        require 'net/smtp'

        include Deps['persistence.rom']

        TEST_MESSAGE = <<-MESSAGE_END
        From: Private Person <me@fromdomain.com>
        To: A Test User <test@todomain.com>
        MIME-Version: 1.0
        Content-type: text/html
        Subject: SMTP e-mail test

        This is an e-mail message to be sent in HTML format

        <b>This is HTML message.</b>
        <h1>This is headline.</h1>
        MESSAGE_END

        class << self
          def send_email
            Net::SMTP.start('smtp-mail.outlook.com', 587, 'localhost', 'jmzquiapos@outlook.com', password,
                            :login) do |smtp|
              smtp.send_message TEST_MESSAGE, 'jmzquiapos@outlook.com', 'nikolai_ongsip@hotmail.com'
            end
          end
        end

        params do
          required(:attendee).hash do
            required(:first_name).filled(:string)
            required(:last_name).filled(:string)
            required(:email).filled(:string)
            required(:description).filled(:string)
            optional(:plus_count).filled(:integer)
          end
        end

        def handle(request, response)
          if request.params.valid?
            rom.relations[:attendees].changeset(:create, request.params[:attendee]).commit
            send_email

            response.flash[:notice] = 'Invite created'
            response.redirect_to '/'
          else
            response.flash.now[:alert] = 'Could not create invite'
            # Implicitly re-renders the "new" view
          end
        end
      end
    end
  end
end
