module WeddingInvite
  module Actions
    module AuthFailure
      class Show < WeddingInvite::Action
        def handle(_request, response)
          response.body = "You don't have permission to view this"
          response.status = 401
        end
      end
    end
  end
end
