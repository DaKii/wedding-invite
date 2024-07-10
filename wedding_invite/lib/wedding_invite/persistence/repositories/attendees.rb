# frozen_string_literal: true

# lib/wedding_invite/persistence/repositories/attendee.rb

module Sandbox
  module Persistence
    module Repositories
      # Repository for attendees table
      class Attendees < Repository[:attendees]
        commands :create

        def all
          attendees.to_a
        end
      end
    end
  end
end
