# lib/wedding_invite/persistence/relations/attendees.rb

module WeddingInvite
  module Persistence
    module Relations
      # Attendee table
      class Attendees < ROM::Relation[:sql]
        schema(:attendees, infer: true)

        def by_id(id)
          where(id: id)
        end
      end
    end
  end
end
