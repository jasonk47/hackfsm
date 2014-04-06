require 'net/http'

class TimelineController < ApplicationController
  @@app_id = 'ffebc2af'
  @@app_key = '7554cf788e4e3222653fd1b84164ef84'

  def get_from_fsm_api(request)
    url = URI.parse('https://apis.berkeley.edu/solr/fsm/select?q=*&wt=json&app_id=ffebc2af&app_key=7554cf788e4e3222653fd1b84164ef84')
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    puts res.body

  end
end
