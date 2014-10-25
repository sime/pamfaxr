class PamFaxr
  autoload(:FaxJob, File.expand_path('fax_job', __dir__))
  ##
  # Creates an instance of the PamFax class
  #
  # @param [Hash] params the options for instantiating a PamFax class
  # @option params [String] :username the PamFax username you are going to use to send faxes
  # @option params [String] :password the PamFax password you are going to use to send faxes
  # @option params [optionsl, String] :base_uri the URI of the PamFax API, it defaults to https://api.pamfax.biz
  # @option params [optional, String] :api_key the PamFax API key you have been assigned
  # @option params [optional, String] :api_secret the PamFax API secret you have been assigned
  #
  # @return [Object] the instantiated FaxJob class
  def initialize(options={})
    base_uri   = options[:base_uri]   || "https://api.pamfax.biz"
    api_key    = options[:api_key]    || "tropo_developer"
    api_secret = options[:api_secret] || "7xGi0xAqcg3YXw"
    
    options.merge!({ :http            => create_http(URI.parse(base_uri)),
                     :api_credentials => "?apikey=#{api_key}&apisecret=#{api_secret}&apioutputformat=API_FORMAT_JSON" })
    options[:api_credentials] = options[:api_credentials] + "&usertoken=#{get_user_token(options)}"
    
    @fax_job = FaxJob.new options
  end
  
  ##
  # Captures the request for the fax job and sends them to the instantiated FaxJob object
  def method_missing(method, *args)
    @fax_job.send(method, *args)
  end
  
  private 
  
  ##
  # Gets the user token to use with subsequent requests
  #
  # @param [Hash] params the options for getting the user token
  # @option params [String] :api_credentials the PamFax credentials built with key/secret
  # @option params [String] :username the PamFax username you are going to use to send faxes
  # @option params [String] :password the PamFax password you are going to use to send faxes
  #
  # @return [Object] the instantiated FaxJob class
  def get_user_token(options={})
    result = verify_user(options)
    if result['result']['code'] == 'success'
      result['UserToken']['token']
    else
      raise RuntimeError, result['result']['message']
    end
  end
  
  ##
  # Calls the VerifyUser resource to fetch the verified user details
  #
  # @param [Hash] params the options for verifying the user
  # @option params [String] :api_credentials the PamFax credentials built with key/secret
  # @option params [String] :username the PamFax username you are going to use to send faxes
  # @option params [String] :password the PamFax password you are going to use to send faxes
  #
  # @return [Object] the instantiated FaxJob class
  def verify_user(options={})
    resource = "/Session/VerifyUser/#{options[:api_credentials]}&username=#{options[:username]}&password=#{options[:password]}"
    body = options[:http].get(resource).body 
    JSON.parse body
  end
  
  ##
  # Creates an ssl enabled net/http object
  # 
  # @param [String] the URL to use to connect to the service
  #
  # @return [Object] an instantiated net/http object that is ssl enabled
  def create_http(base_uri)
    http = Net::HTTP.new(base_uri.host, base_uri.port)
    http.use_ssl = true
    http
  end
end
