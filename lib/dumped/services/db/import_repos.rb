module Services
  module DB
    class ImportRepos
      include Import[
        repo_repository: 'repositories.repo',
        user_repository: 'repositories.user',
        fetcher: 'services.repos.fetcher'
      ]

      def call
        fetcher.call(github_search_url) do |body_parsed|
          body_parsed['items'].each do |repo_hash|
            if repo_hash['language'].nil?
              puts "Skipping Repo #{repo_hash['name']}"
              next
            end

            repo_info = extract_repo_info(repo_hash)
            repository_owner = user(repo_hash)
            repo_repository.create(**repo_info, user_id: repository_owner.id)
          end
        end
      end

      private

      def user(hash)
        params = user_params(hash)
        user_repository.by_login(params[:login]) || user_repository.create(params)
      end

      def github_search_url
        'https://api.github.com/search/repositories?q=looking+for+maintainers+in:readme,description&order=desc'
      end

      def user_params(hash)
        { login: hash['owner']['login'] }
      end

      def extract_repo_info(repo_hash)
        {
          repo_id: repo_hash['id'],
          owner_login: repo_hash['owner']['login'],
          owner_avatar_url: repo_hash['owner']['owner_avatar_url'],
          name: repo_hash['name'],
          full_name: repo_hash['full_name'],
          html_url: repo_hash['html_url'],
          description: repo_hash['description'],
          repo_created_at: repo_hash['created_at'],
          homepage: repo_hash['homepage'],
          size: repo_hash['size'],
          stargazers_count: repo_hash['stargazers_count'],
          watchers_count: repo_hash['watchers_count'],
          language: repo_hash['language'],
          forks_count: repo_hash['forks_count'],
          open_issues_count: repo_hash['open_issues_count'],
          abandoned: true
        }
      end
    end
  end
end
