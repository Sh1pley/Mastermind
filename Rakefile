require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |test|
  test.libs << 'test'
  test.warning = false
  test.verbose = false
  test.test_files = FileList['test/*_test.rb'].exclude("test/test_helper.rb")
end
task default: :test