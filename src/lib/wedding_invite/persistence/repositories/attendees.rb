# frozen_string_literal: true

# lib/wedding_invite/persistence/repositories/attendee.rb

module WeddingInvite
  module Persistence
    module Repositories
      # Repository for attendees table
      class Attendees < Repository[:attendees]
        commands :create

        def all
          attendees.to_a
        end

        def get_by_id(id)
          attendees.by_pk(id).one
        end
      end
    end
  end
end
