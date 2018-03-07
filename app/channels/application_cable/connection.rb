module ApplicationCable
  class Connection < ActionCable::Connection::Base
    #an instance of the connection class is created when a new connection is made
    include SessionsHelper

    identified_by :message_user

    def connect
      self.message_user = find_verified_user
    end

    private
    def find_verified_user
      if logged_in?# comes from SessionsHelper
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
