class HomesController < ApplicationController
  # require 'httpclient'
  # require 'uri'
  require 'httpclient'
  def search
    area = params[:area]
    Rails.logger.warn(area)
    client  = HTTPClient.new
    url = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=84e031b856c8a88e&address=沖縄県#{area}&format=json"
    response  = client.get(url)
    res = JSON.parse(response.body)
    Rails.logger.warn(res)
    # array.map {|item|  logger.debug(item) }  # 各要素をログ出力
    shops = res['results']['shop']
    @result = shops.map{|shop| shop['name']}
    Rails.logger.warn(@result)
  end
end
