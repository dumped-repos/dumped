require_relative '../config/boot'

puts 'Importing all git repos that are looking for maintainers'

import = Services::Db::ImportRepos.new
import.call
