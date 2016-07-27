require 'minitest/autorun'
require_relative '../yaml-convert'

class YamlConvertTest < Minitest::Test
  def test_deep_merge_merges_two_nested_hashes
    h1 = {hello: {world: {im: "jeff"}}}
    h2 = {hello: {world: {imnot: "not jeff"}}}
    output = h1.deep_merge(h2)

    assert_equal ({hello: {world: {im: "jeff", imnot: "not jeff"}}}), output
  end
end
