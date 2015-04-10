# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: pamfaxr 0.2.5 ruby lib

Gem::Specification.new do |s|
  s.name = "pamfaxr"
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jason Goecke"]
  s.date = "2015-04-10"
  s.description = "Ruby library for the FaxJob portion of the PamFax API."
  s.email = "jsgoecke@voxeo.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "examples/Tropo.pdf",
    "examples/example.rb",
    "examples/hello_pamfax.rb",
    "lib/pamfaxr.rb",
    "lib/pamfaxr/common.rb",
    "lib/pamfaxr/fax_job.rb",
    "lib/pamfaxr/multipart.rb",
    "lib/pamfaxr/number_info.rb",
    "lib/pamfaxr/pamfaxr.rb",
    "lib/pamfaxr/pamfaxr_api.rb",
    "lib/pamfaxr/resource.rb",
    "pamfaxr.gemspec",
    "spec/get_fax_details.json",
    "spec/get_number_info.json",
    "spec/get_page_price.json",
    "spec/list_countries.json",
    "spec/list_zones.json",
    "spec/pamfaxr_spec.rb",
    "spec/pdf-test.pdf",
    "spec/spec.opts",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/tropo/pamfaxr"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Ruby library for the PamFax API."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mime-types>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.0"])
    else
      s.add_dependency(%q<mime-types>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.0"])
    end
  else
    s.add_dependency(%q<mime-types>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.0"])
  end
end

