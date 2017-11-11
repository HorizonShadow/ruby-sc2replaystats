require_relative "test_helper"

class ReplayTest < MiniTest::Spec
  def setup
    @client = Sc2replaystats::Client.new 'bbdb77701e3cf5bfa8828b9cabb8d597bb4f12a0;341b9f7cc549bf642a63286242a59af5baae0e29;1496719099', '1ed0c80a77847ec'
    @replay = Sc2replaystats::Replay.new(@client)
  end

  def test_that_it_gets_my_replays
    @replay.my_replays
  end

  def test_that_it_gets_replay_info
    @replay.replay_info(2566)
  end

  def test_that_it_uploads_a_replay
    @replay.upload(File.open('test/test.SC2Replay'))
  end

  def test_that_it_checks_upload_status
    p @replay.upload_status(7355323)
  end
end