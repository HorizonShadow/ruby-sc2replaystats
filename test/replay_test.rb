require_relative "test_helper"

class ReplayTest < MiniTest::Spec
  def setup
    @client = Sc2replaystats::Client.new ENV['sc2replaystats_auth'], ENV['sc2replaystats_hash']
    @replay = Sc2replaystats::Replay.new(@client)
  end

  def test_that_it_gets_my_replays
    @replay.my_replays
  end

  def test_that_it_gets_replay_info
    @replay.replay_info(2566)
  end

  def test_that_it_gets_replay_info_with_parms
    p @replay.replay_info(2566, 'players')
  end

  def test_that_it_uploads_a_replay
    @replay.upload(File.open('test/test.SC2Replay'))
  end

  def test_that_it_checks_upload_status
    resp = @replay.upload(File.open('test/test.SC2Replay'))
    @replay.upload_status(resp['replay_queue_id'])
  end
end