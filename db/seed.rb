require_relative '../config/boot'

puts 'Importing all git repos that are looking for maintainers'

repo = GitRepoRepository.new

import = ImportGitRepos.new(repo)
import.call



