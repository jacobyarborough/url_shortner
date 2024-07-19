class UrlGenerationService
  def self.generate_short_url(long_url)
    return create_url_hash(long_url) if has_short_url?(long_url)
    create_short_url(long_url)
  end

  private 
  
  def self.has_short_url?(long_url)
    long_url.short_url
  end

  def self.create_url_hash(long_url)
    return_hash = {
      full_url: long_url.full_url,
      short_url: long_url.short_url.short_url
    }
  end

  def self.create_short_url(long_url)
    int64 = UrlGenerator.generate_rand_64_bit_int
    base58_string = UrlGenerator.encode_to_base_58(int64)
    short_url = ShortUrl.create!(identifier: int64, domain: 'localhost:3000', base58: base58_string, long_url: long_url)

    return_hash = {
      full_url: long_url.full_url,
      short_url: short_url.short_url
    }
  end
end