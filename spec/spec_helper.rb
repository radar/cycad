require 'bundler/setup'
require 'cycad'
require 'cycad/repo'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # config.before do
  #   Cycad.purge_all
  # end

  # Focus config so we can prefix f and so on
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
