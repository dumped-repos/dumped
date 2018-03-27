require "http"

class ImportGitRepos
  attr_reader :repository

  def initialize(repository)
    @repository = repository
  end

  def call
    fetch_repos do |repo|
      if repo['language'].nil?
        puts "Skipping Repo #{repo['name']}"
        next
      end

      repo_info = extract_repo_info(repo)

      repository.create(repo_info)
    end
  end

  private
  def fetch_repos(url = github_search_url, &block)
    response = Http.get(url)

    headers = response.headers

    next_link = extract_next_link(headers['Link'])
    remaining_requests = headers['X-Ratelimit-Remaining']
    body_parsed = response.parse

    body_parsed['items'].each do |repo|
      yield repo
    end

    if remaining_requests == '0'
      puts 'Sleeping for a minute'
      sleep(70)
    end

    fetch_repos(next_link, &block) if next_link
  end

  def github_search_url
    'https://api.github.com/search/repositories?q=looking+for+maintainers+in:readme,description&order=desc'
  end

  def extract_next_link(link_header)
    return if link_header.empty?
    splitted_string = link_header.split(',').map { |s| s.split(';') }
    url = splitted_string.select { |link, rel| rel.include?('next') }.flatten.first
    url.strip.slice(1..-2) if url
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
