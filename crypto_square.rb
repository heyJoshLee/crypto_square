class Crypto

  attr_accessor :input, :size

  def initialize(input)
    @input = input
  end

  def ciphertext
    output = ""
    data = plaintext_segments

    loop do 
      data.each do |string|
        output += string.slice!(0) if string.length > 0
      end
      break if data[0] == ""
    end
    output
  end

  def normalize_ciphertext

    ciphertext.chars.each_slice(size-1).map(&:join).join(" ")
  end
  

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).map(&:join)
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def normalize_plaintext
    @input = @input.gsub(/[^a-zA-Z\d]/, "").downcase
  end

end