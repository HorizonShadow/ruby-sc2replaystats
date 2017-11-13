require 'net/http'
require 'rest_client'
require 'json'
module Sc2replaystats
  class Client
    URL = 'http://api.sc2replaystats.com'
    def initialize(auth, hashkey)
      @auth = auth
      @hashkey = hashkey
    end

    def get(path, args=nil)
      JSON.parse RestClient.get(URL + path, {
          Authorization: @auth,
          params: args
      }).body
    end

    def post(path, payload, args=nil)
      JSON.parse RestClient.post(URL + path, {
          replay_file: payload,
          upload_method: :something_else,
          hashkey: @hashkey,
      },{
        Authorization: @auth
      }).body
    end
  end
end