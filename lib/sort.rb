# Sort Algoritms
#
# Richard Buckland Lectures on youtube (Data Structures and Algorthims - COMP1927 UNSW) inspired

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
      end
      return ary
    end
  end
  
  class InsertionSort
    def do_sort(ary)  
      # Using unshift, push and concatenation to make sorted output array (outary)
      # I'm not sure of the time savings of using these built-in functions,
      # but I hope it's better than bumping all greater elements after insertion
      # Best case - already sorted, insert at the end, each time - O(n) complexity
      # Worst case - reverse sorted, search full outary each time - O(n^2)
      outary = []
      outary.push ary[0]
      for i in 1...ary.length
        j = outary.length - 1
        if ary[i] < outary[j]
          #find correct position
          while (j >= 0) && ary[i] < outary[j]
            j -= 1
          end
          if j < 0 then # is smallest so far, goes at the beginning
            outary.unshift(ary[i])
          else # goes between other elements in the sorted list
            outary = (outary[0..j].push ary[i]) + outary[(j + 1)...outary.length] 
          end
        else # is biggest so far, goes at the end
          outary.push ary[i]      
        end
      end
      return outary
    end
  end
  
  class BrettCountSort
    def do_sort(ary)
      n = ary.length
      min = 0
      max = 0
      ary.each do |val|
        if val < min
          min = val
        elsif val > max
          max = val
        end
      end
      countary = Array.new((max - min + 1), 0)
      ary.each do |val|
        countary[val - min] += 1
      end
      key = min
      i = 0
      countary.each do |val|
        j = 0
        while j < val
          ary[i] = key
          i += 1
          j += 1
        end
        key += 1
      end
      return ary
    end
  end
end
