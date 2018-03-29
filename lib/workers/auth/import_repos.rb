require "http"

module Workers
  module Auth
    class ImportRepos
      include Sidekiq::Worker

      attr_reader :user_repos_import

      def initialize(user_repos_import: Services::Users::Repos::Import.new )
        @user_repos_import = user_repos_import
      end

      def perform(login)
        user_repos_import.call(login)
      end
    end
  end
end
