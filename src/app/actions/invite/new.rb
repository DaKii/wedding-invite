# frozen_string_literal: true

module WeddingInvite
  module Actions
    module Invite
      class New < WeddingInvite::Action
        def handle(request, response)
          id = request.params

          response.render(view, id: id)
        end
      end
    end
  end
end
