# frozen_string_literal: true

module WeddingInvite
  module Views
    module Home
      # View for Index
      class Index < WeddingInvite::View
        include Deps['persistence.rom']

        expose :attendees do
          rom.relations[:attendees]
             .select(:id, :first_name, :last_name, :rsvp, :plus_count)
             .order(:id)
             .to_a
        end
      end
    end
  end
end
