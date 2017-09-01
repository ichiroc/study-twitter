# frozen_string_literal: true

class StatusesController < ApplicationController
  before_action :set_user, only: :show
  before_action :set_status, only: %i[show destroy]

  def show; end

  def new
    @status = current_user.statuses.build
  end

  def create
    @status = current_user.statuses.build(status_params)
    if @status.save
      redirect_to root_url(@user), notice: 'Status was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @status.destroy
    redirect_to root_url, notice: 'Status was successfully destroyed.'
  end

  private

  def set_status
    @status = @user.statuses.find(params[:id])
  end

  def status_params
    params.fetch(:status, {}).permit(:body)
  end

  def set_user
    @user = User.find_by(name: params[:user_name])
  end
end
