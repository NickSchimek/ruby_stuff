require 'minitest/autorun'
require "./random_number_generator"

class TestRandomNumberGenerator < MiniTest::Test

  # def setup
  #   @rng = random_number_generator.new
  # end

  def test_generate
    file = "testFile_4623452347645352345.txt"
    RandomNumberGenerator.generate file, 10, 10

    fd = open file
    assert fd.read.split(' ').count == 10

    fd.close
    FileUtils.remove_file file
  end
end
