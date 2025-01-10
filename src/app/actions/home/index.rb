# frozen_string_literal: true

module WeddingInvite
  module Actions
    module Home
      # Index class
      class Index < WeddingInvite::Action
        include Deps['persistence.rom']

        def handle(_request, response); end

        before :authenticate_user

        private

        def authenticate_user(request, response)
          # request.env['warden'].user is also where you get the current user from. It will be a ROM struct cause of our warden setup from before
          response.redirect_to('/login') unless request.env['warden'].user
        end
      end
    end
  end
end
