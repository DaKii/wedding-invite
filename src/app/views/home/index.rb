# frozen_string_literal: true

module WeddingInvite
  module Views
    module Home
      # View for Index
      class Index < WeddingInvite::View
        puts 'BEFORE DEPS'
        include Deps['persistence.rom']

        puts 'IN INDEX'

        expose :attendees do
          rom.relations[:attendees]
             .select(:id, :name, :rsvp, :plus_count)
             .order(:id)
             .to_a
        rescue StandardError => e
          self.body = "Database connection failed: #{e.message}"
        end

        puts 'GOT ATTENDEES'
      end
    end
  end
end
