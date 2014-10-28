module PamFaxrApi
  class NumberInfo < PamFaxrApi::Resource

    @@base_resource = '/NumberInfo'

    def self.get_number_info(faxnumber)
      data = { faxnumber: faxnumber }
      get(@@base_resource, { method: '/GetNumberInfo', data: data })
    end

    def self.get_page_price(faxnumber)
      data = { faxnumber: faxnumber }
      get(@@base_resource, { method: '/GetPagePrice', data: data })
    end
  end
end


