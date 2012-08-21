
# JSON is included in 1.9 directly, for 1.8 do `gem install json`
require 'json'

require 'rexml/document'

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

      def current_type_version
        [item.identifier.split('/')[1].to_s.to_sym, item.identifier.split('/')[2].to_s.to_sym]
      end

      def current_res_module
        res_module_name(*current_type_version)
      end

      # returns a string for embedding right into markdown (may contain html)
      # that contains some HTTP headers (**resource-dependent**)
      def headers(*opts)
        Resources.const_get(current_res_module).headers(*opts)
      end

      # returns the identifier aka item name for a nanoc layout to be rendered
      # as sidebar content that varies with current resource (**resource-dependent**)
      def sidebar_identifier(*opts)
        return 'sidebar_empty' if current_res_module == nil
        Resources.const_get(current_res_module).sidebar_identifier(*opts)
      end

      # returns the name of a ruby module X found as to OpenMesna::Resources::X
      def res_module_name(type, version)
        case type
        when :api
          "API#{version}"
        when :feed
          "Feed#{version}"
        else
          nil
        end
      end

      # creates and renderes a nav item (<li>) to the given resource (nanoc item
      # made up by /type/version/)
      def nav_item(type, version)
        label = case type
        when :api
          "API #{version}"
        when :feed
          "Feed #{version}"
        end
        path = "/#{type}/#{version}/"
        classes = [type, version] == current_type_version ? 'current' : ''
        # build list item
        %(<li><a href="#{path}" class="#{classes}">#{label}</a></li>)
      end

      # return contents of the given file (path) as string
      def file_in(path)
        File.open(path, 'r') do |f| f.read end
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
            Resources.const_get(current_res_module).const_get(key.to_s.upcase)
        end
        hash = yield hash if block_given?
        code = encode_tags(JSON.pretty_generate(hash))
        %(<pre class="highlight"><code class="CodeRay language-javascript">#{code}</code></pre>)
      end

      def xml(xml_string, format=false)
        if format
          doc = REXML::Document.new(xml_string)
          doc.write(output="", 2)
          code = encode_tags(output)
        else
          code = encode_tags(xml_string)
        end
        %(<pre class="highlight"><code class="CodeRay language-xml">#{code}</code></pre>)
      end

      # escapes *some* html entities
      def encode_tags(string)
        string.to_s.gsub(/>/, "&gt;").gsub(/</, "&lt;")
      end
    end
  end
end

include OpenMensa::Resources::Helpers
