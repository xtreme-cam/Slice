require 'test/unit'

class UnitTests < Test::Unit::TestCase

  def test_first_half
    `./slice ,5 test.in > out.txt`
    output = File.open("out.txt","r").readlines.map{ |x| x.to_i }
    assert( [1,2,3,4,5] == output)
  end

  def test_last_half
    `./slice 5, test.in > out.txt`
    output = File.open("out.txt","r").readlines.map{ |x| x.to_i }
    assert( [6,7,8,9,10] == output)
  end

  def test_no_lines
    `./slice 0,0 test.in > out.txt`
    output = File.open("out.txt","r").readlines.map{ |x| x.to_i }
    assert([] == output)
  end

  def test_no_lines2
    `./slice e, test.in > out.txt`
    output = File.open("out.txt","r").readlines.map{ |x| x.to_i }
    assert([] == output)
  end

  def test_one_line
    `./slice 0,1 test.in > out.txt`
    output = File.open("out.txt","r").readlines.map{ |x| x.to_i }
    assert([1] == output)
  end

  def test_all_lines
    `./slice 0, test.in > out.txt`
    output = File.open("out.txt","r").readlines.map{ |x| x.to_i }
    assert([1,2,3,4,5,6,7,8,9,10] == output)
  end

  def test_all_lines2
    `./slice 0,e test.in > out.txt`
    output = File.open("out.txt","r").readlines.map{ |x| x.to_i }
    assert([1,2,3,4,5,6,7,8,9,10] == output)
  end

  def test_all_but_last_two_lines
    `./slice 0,e-2 test.in > out.txt`
    output = File.open("out.txt","r").readlines.map{ |x| x.to_i }
    assert([1,2,3,4,5,6,7,8] == output)
  end

  def test_start_greater_then_end
    `./slice e,4 test.in > out.txt`
    output = File.open("out.txt","r").readlines.map{ |x| x.to_i }
    assert([] == output)
  end

  def test_end_greater_then_actual_end
    `./slice 8,111 test.in > out.txt`
    output = File.open("out.txt","r").readlines.map{ |x| x.to_i }
    assert([9,10] == output)
  end

  def test_division
    `./slice 0,e/2 test.in > out.txt`
    output = File.open("out.txt","r").readlines.map{ |x| x.to_i }
    assert([1,2,3,4,5] == output)
  end

  def test_many_es
    `./slice 0,e/2+e/4 test.in > out.txt`
    output = File.open("out.txt","r").readlines.map{ |x| x.to_i }
    assert([1,2,3,4,5,6,7] == output)
  end
end
