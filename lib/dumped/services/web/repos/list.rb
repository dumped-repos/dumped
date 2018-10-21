# frozen_string_literal: true

module Services
  module Web
    module Repos
      class List
        include Import[repository: 'repositories.repo']

        def call(language)
          if language
            return repository.abandoned if language == Repo::ALL.downcase

            repository.abandoned_by_language(language)
          else
            repository.abandoned
          end
        end
      end
    end
  end
end
