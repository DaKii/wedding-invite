# frozen_string_literal: true

module WeddingInvite
  module Actions
    module Invite
      class Show < WeddingInvite::Action
        def handle(request, response)
          puts 'IN SHOW'
          id = request.params[:id]

          response.render(view, id: id)
        end
      end
    end
  end
end
