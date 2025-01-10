module WeddingInvite
  module Actions
    module Login
      class New < WeddingInvite::Action
        def handle(_request, response)
          response.render(view)
        end
      end
    end
  end
end
