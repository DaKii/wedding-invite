# frozen_string_literal: true

module WeddingInvite
  # Routes class
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    root to: 'home.index'
    get '/home/test', to: 'invite.test'
    get '/invite/:id', to: 'invite.show'
    get '/invite/new', to: 'invite.new'
    post '/invite', to: 'invite.create'
    post '/invite/:id', to: 'invite.update'
  end
end
