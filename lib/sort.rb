# BUBBLE SORT
#
# Richard Buckland youtube Data Structures and Algorthims inspired

module Sort
  class BubbleSort
    def do_sort(input)
      totalsize = input.size
      
      begin
        swapcount = 0
        loopcount = 0
        input.each do  # this is missing efficiency step: should stop short 1 node from the last iteration (ie: 0 to size-1, 0 to size-2, 0 to size - 3, etc)
          if loopcount < totalsize - 1
            if input[loopcount] > input[loopcount + 1]
              swap = input[loopcount]
              input[loopcount] = input[loopcount + 1]
              input[loopcount+1] = swap
              swapcount += 1
            end
          end
          loopcount += 1
        end
      end while swapcount > 0
      return input
    end
  end
  # mysort = BubbleSort.new
  # puts "#{mysort.do_sort([1,9,3,8,2,4,25,13,6])}"
  
  class BrettSort
    def do_sort(ary)
      sz=ary.size
      if sz < 3  # end condition: return array as is unless size is 2 and they are out of order, then swap first
        if sz==2
          if ary[0] > ary[1]  
            swap = ary[0]
            ary[0] = ary[1]
            ary[1] = swap
          end
        end
        return ary
      else 
        sum=0
        ary.each do |x|
          sum += x
        end
        avg=sum/sz
        hi=sz-1
        i=0
        while i <= hi
          x = ary[i]
          if x > avg
            if ary[hi] <= avg
              ary[i] = ary[hi]
              ary[hi] = x
            else
              i-=1 # keep i where it is for next loop but lower hi
            end
            hi -= 1
          end
          i += 1
        end
        #puts "sorting.  size=#{sz}, i=#{i}, avg=#{avg}, hi=#{hi}, array=#{ary.join ","}, ary1=#{ary[0..(hi)].join ","}, ary2=#{ary[-(sz-(hi)-1)..-1].join ","}"
        if sz-hi-1 <1 # special condition, last array item only larger than avg or they are all equal, split on last item
          do_sort(ary[0..(hi-1)]).concat(do_sort(ary[-(sz-(hi))..-1])) 
        else
          do_sort(ary[0..(hi)]).concat(do_sort(ary[-(sz-(hi)-1)..-1])) 
        end
      end
    end
  end
  # mysort = BrettSort.new
  # puts "#{mysort.do_sort([1,9,3,8,2,4,25,13,6])}"
  
end
