# frozen_string_literal: true

module WeddingInvite
  module Actions
    module Invite
      class Rsvp < WeddingInvite::Action
        def handle(request, response)
          id = request.params[:id]

          response.render(view, id: id)
        end
      end
    end
  end
end
