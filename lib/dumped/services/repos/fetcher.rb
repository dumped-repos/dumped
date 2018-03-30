require 'http'

module Services
  module Repos
    class Fetcher
      def call(url, &block)
        response = Http.get(url)

        headers = response.headers

        next_link = extract_next_link(headers['Link'])
        remaining_requests = headers['X-Ratelimit-Remaining']
        body_parsed = response.parse

        yield body_parsed

        if remaining_requests == '0'
          puts 'Sleeping for a minute'
          sleep(70)
        end

        call(next_link, &block) if next_link
      end

      private

      def extract_next_link(link_header)
        return if link_header.empty?
        splitted_string = link_header.split(',').map { |s| s.split(';') }
        url = splitted_string.select { |link, rel| rel.include?('next') }.flatten.first
        url.strip.slice(1..-2) if url
      end
    end
  end
end
