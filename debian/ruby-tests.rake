
require 'gem2deb/rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push %w(spec)
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end

desc 'Default Task'
task :default => [ :test, 'test:travis' ]

namespace :test do
  mock = ENV['FOG_MOCK'] || 'true'
  task :travis do
      system 'FOG_MOCK=true shindo'
  end
end

#require 'gem2deb/rake/testtask'

#Gem2Deb::Rake::TestTask.new do |t|
  #t.libs << 'lib' << 'tests'
  #t.test_files = FileList['tests/**/*_tests.rb']
#end
