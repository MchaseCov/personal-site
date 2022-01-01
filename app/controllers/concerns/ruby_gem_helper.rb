module RubyGemHelper
  def fetch_gem_info
    url = 'https://rubygems.org/api/v2/rubygems/hotwire_scaffold_generator/versions/1.0.1.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)
    @count = result['downloads']
  end
end
