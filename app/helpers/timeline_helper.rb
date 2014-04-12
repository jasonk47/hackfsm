require 'net/http'

module TimelineHelper

  def get_from_fsm_api(request)
    app_info = File.new('app_info.dat', 'r')
    app_id = app_info.gets.strip
    app_key = app_info.gets.strip
    # puts "app_id: #{app_id} app_key: #{app_key}"
    uri = URI("https://apis.berkeley.edu/solr/fsm/select?q=#{request}&wt=json&app_id=#{app_id}&app_key=#{app_key}")
    resp = Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri

      http.request request # Net::HTTPResponse object
    end
    return JSON.parse(resp.body)
  end
  
  # Returns the full hash of data with id
  def get_hash_from_id(id)
    id = '%22' << id << '%22'
    begin
      return get_from_fsm_api("id:#{id}")['response']['docs'][0]
    rescue
      print "#{id} is not a valid ID"
    end
  end
  
  # If id refers to image, returns list of image URLs
  # If id refers to document, returns full text from TEI URL
  def get_data_from_id(id)
    data_hash = get_hash_from_id(id)
    
    if data_hash == nil
      print "#{id} is not a valid ID\n"
      return
    end
    
    image_urls = data_hash['fsmImageUrl']
    tei_url = data_hash['fsmTeiUrl'][0]
    if image_urls != nil
      return image_urls
    elsif tei_url != nil
      return Net::HTTP.get_response(URI.parse(tei_url)).body
    end
  end
  
  
end
