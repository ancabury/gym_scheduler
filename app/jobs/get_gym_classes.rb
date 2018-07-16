require 'net/http'

class GetGymClasses
  attr_accessor :uri, :http, :request

  def initialize
    @uri = URI('https://cbcfitness.gymmasteronline.com/portal/account/getcompanyclasses_all_date')
    @http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @request = Net::HTTP::Get.new(uri.path)
  end

  def perform
    response = http.request(request)
    JSON.parse(response.body).with_indifferent_access
  rescue JSON::ParserError
    Rails.logger.error "Error parsing response body #{response.body}"
  end
end
