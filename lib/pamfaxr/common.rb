module PamFaxrApi
  class Common < PamFaxrApi::Resource

    @@base_resource = '/Common'

    def self.list_countries
      get(@@base_resource, '/ListCountries')
    end

    def self.list_zones
      get(@@base_resource, '/ListZones')
    end
  end
end

