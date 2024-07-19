module UrlGenerator
  BASE58_ALPHABET = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz".chars.freeze
  BASE = BASE58_ALPHABET.length

  module_function

  def generate_rand_64_bit_int
    SecureRandom.random_number(2**64)
  end

  def encode_to_base_58(int)
    return BASE58_APLPHABET[0] if int == 0

    base58 = ""

    while int > 0
      remainder = int % 58
      int /= 58
      base58 = BASE58_ALPHABET[remainder] + base58
    end

    base58
  end

  def decode_from_base_58(b58_string)
    int_val = 0

    b58_string.reverse.split(//).each_with_index do |char,index|
      char_index = BASE58_ALPHABET.index(char)
      int_val += (char_index)*(BASE**(index))
    end

    int_val
  end
end