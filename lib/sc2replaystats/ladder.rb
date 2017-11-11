module Sc2replaystats
  class Ladder
    def initialize(client)
      @client = client
    end

    ##
    # Returns all ladders for a given season id and server
    def all(season_id, server)
      @client.get "/ladder/#{season_id}/#{server}"
    end

    def servers
      #TODO: return an array of valid servers
    end
  end
end