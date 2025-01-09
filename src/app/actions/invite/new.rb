# frozen_string_literal: true

module WeddingInvite
  module Actions
    module Invite
      class New < WeddingInvite::Action
        def handle(_request, response)
          response.render(view)
        end
      end
    end
  end
end
