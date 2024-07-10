# lib/wedding_invite/persistence/relations/attendees.rb

module Bookshelf
  module Persistence
    module Relations
      # Attendee table
      class Attendee < ROM::Relation[:sql]
        schema(:wedding_invite, infer: true)
      end
    end
  end
end
