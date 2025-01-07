# auto_register: false
# frozen_string_literal: true

require 'hanami/action'

module WeddingInvite
  class Action < Hanami::Action
    handle_exception StandardError => :error_handler

    def error_handler(_req, res, exception)
      res.status = 500
      res.body = {
        title: 'Server Error',
        details: exception.message
      }.to_json
    end
  end
end
