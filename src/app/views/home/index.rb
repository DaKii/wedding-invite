# frozen_string_literal: true

module WeddingInvite
  module Views
    module Home
      # View for Index
      class Index < WeddingInvite::View
        include Deps['persistence.rom']

        expose :attendees do
          rom.relations[:attendees]
             .select(:id, :name, :rsvp, :plus_count)
             .order(:id)
             .to_a
        rescue StandardError => e
          self.body = "Database connection failed: #{e.message}"
        end
      end
    end
  end
end
