class PrivateController < ApplicationController
  before_action :require_login
end
