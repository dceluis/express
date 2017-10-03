class NotificationsController < ApplicationController
  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.all
  end
end
