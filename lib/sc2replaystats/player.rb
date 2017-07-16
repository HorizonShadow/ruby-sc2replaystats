module Sc2replaystats
  class Player
    def initialize(client)
      @client = client
    end

    def self.all(client)
      client.get '/player'
    end

    def player_info(id)
      resp = @client.get "/player/#{id}"
      resp[:ladders] = -> s_id { @client.get "/player/#{id}/ladders/#{s_id}" }
      resp[:replay] = -> s_id { @client.get "/player/#{id}/replays/#{s_id}"}
      resp
    end

    def player_ladder(player_id, season_id)
      @client.get "/player/#{player_id}/ladders/#{season_id}"
    end

    def player_replays(player_id, season_id)
      @client.get "/player/#{player_id}/replays/#{season_id}"
    end

  end
end