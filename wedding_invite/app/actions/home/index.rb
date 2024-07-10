# frozen_string_literal: true

module WeddingInvite
  module Actions
    module Home
      # Index class
      class Index < WeddingInvite::Action
        include Deps[repo: 'application.persistence.repositories.attendees']

        def handle(_request, response)
          response.render view, attendees: repo.all
        end
      end
    end
  end
end
