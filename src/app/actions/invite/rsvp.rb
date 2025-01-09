# frozen_string_literal: true

module WeddingInvite
  module Actions
    module Invite
      class Rsvp < WeddingInvite::Action
        include Deps['persistence.rom']

        def handle(request, response)
          id = request.params[:id]

          attendee_info = rom.relations[:attendees]
                              .select(:id, :name, :rsvp, :plus_count)
                              .where(id: id)
                              .one

          total_plus_count = (0..attendee_info[:plus_count]).to_a

          response.render(view, id: id, total_plus_count: total_plus_count)
        end
      end
    end
  end
end
