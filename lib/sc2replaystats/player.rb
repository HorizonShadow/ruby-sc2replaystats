##
# Classes to access api endpoints
module Sc2replaystats
  ##
  # Methods to access player api endpoints
  class Player
    def initialize(client)
      @client = client
    end

    def self.all(client)
      client.get '/player'
    end

    # @param [int] player_id The player ID
    # @return [Object] Returns information about the player, as well as two
    # procs to get the ladders or replays for a given season
    def player_info(player_id)
      resp = @client.get "/player/#{player_id}"

      resp[:ladders] = lambda do |season_id|
        @client.get "/player/#{player_id}/ladders/#{season_id}"
      end

      resp[:replay] = lambda do |season_id|
        @client.get "/player/#{player_id}/replays/#{season_id}"
      end

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