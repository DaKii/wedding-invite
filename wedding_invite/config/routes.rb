# frozen_string_literal: true

module WeddingInvite
  # Routes class
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    get '/', to: 'home.index'
    get '/invite/:id', to: 'invite.show'
  end
end
