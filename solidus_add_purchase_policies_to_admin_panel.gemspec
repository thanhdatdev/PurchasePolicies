# frozen_string_literal: true

require_relative 'lib/solidus_add_purchase_policies_to_admin_panel/version'

Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name = 'solidus_add_purchase_policies_to_admin_panel'
  spec.version = SolidusAddPurchasePoliciesToAdminPanel::VERSION
  spec.authors = ['thanhdatdev']
  spec.email = 'thanhdat.nguyen2104@gmail.com'

  spec.summary = 'Write a short summary, because RubyGems requires one.'
  spec.description = 'Write a longer description or delete this line.'
  spec.homepage = 'https://github.com/thanhdatdev/zenapp#readme'
  spec.license = 'BSD-3-Clause'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/thanhdatdev/zenapp'
  spec.metadata['changelog_uri'] = 'https://github.com/thanhdatdev/zenapp/blob/master/CHANGELOG.md'

  spec.required_ruby_version = Gem::Requirement.new('~> 2.5')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = "exe"
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'deface', '~> 1.5'
  spec.add_dependency 'solidus_api', ['>= 2.0.0', '< 4']
  spec.add_dependency 'solidus_core', ['>= 2.0.0', '< 4']
  spec.add_dependency 'solidus_backend', ['>= 2.0.0', '< 4']
  spec.add_dependency 'solidus_support', '~> 0.5'

  spec.add_development_dependency 'solidus_dev_support', '~> 2.5'
end
