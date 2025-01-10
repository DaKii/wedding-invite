# lib/wedding_invite/persistence/relations/users.rb
module WeddingInvite
  module Persistence
    module Relations
      class Users < ROM::Relation[:sql]
        schema(:users, infer: true) do
        end
      end
    end
  end
end
