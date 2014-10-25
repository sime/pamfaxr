module PamFaxrApi

  autoload(:Resource, File.expand_path('resource', __dir__))
  autoload(:Common, File.expand_path('common', __dir__))

  class Configuration
    attr_accessor :base_uri
    attr_accessor :username
    attr_accessor :password
    attr_accessor :api_key
    attr_accessor :api_secret
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

end



