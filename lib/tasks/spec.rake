require 'rspec/core/rake_task'
require 'ci/reporter/rake/rspec'

RSpec::Core::RakeTask.new(:all => ["ci:setup:rspec"]) do |t|
  t.pattern = '**/*_spec.rb'
end