class Wordplay

end

class String
  def sentences
    gsub(/\n|\r/, ' ').split(/\.\s*/)
  end
end