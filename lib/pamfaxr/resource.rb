module PamFaxrApi
  class Resource
    protected

      def self.get(base, opts = {})
        data = opts[:data] ||= {}
        http = create_http(URI.parse(PamFaxrApi.configuration.base_uri))
        resource = self.build_query(base + opts[:method], data)

        begin
          body = http.get(resource, { 'Content-Type' => 'application/json' }).body
          JSON.parse body
        rescue => error
        end
      end

      def self.create_http(base_uri)
        http = Net::HTTP.new(base_uri.host, base_uri.port)
        http.use_ssl = true
        http
      end

    private

      def self.build_query(resource, data)
        api = {
          :username => PamFaxrApi.configuration.username,
          :password => PamFaxrApi.configuration.password,
          :apikey => PamFaxrApi.configuration.api_key,
          :apisecret => PamFaxrApi.configuration.api_secret,
          :apioutputformat => 'API_FORMAT_JSON'
        }
        uri = Addressable::URI.new
        uri.query_values = api.merge(data)
        resource + '?' + uri.query
      end
  end
end
