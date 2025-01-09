# frozen_string_literal: true

module WeddingInvite
  module Actions
    module Invite
      class Update < WeddingInvite::Action
        include Deps['persistence.rom']

        params do
          required(:id).filled(:integer)

          required(:attendee).hash do
            required(:rsvp).filled(:bool)
            required(:plus_count).filled(:integer)
          end
        end

        def handle(request, response)
          params = request.params
          if params.valid?

            update_relation_by_id(rom.relations[:attendees], params[:id], params[:attendee])

            handle_flash_message(response, :notice, 'INVITE CREATED')
            response.redirect_to "/invite/#{params[:id]}"
          else
            handle_flash_message(response, :notice, { errors: params.errors }.to_json)
          end
        end

        def update_relation_by_id(relation, id, data)
          relation.by_id(id)
                  .changeset(:update, rsvp: data[:rsvp],
                                      plus_count: data[:plus_count])
                  .commit
        end

        def handle_flash_message(response, flash_type, message)
          response.flash.now[flash_type] = message
        end
      end
    end
  end
end
