# frozen_string_literal: true

module WeddingInvite
  module Views
    module Invite
      class Show < WeddingInvite::View
        include Deps['persistence.rom']

        expose :attendee_info do |id:|
          rom.relations[:attendees]
             .select(:id, :first_name, :last_name)
             .where(id: id)
             .one
        end
      end
    end
  end
end
