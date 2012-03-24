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
      else # not end condition
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
        if sz-hi-1 <1 # special condition, last array item only larger than avg or they are all equal, split on last item
          do_sort(ary[0..(hi-1)]).concat(do_sort(ary[-(sz-(hi))..-1])) 
        else
          do_sort(ary[0..(hi)]).concat(do_sort(ary[-(sz-(hi)-1)..-1])) 
        end
      end
    end
  end

  class SelectionSort
    def do_sort(ary)  # Done with swap instead of 2 arrays
      outermax = ary.length - 2
      innermax = ary.length - 1
      for i in 0..outermax
        swap = false
        smallestposn = i
        for j in i..innermax
          if ary[j] < ary[smallestposn]
            smallestposn = j
            swap = true
          end
        end
        if swap == true
          #swap unfilled slot with smallest
          temp = ary[i]
          ary[i]=ary[smallestposn]
          ary[smallestposn]=temp
          swap = false
        end
      puts "i=#{i}, j=#{j}, sp=#{smallestposn}"
      puts ary.length
      end
      return ary
    end
  end

end
