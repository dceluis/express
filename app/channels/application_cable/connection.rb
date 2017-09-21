module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    def connect
      self.current_user = find_verified_user
      logger.add_tags current_user.full_name
    end

    private

    def find_verified_user
      User.find_by_id(cookies.encrypted['_link_session']['user_id']) ||
        reject_unauthorized_connection
    end
  end
end
