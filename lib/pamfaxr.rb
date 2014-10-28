$: << File.expand_path(File.dirname(__FILE__))
%w(json net/http net/https uri socket cgi mime/types base64 pamfaxr/pamfaxr pamfaxr/multipart pamfaxr/pamfaxr_api addressable/uri).each { |lib| require lib }
