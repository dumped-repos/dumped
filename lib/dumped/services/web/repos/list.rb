# frozen_string_literal: true

module Services
  module Web
    module Repos
      class List
        include Import[repository: 'repositories.repo']

        def call(language)
          if language
            return repository.repos if language == Repo::ALL.downcase
            repository.by_language(language)
          else
            repository.repos
          end
        end
      end
    end
  end
end
