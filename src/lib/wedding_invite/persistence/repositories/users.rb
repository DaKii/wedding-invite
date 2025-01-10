# lib/wedding_invite/persistence/relations/users.rb
module WeddingInvite
  module Repositories
    class Users < WeddingInvite::Repo[:users]
      commands :create, update: :by_pk, delete: :by_pk

      def query(conditions)
        users.where(conditions)
      end

      def email_taken?(email)
        users.exist?(email: email)
      end

      def by_id(id)
        users.by_pk(id).one!
      end
    end
  end
end
