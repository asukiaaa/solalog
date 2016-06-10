class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include RandomString

  if Rails.env.staging?
    http_basic_authenticate_with( name:     ENV['BASIC_AUTH_NAME'] || 'solalog',
                                  password: ENV['BASIC_AUTH_PASS'] || 'staging' )
  end

  def get_hash_of_request_json_from url
    uri = URI(url)
    request_json = Net::HTTP.get(uri)
    return JSON.parse(request_json)
  end

end
