module OpenMensa
  module Resources
    module V1
      def self.headers(status, head = {})
        css_class = (status == 204 || status == 404) ? 'headers no-response' : 'headers'
        lines = ["Status: #{STATUSES[status]}"]
        head.each do |key, value|
          lines << "#{key}: #{value}"
        end
        %(<pre class="#{css_class}"><code>#{lines * "\n"}</code></pre>\n)
      end

      def self.sidebar_identifier
        'sidebar_v1'
      end

      MEAL = {
        "meal" => {
          "id" => 260,
          "name" => "Rührei mit Knackwurst",
          "description" => "Paprika und Tomaten, Paprika und Tomaten,",
          "date" => "2012-07-13T02:00:00+02:00"
        }
      }

      CAFETERIA = {
        "cafeteria" => {
          "id" => 1,
          "name" => "Mensa Jena, Ernst-Abbe-Platz",
          "address" => "Ernst-Abbe-Platz 8, 07743 Jena, Germany",
          "meals" => [MEAL]
        }
      }
    end
  end
end