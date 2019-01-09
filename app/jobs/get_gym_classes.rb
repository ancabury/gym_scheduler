require 'net/http'

class GetGymClasses
  attr_accessor :uri, :http, :request

  def initialize
    set_schedule_interval
    @uri = URI("https://cbc.project-trancend.com/api/schedule?start_date=#{@start_date}&end_date=#{@end_date}")
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

  private

  def set_schedule_interval
    week_start = Date.today.at_beginning_of_week
    week_end = week_start + 6.days

    @start_date = week_start.strftime("%Y-%m-%d")
    @end_date = week_end.strftime("%Y-%m-%d")
  end
end
