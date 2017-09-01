class TimelineController < ApplicationController
  before_action :check_user

  def index
    @statuses = current_user.timeline
  end

  private

  def check_user
    redirect_to new_user_session_path if current_user.blank?
  end
end
