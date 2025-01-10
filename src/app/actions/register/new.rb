module WeddingInvite
  module Actions
    module Register
      class New < WeddingInvite::Action
        def handle(_request, response)
          p 'in register action'

          response.render(view)
        end
      end
    end
  end
end
