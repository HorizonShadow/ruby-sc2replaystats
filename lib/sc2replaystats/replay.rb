module Sc2replaystats
  class Replay
    def initialize(client)
      @client = client
    end

    def my_replays
      @client.get '/replay'
    end

    def replay_info(id, *parms)
      parms.map! { |p| "\"#{p}\"" }
      @client.get "/replay/#{id}?include=[#{parms.join(',')}]"
    end

    def upload_status(id)
      @client.get "/replay/status/#{id}"
    end

    def upload(file)
      @client.post('/replay', file)
    end
  end
end