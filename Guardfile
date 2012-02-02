guard 'rails-assets', run_on: [:start, :change], runner: :rails, rails_env: 'test' do
  watch(%r{^app/assets/.+$})
  watch('config/application.rb')
end

guard 'coffeescript', input: 'spec/javascripts', output: 'spec/javascripts/compiled'

guard 'jasmine-headless-webkit' do
  watch(%r{^public/assets/.*\.js}) { |m| newest_js_file("spec/javascripts/compiled/#{m[1]}_spec") }
  watch(%r{^spec/javascripts/compiled/.*\.js})
end

guard :test do
  watch(%r{^lib/(.+)\.rb$})     { |m| "test/#{m[1]}_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch('test/test_helper.rb')  { "test" }

  # Rails example
  watch(%r{^app/models/(.+)\.rb$})                   { |m| "test/unit/#{m[1]}_test.rb" }
  watch(%r{^app/controllers/(.+)\.rb$})              { |m| "test/functional/#{m[1]}_test.rb" }
  watch(%r{^app/views/.+\.rb$})                      { "test/integration" }
  watch('app/controllers/application_controller.rb') { ["test/functional", "test/integration"] }
end
