module Captain
  class Signature

    def self.signature
      shuffled_string = 'Captain'.split('').shuffle.join
      hashID = Digest::SHA1.hexdigest shuffled_string
    end
  end
end
