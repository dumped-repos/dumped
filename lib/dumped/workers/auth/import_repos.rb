module Workers
  module Auth
    class ImportRepos
      include Sidekiq::Worker
      include ::Import[user_repos_import: 'services.users.repos.import']

      def perform(login)
        user_repos_import.call(login)
      end
    end
  end
end
