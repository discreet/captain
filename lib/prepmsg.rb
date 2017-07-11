# This module is used to prepare the status of all the pre-commit hooks to be
# included in the commit message
#
module Prepare
  def self.signature(hookStatus)
    shuffled_string = 'Captain'.split('').shuffle.join
    hashID = Digest::SHA1.hexdigest shuffled_string
    @hookStatus = "\n#{hookStatus}\
                   \nSigned off by Captain\
                   \nApproval ID: #{hashID}\n"
  end

  def self.message(originalMessage)
    commentMatch = originalMessage.match(/((^#.*$\n){3})/)

    @resultPosition = if commentMatch
                        commentMatch.offset(0)[0]
                      else
                        @originalMessage == originalMessage.length - 1
                      end
  end

  def self.write(originalMessage, resultPosition, hookStatus, messageFile)
    originalMessage.insert(resultPosition, hookStatus) if ARGV[1] == 'message'
    File.open("../#{messageFile}", 'w') { |f| f.write originalMessage }
    File.delete('/tmp/hookStatus')
  end
end
