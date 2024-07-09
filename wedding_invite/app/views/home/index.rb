# frozen_string_literal: true

module WeddingInvite
  module Views
    module Home
      class Index < WeddingInvite::View
        expose :invites do
          [
            { id: 1, name: 'Invite 1' },
            { id: 2, name: 'Invite 2' }
          ]
        end
      end
    end
  end
end
