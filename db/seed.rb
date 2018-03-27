require_relative '../config/boot'

puts 'Importing all git repos that are looking for maintainers'

repo = RepoRepository.new

import = ImportRepos.new(repo)
import.call



