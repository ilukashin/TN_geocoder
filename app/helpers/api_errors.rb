# frozen_string_literal: true

require 'sinatra/extension'

module ApiErrors
  extend Sinatra::Extension

  helpers do
    def error_response(error_messages)
      errors = ErrorSerializer.from_messages(error_messages)

      json errors
    end
  end


  error Validations::InvalidParams, KeyError do
    status 422
    error_response I18n.t(:missing_parameters, scope: 'api.errors')
  end
end
