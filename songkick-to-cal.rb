require 'rubygems'
require 'songkickr'
require 'icalendar'
require 'date'
require 'open-uri'
require 'json'

include Icalendar

class Result

  attr_accessor :name, :location, :shows

  @@remote = Songkickr::Remote.new 'Your API Key'

  def initialize
    @shows = {}
  end

  def run 
    get_artist
    get_location
    get_location_id(@location)
    create_api_results(@name, @location_id)
    create_event_hash
    create_files
  end

  def get_artist
    puts "What artist are you looking for?"
    @name = (gets.to_s.downcase.gsub(" ", "+")).strip
  end

  def get_location
    puts "Where are you located?"
    @location = (gets.to_s.downcase.gsub(" ", "+")).strip
  end

  #Sonkickr gem doesn't have a location look up from what I saw so use user input to call API and get location id
  def get_location_id(location)
    doc = open("http://api.songkick.com/api/3.0/search/locations.json?query='#{location}'&apikey=Your API Key").read
    location_hash = JSON.parse(doc)
    @location_id = location_hash["resultsPage"]["results"]["location"][0].flatten[1]["id"]
  end

  def create_api_results(name, location_id)
    sk_id = "sk:#{@location_id}"
    begin
      @event_results = @@remote.events(:artist_name => name, :location => sk_id, :min_date => "2013-02-20", :max_date => "2013-10-31").results
    rescue
      puts "No Results Found"
    end
  end

  def create_event_hash
    @event_results.each do |event|
      @shows[event.display_name] = event.start
    end
  end

  def create_files
    @shows.each do |display_name, date|
      cal = Calendar.new
      event = Event.new
      event.start = date
      event.summary = display_name
      cal.add_event(event)

      File.open("'#{display_name}'.ics", 'w+') do |f|
          f << cal.to_ical
        end
    end
  puts "Your #{@name} shows have been created in your current directory. Rock on."
  end

end


myevents = Result.new
myevents.run