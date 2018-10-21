# frozen_string_literal: true

module Services
  module Repos
    class UpdateAbandoned
      class RepoDoesNotBelongToCurrentUserError < StandardError
        def initialize(repo, user)
          super("The Repository #{repo.name} does not belong to the user #{user.name}")
        end
      end

      class RepoDoesNotExistsError < StandardError
        def initialize
          super('The Repository does not exists')
        end
      end

      include Import[repository: 'repositories.repo']

      def call(user, repo_id, abandoned)
        repo = repository.find(repo_id)
        raise RepoDoesNotExistsError unless repo

        check_repo_owner(repo, user)
        repository.update(repo_id, abandoned: abandoned)
      end

      private

      def check_repo_owner(repo, user)
        raise RepoDoesNotBelongToCurrentUserError.new(repo, user) if repo.user_id != user.id
      end
    end
  end
end
