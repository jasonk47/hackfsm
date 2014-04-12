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

  def get_all_xml_data()
    app_info = File.new('xmls.dat', 'w')
    response = get_from_fsm_api('*&rows=900&indent=on')
    app_info.puts(response)
  end

  def parse_date(date)
    months = {'Jan' => 1, 'Feb' => 2, 'Mar' => 3, 'Apr' => 4, 'May' => 5, 'Jun' => 6,
              'June' => 6, 'Jul' => 7, 'July' => 7, 'Aug' => 8, 'Sept' => 9, 'Oct' => 10,
              'Nov' => 11, 'Dec' => 12}

    month, day, year = nil, nil, nil
    matchdate = /^(\w\w\w)\.? (\d\d?), (\d\d\d\d)$/.match(date)
    if !matchdate.nil?
      puts 'month %s day %s year %s' % [matchdate[1], matchdate[2], matchdate[3]]
      month = months[matchdate[1]]
      day = matchdate[2].to_i
      year = matchdate[3].to_i
      return [month, day, year]
    end
    matchdate = /^(\w\w\w\w)\.? (\d\d?), (\d\d\d\d)$/.match(date)
    if !matchdate.nil?
      puts 'month %s day %s year %s' % [matchdate[1], matchdate[2], matchdate[3]]
      month = months[matchdate[1]]
      day = matchdate[2].to_i
      year = matchdate[3].to_i
      return [month, day, year]
    end
    matchdate = /^\d\d\d\d$/.match(date)
    if !matchdate.nil?
      puts 'year %s' % (date)
      year = date.to_i
      return [month, day, year]
    end
    matchdate = /^(\w\w\w)-(\d\d)$/.match(date)
    if !matchdate.nil?
      puts 'month %s year %s' % [matchdate[1], matchdate[2]]
      month = months[matchdate[1]]
      year = matchdate[2].to_i + 1900
      return [month, day, year]
    end
    matchdate = /^(\w\w\w)\.?, (\d\d\d\d)$/.match(date)
    if !matchdate.nil?
      puts 'month %s year %s' % [matchdate[1], matchdate[2]]
      month = months[matchdate[1]]
      year = matchdate[2].to_i
      return [month, day, year]
    end
    matchdate = /^(\w\w\w\w)\.? (\d\d\d\d)$/.match(date)
    if !matchdate.nil?
      puts 'month %s year %s' % [matchdate[1], matchdate[2]]
      month = months[matchdate[1]]
      year = matchdate[2].to_i
      return [month, day, year]
    end

    # ranges
    matchdate = /^(\w\w\w)\.? (\d\d?)-(\d\d?), (\d\d\d\d)$/.match(date)
    if !matchdate.nil?
      puts 'month %s day1 %s day2 %s year %s' % [matchdate[1], matchdate[2],
                                                  matchdate[3], matchdate[4]]
      month = months[matchdate[1]]
      day1 = matchdate[2].to_i
      day2 = matchdate[3].to_i
      year = matchdate[4].to_i
      return [[month, day1, year], [month, day2, year]]
    end
    matchdate = /^(\w\w\w\w)\.? (\d\d?)-(\d\d?), (\d\d\d\d)$/.match(date)
    if !matchdate.nil?
      puts 'month %s day1 %s day2 %s year %s' % [matchdate[1], matchdate[2],
                                                  matchdate[3], matchdate[4]]
      month = months[matchdate[1]]
      day1 = matchdate[2].to_i
      day2 = matchdate[3].to_i
      year = matchdate[4].to_i
      return [[month, day1, year], [month, day2, year]]
    end
    matchdate = /^(\d\d\d\d)-(\d\d\d\d)$/.match(date)
    if !matchdate.nil?
      puts 'year1 %s year2 %s' % [matchdate[1], matchdate[2]]
      year1 = matchdate[1].to_i
      year2 = matchdate[2].to_i
      return [[month, day, year1], [month, day, year2]]
    end
    matchdate = /^(?:ca\.|circa) (\d\d\d\d)$/.match(date)
    if !matchdate.nil?
      puts 'circa %s' % matchdate[1]
      return [month, day, matchdate[1].to_i]
    end
  end

  # Returns the full hash of data with id
  def get_hash_from_id(id)
    esc_id = '%22' << id << '%22'
    begin
      return get_from_fsm_api("id:#{esc_id}")['response']['docs'][0]
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

    if !data_hash['fsmTeiUrl'].nil?
      tei_url = data_hash['fsmTeiUrl'][0]
    end

    if image_urls != nil
      return image_urls
    elsif tei_url != nil
      return Net::HTTP.get_response(URI.parse(tei_url)).body
    end
  end

  def adv_search(base_string, query_map)
    if base_string.nil?
      query_string = ''
    else
      query_string = base_string
    end
    possible_params = {
      'Creator'       => 'fsmCreator',
      'Date'          => 'fsmDateCreated',
      'Resource Type' => 'fsmTypeOfResource',
      'Note'          => 'fsmNote',
      'Related Title' => 'fsmRelatedTitle',
      'Archive Identifier'  => 'fsmIdentifier',
      'Related Identifier'  => 'fsmRelatedIdentifier',
      'Archive Location'    => 'fsmPhysicalLocation'
    }
    for pair in query_map.each
      if possible_params.has_key? pair[0]
        if query_string.length == 0
          query_string = '%s:%s' % [possible_params[pair[0]], pair[1]]
        else
          query_string += ' AND %s:%s' % [possible_params[pair[0]], pair[1]]
        end
      end
    end
    query_string = URI.escape(query_string)
    return get_from_fsm_api(query_string)
  end

  
  # Takes in a name (title), start date, end date. Returns list of hashes of
  # relevant results
  def get_data_adv_query(name, date_start, date_end)
    esc_title = '%22' << name << '%22'
  
  end
  
end
