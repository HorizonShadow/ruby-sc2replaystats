module Sc2replaystats
  class Replay
    def initialize(client)
      @client = client
    end

    def my_replays
      @client.get '/replay'
    end

    def replay_info(id)
      @client.get "/replay/#{id}"
    end

    def upload_status(id)
      @client.get "/replay/upload_status/#{id}"
    end

    def upload(file)
      @client.post('/replay', file)['replay_queue_id']
    end
  end
end