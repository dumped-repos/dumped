# frozen_string_literal: true

require 'dry/system/container'
require 'dry/system/hanami'

class Container < Dry::System::Container
  extend Dry::System::Hanami::Resolver

  use :bootsnap
  use :env

  register_folder! 'dumped/repositories'
  register_folder! 'dumped/entities'
  register_folder! 'dumped/services'
  register_folder! 'dumped/workers'

  configure do |config|
    config.env = Hanami.env
  end
end
