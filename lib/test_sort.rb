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

class TestInsertionSort < Test::Unit::TestCase
  def test_do_sort
    insertion = Sort::InsertionSort.new
    ary = [3, 2, 9, 5, 25, 4, 7]
    expected = insertion.do_sort(ary)
    assert_equal expected, [2, 3, 4, 5, 7, 9, 25]
  end
end
