class CodeWarsThirdKata

  def mean(lst)
    #your code here
    int = 0
    str = ''
    average = 0

    array = [int, str]

    lst.each do |value|

      if value.numeric?
        array[0] = (array[0] + value.to_f)
        average += 1
      else
        array[1] = array[1] + value
      end
    end

    array[0] /= average
    array
  end

end

class String
  def numeric?
    Float(self) != nil rescue false
  end
end

