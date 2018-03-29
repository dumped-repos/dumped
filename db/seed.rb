require_relative '../config/boot'

puts 'Importing all git repos that are looking for maintainers'

import = Services::DB::ImportRepos.new
import.call
