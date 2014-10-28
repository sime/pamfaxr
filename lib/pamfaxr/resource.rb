module PamFaxrApi
  class Resource
    protected

      def self.get(base, opts = {})

        http = create_http(URI.parse(PamFaxrApi.configuration.base_uri))
        resource = self.build_query(base + opts[:method])

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

      def self.build_query(resource)
        username   = PamFaxrApi.configuration.username
        password   = PamFaxrApi.configuration.password
        api_key    = PamFaxrApi.configuration.api_key
        api_secret = PamFaxrApi.configuration.api_secret

        api_credentials = "?apikey=#{api_key}&apisecret=#{api_secret}&apioutputformat=API_FORMAT_JSON&username=#{username}&password=#{password}"

        resource + api_credentials
      end
  end
end
