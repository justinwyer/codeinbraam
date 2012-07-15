require 'rubygems'
require 'rufus-scheduler'
require 'net/http'
require 'json'

scheduler = Rufus::Scheduler.start_new

scheduler.every 2.minutes do
  Rails.logger.info "Fetching tweets..."
  uri = URI('http://search.twitter.com/search.json?q=%23codeinbraam')
  response = res = Net::HTTP.get_response(uri)
  if response.is_a?(Net::HTTPSuccess)
    data = JSON.parse response.body
    newest = Tweet.maximum(:id)
    Rails.logger.info "Newest tweet is #{newest}, retrieve #{data['results'].length} tweets."
    for result in data['results']
      if newest.nil? or result['id'] > newest
        tweet = Tweet.new(:author => result['from_user'], :content => result['text'], :when => result['created_at'])
        tweet.id = result['id']
        tweet.save
      end
    end
  end
end