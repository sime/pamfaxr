module PamFaxrApi
  class Common < PamFaxrApi::Resource
    def self.list_countries
      base_resource = '/Common'
      resource = base_resource + '/ListCountries'
      puts resource
      get(resource)
    end
  end
end

