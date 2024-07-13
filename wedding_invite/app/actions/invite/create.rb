# frozen_string_literal: true

module WeddingInvite
  module Actions
    module Invite
      class Create < WeddingInvite::Action
        include Deps['persistence.rom']

        params do
          required(:attendee).hash do
            required(:first_name).filled(:string)
            required(:last_name).filled(:string)
            required(:email).filled(:string)
            required(:description).filled(:string)
            required(:plus_count).filled(:integer)
          end
        end

        def handle(request, response)
          if request.params.valid?
            attendee = rom.relations[:attendees].changeset(:create, request.params[:attendee]).commit

            response.flash[:notice] = 'Invite created'
            response.redirect_to "/invite/#{attendee[:id]}"
          else
            response.flash.now[:alert] = 'Could not create invite'
            # Implicitly re-renders the "new" view
          end
        end
      end
    end
  end
end