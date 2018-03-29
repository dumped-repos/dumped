# frozen_string_literal: true

module Services
  module Repos
    class List
      attr_reader :repository

      def initialize(repository: RepoRepository.new)
        @repository = repository
      end

      def call(language)
        if language
          return repository.all if language == Repo::ALL.downcase
          repository.by_language(language)
        else
          repository.all
        end
      end
    end
  end
end
