module PamFaxrApi
  class Common < PamFaxrApi::Resource

    @@base_resource = '/Common'

    def self.list_countries
      get(@@base_resource, { method: '/ListCountries' })
    end

    def self.list_zones
      get(@@base_resource, { method: '/ListZones' })
    end
  end
end

