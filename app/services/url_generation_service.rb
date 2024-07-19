class UrlGenerationService
  def self.generate_short_url(long_url)
    binding.pry
    int64 = UrlGenerator.generate_rand_64_bit_int
    base58_string = UrlGenerator.encode_to_base_58(int64)
    short_url = ShortUrl.create!(short_id: int64, domain: 'localhost:3000')

    return_url = "#{short_url.domain}/#{base58_string}"
  end
end