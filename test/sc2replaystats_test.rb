require_relative "test_helper"

class Sc2replaystatsTest < Minitest::Spec

  def setup
    @client = Sc2replaystats::Client.new ENV['sc2replaystats_auth'], ENV['sc2replaystats_hash']
    @account = Sc2replaystats::Account.new(@client)
    @replay = Sc2replaystats::Replay.new(@client)
    @player = Sc2replaystats::Player.new(@client)
    @ladder = Sc2replaystats::Ladder.new(@client)
  end

  def test_that_it_gets_last_replay
    last_replay = @account.last_replay
    refute_nil last_replay
  end

  def test_that_it_gets_all_accounts
    -> { @account.all }.must_raise RestClient::Forbidden
  end

  def test_that_it_gets_a_replay
    replay_info = @replay.replay_info 4957291
    refute_nil replay_info
  end

  def test_that_it_gets_a_player
    @player.player_info(29)
  end

  def test_that_it_lambdas_a_call
    @player.player_info(29)[:ladders].call(32)
  end

  def test_that_it_gets_a_ladder
    #@ladder.all(32, :US)
  end

end
