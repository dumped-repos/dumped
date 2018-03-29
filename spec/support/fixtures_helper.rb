module FixturesHelper
  InvalidFileName = Class.new(StandardError)

  def http_fixture(file_name)
    file_path = File.expand_path("../../fixtures/http/#{file_name}.json", __FILE__)
    if File.exist?(file_path)
      File.read(file_path)
    else
      raise InvalidFileName.new("Fixture file: #{file_name} do not exists")
    end
  end
end


RSpec.configure do |config|
  config.include FixturesHelper
end
