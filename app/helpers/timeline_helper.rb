require 'net/http'

module TimelineHelper

  # given a string request representing keywords or argument extensions, send a
  # query to the FSM API
  def get_from_fsm_api(request, rows = 30)
    app_info = File.new('app_info.dat', 'r')
    app_id = app_info.gets.strip
    app_key = app_info.gets.strip
    uri = URI("https://apis.berkeley.edu/solr/fsm/select?q=#{request}&wt=json&app_id=#{app_id}&app_key=#{app_key}&rows=#{rows}")
    resp = Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri

      http.request request # Net::HTTPResponse object
    end
    return JSON.parse(resp.body)
  end

  # given one of the date formats listed on the FSM API website, parse it into a
  # three-element array of numbers ([month, day, year]) which may be more useful.
  # nil values in the array represent unspecified date quantities, and a nil
  # output means input couldn't be parsed.
  def parse_date(date)
    months = {'Jan' => 1, 'Feb' => 2, 'Mar' => 3, 'Apr' => 4, 'May' => 5, 'Jun' => 6,
              'June' => 6, 'Jul' => 7, 'July' => 7, 'Aug' => 8, 'Sept' => 9, 'Oct' => 10,
              'Nov' => 11, 'Dec' => 12}

    if date.kind_of? Array
      date = date[0]
    end
    month, day, year = nil, nil, nil
    matchdate = /^(\w\w\w)\.? (\d\d?), (\d\d\d\d)$/.match(date.to_s)
    if !matchdate.nil?
      month = months[matchdate[1]]
      day = matchdate[2].to_i
      year = matchdate[3].to_i
      return [month, day, year]
    end
    matchdate = /^(\w\w\w\w)\.? (\d\d?), (\d\d\d\d)$/.match(date.to_s)
    if !matchdate.nil?
      month = months[matchdate[1]]
      day = matchdate[2].to_i
      year = matchdate[3].to_i
      return [month, day, year]
    end
    matchdate = /^\d\d\d\d$/.match(date.to_s)
    if !matchdate.nil?
      year = date.to_i
      return [month, day, year]
    end
    matchdate = /^(\w\w\w)-(\d\d)$/.match(date.to_s)
    if !matchdate.nil?
      month = months[matchdate[1]]
      year = matchdate[2].to_i + 1900
      return [month, day, year]
    end
    matchdate = /^(\w\w\w)\.?, (\d\d\d\d)$/.match(date.to_s)
    if !matchdate.nil?
      month = months[matchdate[1]]
      year = matchdate[2].to_i
      return [month, day, year]
    end
    matchdate = /^(\w\w\w\w)\.? (\d\d\d\d)$/.match(date.to_s)
    if !matchdate.nil?
      month = months[matchdate[1]]
      year = matchdate[2].to_i
      return [month, day, year]
    end

    # ranges
    matchdate = /^(\w\w\w)\.? (\d\d?)-(\d\d?), (\d\d\d\d)$/.match(date.to_s)
    if !matchdate.nil?
      month = months[matchdate[1]]
      day1 = matchdate[2].to_i
      day2 = matchdate[3].to_i
      year = matchdate[4].to_i
      return [month, day1, year]
    end
    matchdate = /^(\w\w\w\w)\.? (\d\d?)-(\d\d?), (\d\d\d\d)$/.match(date.to_s)
    if !matchdate.nil?
      month = months[matchdate[1]]
      day1 = matchdate[2].to_i
      day2 = matchdate[3].to_i
      year = matchdate[4].to_i
      return [month, day1, year]
    end
    matchdate = /^(\d\d\d\d)-(\d\d\d\d)$/.match(date.to_s)
    if !matchdate.nil?
      year1 = matchdate[1].to_i
      year2 = matchdate[2].to_i
      return [month, day, year1]
    end
    matchdate = /^(?:ca\.|circa) (\d\d\d\d)$/.match(date.to_s)
    if !matchdate.nil?
      return [month, day, matchdate[1].to_i]
    end
    puts 'date parse fail: %s' % date.to_s
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

  # an advanced search method for creating better queries to the solr API.
  def adv_search(base_string, query_map, date_start = nil, date_end = nil)
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
    results = get_from_fsm_api(query_string)['response']['docs']
    date_filtered_results = []
    for result in results
      if is_before(date_start, parse_date(result['fsmDateCreated'])) and
        is_before(parse_date(result['fsmDateCreated']), date_end)
        date_filtered_results << result
      end
    end
    return date_filtered_results
  end

  # take two three-element date arrays ([month, day, year]) and return true iff
  # the first date comes before the second. If in doubt, yes.
  def is_before(date1, date2)
    if date1.nil? or date2.nil? # if at least one is nil, yes
      return true
    end
    puts 'comparing %s and %s' % [date1.to_s, date2.to_s]
    if date1[2] < date2[2] # earlier year
      puts 'earlier year'
      return true
    elsif date1[2] > date2[2] # later year
      puts 'later year'
      return false
    end
    if date1[0].nil? or date2[0].nil? # if either doesn't have month, yes
      return true
    elsif date1[0] < date2[0]
      return true
    elsif date1[0] > date2[0]
      return false
    end
    if date1[1].nil? or date2[1].nil? # if either doesn't have day, yes
      return true
    elsif date1[1] < date2[1]
      return true
    elsif date1[1] > date2[1]
      return false
    else
      return true # dates are equal. search will be inclusive
    end
  end

  # a utility method which finds and assembles API data in a manner appropriate
  # for the timeline page's internal representation.
  def timeline_info
    query = URI.escape('fsmDateCreated:[* TO *]')
    results = get_from_fsm_api(query, 800)

    docs = results['response']['docs']
    timeline_hash = {}
    params_to_keep = [
      'fsmCreator',
      'fsmDateCreated',
      'fsmTypeOfResource',
      'id',
      'fsmTitle',
      'fsmImageUrl'
    ]
    count_docs = 0
    docs.each do |d|
      timeline_doc = {}
      params_to_keep.each do |p|
        if (!d[p].nil? && d[p].kind_of?(Array))
          timeline_doc[p] = d[p].first
        elsif !d[p].nil?
          timeline_doc[p] = d[p]
        end
      end
      date = parse_date(timeline_doc['fsmDateCreated'])
      if date.nil?
        next
      end
      unless timeline_hash.has_key? [date[2], date[0]]
        timeline_hash[[date[2], date[0]]] = {}
      end
      unless timeline_hash[[date[2], date[0]]].has_key? date[1]
        timeline_hash[[date[2], date[0]]][date[1]] = []
      end
      timeline_hash[[date[2], date[0]]][date[1]] << timeline_doc
      count_docs += 1
    end
    return timeline_hash
  end

end
