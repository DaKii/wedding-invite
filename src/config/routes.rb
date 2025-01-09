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
  end
end
