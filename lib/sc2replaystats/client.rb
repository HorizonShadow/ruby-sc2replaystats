require 'net/http'
require 'rest_client'
require 'json'
module Sc2replaystats
  class Client
    URL = 'http://api.sc2replaystats.com'
    def initialize(auth)
      @auth = auth
    end

    def get(path, args=nil)
      p URL+path
      JSON.parse RestClient.get(URL + path, {
          Authorization: @auth,
          params: args
      }).body
    end

    def post(path, payload, args=nil)
      JSON.parse RestClient.post(URL + path, payload,{
          Authorization: @auth,
          params: args
      }).body
    end
  end
end