# frozen_string_literal: true

module WeddingInvite
  module Actions
    module Home
      # Index class
      class Index < WeddingInvite::Action
        include Deps['persistence.rom']

        def handle(_request, response); end
      end
    end
  end
end
