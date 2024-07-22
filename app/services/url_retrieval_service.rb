class UrlRetrievalService
  def self.get_short_url(long_url)
    if long_url = LongUrl.find_by(url: long_url)
      short_url = long_url.short_url
      int64 = long_url.short_url.identifier
      base58_string = UrlGenerator.encode_base_58(int64)

      return_hash = {
        long_url: long_url.url,
        short_url: short_url.url(base58_string)
      }
    else
      {
        message: "A short url has not been created for this url yet"
      }
    end
  end
end