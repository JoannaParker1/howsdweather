
class WelcomeController < ApplicationController

  def index
      @states = %w(HI AK CA OR WA ID UT NV AZ NM CO WY MT ND SD NB KS OK TX LA AR MO IA MN WI IL IN MI OH KY TN MS AL GA FL SC NC VA WV DE MD PA NY NJ CT RI MA VT NH ME DC).sort!

  response = HTTParty.get("http://api.wunderground.com/api/#{Figaro.env.wunderground_api_key}/geolookup/conditions/q/AZ/Phoenix.json")

  if params[:city] != nil
    params[:city].gsub!(" ", "_")
  end

  if params[:state] != "" && params[:city] != ""
    if params[:state] != nil && params[:city] != nil
      response = HTTParty.get("http://api.wunderground.com/api/#{Figaro.env.wunderground_api_key}/geolookup/conditions/q/#{params[:state]}/#{params[:city]}.json")
    end
  else
    response = HTTParty.get("http://api.wunderground.com/api/#{Figaro.env.wunderground_api_key}/geolookup/conditions/q/AZ/Phoenix.json")
  end


  @location = response['location']['city']
  @temp_f = response['current_observation']['temp_f']
  @temp_c = response['current_observation']['temp_c']
  @weather_icon = response['current_observation']['icon_url']
  @weather_words = response['current_observation']['weather']
  @forecast_link = response['current_observation']['forecast_url']
  @real_feel_f = response['current_observation']['feelslike_f']
  @real_feel_c = response['current_observation']['feelslike_c']

  if @weather_words == "Lightning" 
  		@url = "https://pixabay.com/static/uploads/photo/2013/10/23/09/05/lightning-199651_1280.jpg"
  	elsif @weather_words == "Rain" 
  		@url = "https://pixabay.com/static/uploads/photo/2015/06/19/20/14/water-815271_1280.jpg"
  	elsif @weather_words == "Snow" 
  		@url = "https://pixabay.com/static/uploads/photo/2013/12/28/13/23/winter-234721_1280.jpg"
  	elsif @weather_words == "Partly Cloudy" 
  		@url = "https://pixabay.com/static/uploads/photo/2013/11/01/08/46/sun-203792_1280.jpg"
  	elsif @weather_words == "Fog"
  		@url = "https://pixabay.com/static/uploads/photo/2014/12/17/18/40/fog-571786_1280.jpg" 
  	elsif @weather_words == "Stormy" 
  		@url = "https://pixabay.com/static/uploads/photo/2015/11/17/15/24/road-1047723_1280.jpg"
  	elsif @weather_words == "Clear" 
  		@url = "https://pixabay.com/static/uploads/photo/2015/12/04/19/56/sky-background-1077084_1280.jpg"
   	else
   		@url = "https://pixabay.com/static/uploads/photo/2016/01/19/17/16/rainbow-background-1149610_1280.jpg"
  	end
	end
 
  def test
  response = HTTParty.get("http://api.wunderground.com/api/#{ENV['wunderground_api_key']}/geolookup/conditions/q/AZ/Phoenix.json")
  
  @location = response['location']['city']
  @temp_f = response['current_observation']['temp_f']
  @temp_c = response['current_observation']['temp_c']
  @weather_icon = response['current_observation']['icon_url']
  @weather_words = response['current_observation']['weather'] 
  @forecast_link = response['current_observation']['forecast_url']
  @real_feel = response['current_observation']['feelslike_f']
  end
end
