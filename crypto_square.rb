class Crypto

  attr_accessor :input
  attr_reader :size

  def initialize(input)
    @input = input
  end

  def ciphertext
    encrypt
  end

  def normalize_ciphertext
    encrypt(" ")
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

  private

  def encrypt(delimiter=false)
    output = ""
    data = plaintext_segments

    until data[0] == ""
      data.each { |string| output += string.slice!(0) if string.length > 0 }
      output += delimiter if delimiter
    end

    output.strip
  end

end