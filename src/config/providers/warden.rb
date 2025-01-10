# config/providers/warden.rb
Hanami.app.register_provider(:warden) do
  prepare do
    require 'bcrypt'
    require 'warden'
  end

  start do
    target.start(:persistence)
    Warden::Strategies.add(:password) do
      def valid?
        params['email'] || params['password']
      end

      def authenticate!
        user_repo = WeddingInvite::Repositories::Users.new(Hanami.app['persistence.rom'])
        user = user_repo.by_email(params['email'])

        if user && user.password_hash == BCrypt::Engine.hash_secret(request.params['password'], user.password_salt)
          return success!(user)
        end

        fail!('Could not log in')
      end
    end

    Warden::Manager.serialize_into_session { |user| user.id }
    Warden::Manager.serialize_from_session do |id|
      WeddingInvite::Repositories::Users.new(Hanami.app['persistence.rom']).by_id(id)
    end
  end
end
