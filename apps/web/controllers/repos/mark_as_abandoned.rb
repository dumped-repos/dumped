# frozen_string_literal: true

module Web::Controllers::Repos
  class MarkAsAbandoned
    include Web::Action
    include Import['services.repos.mark_as_abandoned']


    def call(params)
      if params[:id]
        mark_as_abandoned.call(current_user, params[:id])
        redirect_to routes.user_path(current_user.id)
      else
        status 400, 'You must provide the repo id paramater'
      end
    end
  end
end
