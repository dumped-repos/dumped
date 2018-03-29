require "http"

class ImportGitRepos
  attr_reader :repository, :fetcher

  def initialize(repository, fetcher: Services::Repos::Fetcher)
    @repository = repository
    @fetcher = fetcher
  end

  def call
    fetcher.call(github_search_url) do |body_parsed|
      body_parsed['items'].each do |repo|
        if repo['language'].nil?
          puts "Skipping Repo #{repo['name']}"
          next
        end

        repo_info = extract_repo_info(repo)

        repository.create(repo_info)
      end
    end
  end

  private

  def github_search_url
    'https://api.github.com/search/repositories?q=looking+for+maintainers+in:readme,description&order=desc'
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
    }
  end
end
