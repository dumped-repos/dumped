module RepoAttributes
  def repo_attributes(attrs = {})
    {
      repo_id: 1,
      owner_login: 'test',
      owner_avatar_url: 'test_url',
      name: 'test_repo',
      full_name: 'test_repo',
      html_url: 'test_repo',
      description: 'test_repo',
      repo_created_at: Time.now,
      homepage: 'test_repo',
      size: 1,
      stargazers_count: 0,
      watchers_count: 0,
      language: 'ruby',
      forks_count: 0,
      open_issues_count: 9,
    }.merge(attrs)
  end
end

RSpec.configure do |config|
  config.include RepoAttributes
end
