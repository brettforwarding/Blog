require 'test/unit'
require_relative 'sort'

class TestBubbleSort < Test::Unit::TestCase
  def test_do_sort
    bubble= Sort::BubbleSort.new
    expected = bubble.do_sort([3,1,2])
    assert_equal expected, [1,2,3]
  end
end

class TestBrettSort < Test::Unit::TestCase
  def test_do_sort
    brett = Sort::BrettSort.new
    assert_equal brett.do_sort([1]), [1]
  end
end

class TestSelectionSort < Test::Unit::TestCase
  def test_do_sort
    selection = Sort::SelectionSort.new
    assert_equal selection.do_sort([1]), [1]
  end
end
