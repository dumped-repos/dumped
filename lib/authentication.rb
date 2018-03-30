# auto_register: false

module Authentication
  def self.included(action)
    action.class_eval do
      expose :authenticated?
      expose :current_user
    end
  end

  private

  def authenticated?
    !current_user.id.nil? if current_user
  end

  def current_user
    @current_user ||= User.new(session[:current_user]) if session[:current_user]
  end
end
