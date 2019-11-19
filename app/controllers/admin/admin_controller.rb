class Admin::AdminController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_BASIC_USERNAME'],
                               password: ENV['HTTP_BASIC_PASSWORD']
end
