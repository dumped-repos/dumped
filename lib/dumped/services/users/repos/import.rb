# frozen_string_literal: true

require "http"

module Services
  module Users
    module Repos
      class Import

        attr_reader :user_repository, :repo_repository

        def initialize(user_repository: UserRepository.new, repo_repository: RepoRepository.new)
          @user_repository = user_repository
          @repo_repository = repo_repository
        end

        def call(login)
          response = Http.get(user_repo_url(login))
          body_parsed = response.parse
          body_parsed.each do |repo|
            repo_info = extract_repo_info(repo)
            create_repo(repo_info, user(login))
          end
        end

        private

        def user(login)
          @user ||= user_repository.by_login(login)
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

        def create_repo(repo, user)
          repo_repository.create(**repo, user_id: user.id)
        end

        def user_repo_url(login)
          "https://api.github.com/users/#{login}/repos"
        end
      end
    end
  end
end
