
# JSON is included in 1.9 directly, for 1.8 do `gem install json`
require 'json'

module OpenMensa
  module Resources
    module Helpers
      STATUSES = {
        200 => '200 OK',
        201 => '201 Created',
        202 => '202 Accepted',
        204 => '204 No Content',
        301 => '301 Moved Permanently',
        304 => '304 Not Modified',
        401 => '401 Unauthorized',
        403 => '403 Forbidden',
        404 => '404 Not Found',
        409 => '409 Conflict',
        422 => '422 Unprocessable Entity',
        500 => '500 Server Error'
      }

      # derives the API version of the document currently processed by nanoc
      def api_version
        return nil if item.identifier.split('/')[1] != 'api'
        item.identifier.split('/')[2].to_s.upcase
      end

      def headers(*opts)
        Resources.const_get(api_version).headers(*opts)
      end

      def sidebar_identifier(*opts)
        return "sidebar_default" if api_version == nil
        Resources.const_get(api_version).sidebar_identifier(*opts)
      end

      def json(key)
        hash = case key
          when Hash
            h = {}
            key.each { |k, v| h[k.to_s] = v }
            h
          when Array
            key
          else
            Resources.const_get(api_version).const_get(key.to_s.upcase)
        end
        hash = yield hash if block_given?
        %(<pre class="highlight"><code class="CodeRay language-javascript">#{JSON.pretty_generate(hash)}</code></pre>)
      end
    end
  end
end

include OpenMensa::Resources::Helpers
