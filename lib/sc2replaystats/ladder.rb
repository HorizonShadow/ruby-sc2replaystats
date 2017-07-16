module Sc2replaystats
  class Ladder
    def initialize(client)
      @client = client
    end

    def all(id, server)
      @client.get "/ladder/#{id}/#{server}"
    end

    def servers
      #TODO: return an array of valid servers
    end
  end
end