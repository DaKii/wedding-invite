# frozen_string_literal: true

module WeddingInvite
  # Routes class
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    root to: 'home.index'
    get '/invite/:id', to: 'invite.show'
    get '/invite/new', to: 'invite.new'
    get '/invite/:id/rsvp', to: 'invite.rsvp'
    post '/invite', to: 'invite.create'
    post '/invite/:id', to: 'invite.update'

    # New user registration
    get '/register', to: 'register.new'
    post '/users', to: 'users.create'

    # Session management
    get '/login', to: 'login.new'
    post '/sessions', to: 'sessions.create'
    delete '/logout', to: 'sessions.destroy'
  end
end
