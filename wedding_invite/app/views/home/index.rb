# frozen_string_literal: true

module WeddingInvite
  module Views
    module Home
      # View for Index
      class Index < WeddingInvite::View
        include Deps['persistence.rom']

        expose :attendees
      end
    end
  end
end
