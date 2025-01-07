# frozen_string_literal: true

module WeddingInvite
  module Views
    module Invite
      class Show < WeddingInvite::View
        include Deps['persistence.rom']

        expose :id

        expose :attendee_info do |id:|
          rom.relations[:attendees]
             .select(:id, :first_name, :last_name, :rsvp, :plus_count)
             .where(id: id)
             .one
        end
      end
    end
  end
end
