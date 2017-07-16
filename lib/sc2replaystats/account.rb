module Sc2replaystats
  class Account
    def initialize(client)
      @client = client
    end

    def last_replay
      @client.get '/account/last-replay'
    end

    def all
      @client.get '/account'
    end
  end
end