# frozen_string_literal: true

module WeddingInvite
  module Views
    module Invite
      class Rsvp < WeddingInvite::View
        expose :id
        expose :total_plus_count
        expose :attendee_info
      end
    end
  end
end
