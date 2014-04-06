require 'net/http'

module TimelineHelper

  def get_from_fsm_api(request)
    app_info = File.new('app_info.dat', 'r')
    app_id = app_info.gets.strip
    app_key = app_info.gets.strip
    puts "app_id: #{app_id} app_key: #{app_key}"
    uri = URI("https://apis.berkeley.edu/solr/fsm/select?q=#{request}&wt=json&app_id=#{app_id}&app_key=#{app_key}")
    resp = Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri

      http.request request # Net::HTTPResponse object
    end
    return JSON.parse(resp.body)
  end
end
