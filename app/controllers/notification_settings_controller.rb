class NotificationSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_notification_setting, only: [:edit, :update, :destroy]

  def index
    @notification_settings = current_user.notification_settings.all
  end

  def new
    @notification_setting = current_user.notification_settings.new
  end

  def create
    @notification_setting = current_user.notification_settings.new(notification_setting_parameters)
    @notification_setting.user_id = current_user.id

    if @notification_setting.save
      redirect_to(notification_settings_path, success: 'Notification setting has been created!')
    else
      render(:new)
    end
  end

  def edit
  end

  def update
    @notification_setting.attributes = notification_setting_parameters

    if @notification_setting.save
      redirect_to(notification_settings_path, success: 'Notification setting has been saved!')
    else
      render(:edit)
    end
  end

  def destroy
    if @notification_setting.destroy
      redirect_to(notification_settings_path, success: 'Notification setting has been destroyed!')
    else
      redirect_to(notification_settings_path, error: 'Something went wrong and notification setting has not been destroyed!')
    end
  end

  private

  def get_notification_setting
    @notification_setting = current_user.notification_settings.find(params[:id])
  end

  def notification_setting_parameters
    params.require(:notification_setting).permit(:category_id, :min_price, :max_price)
  end
end