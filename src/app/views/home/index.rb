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
             .select(:id, :first_name, :last_name, :rsvp, :plus_count)
             .order(:id)
             .to_a
        end

        puts rom.relations[:attendees]
                .select(:id, :first_name, :last_name, :rsvp, :plus_count)
                .order(:id)
                .to_a

        puts 'GOT ATTENDEES'
      end
    end
  end
end
