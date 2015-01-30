module OpenMensa
  module Resources
  	module APIv2
      def self.headers(status, head = {})
        css_class = (status == 204 || status == 404) ? 'headers no-response' : 'headers'
        lines = ["Status: #{STATUSES[status]}"]
        head.each do |key, value|
          case key
            when :pagination
              lines << "Link: <http://openmensa.org/api/v2/#{value}?page=2>; rel=\"next\","
              lines << "      <http://openmensa.org/api/v2/#{value}?page=5>; rel=\"last\""
              lines << "X-Total-Pages: 5"
            else lines << "#{key}: #{value}"
          end
        end
        %(<pre class="#{css_class}"><code>#{lines * "\n"}</code></pre>\n)
      end

      def self.sidebar_identifier
        'sidebar_v2'
      end

      def self.curl(path, opts = {})
        %(<pre class="terminal"><code>$ curl -i http://openmensa.org/api/v2/#{path}</code></pre>)
      end

      MEAL = {
        "id" => 260,
        "name" => "Gemüse-Couscouspfanne mit Joghurt-Ingwer-Dip, dazu bunter Blattsalat",
        "notes" => [
          "ovo-lacto-vegetabil",
          "mensaVital"
        ],
        "prices" => {
          "student" => 2.30,
          "employee" => 3.65,
          "other" => 4.60
        },
        "category" => "Alternativ-Angebot"
      }

      MEAL2 = {
        "id" => 10900,
        "name" => "Hähnchenschnitzel mit Brötchen",
        "notes" => [],
        "prices" => {
          "pupil" => 2.40,
          "other" => 4.30,
        },
        "category" => "Cafeteria Heiße Theke"
      }

      MEALS = [MEAL, MEAL2]

      DAY = {
        "date" => "2012-10-12",
        "closed" => false
      }

      DAY2 = {
        "date" => "2012-10-15",
        "closed" => true
      }

      DAYS = [DAY, DAY2]

      CANTEEN = {
        "id" => 1,
        "name" => "Mensa UniCampus Magdeburg",
        "address" => "Pfälzer Str. 1, 39106 Magdeburg",
        "coordinates" => nil
      }

      CANTEEN2 = {
        "id" => 104,
        "name" => "Bistro Tasty Studio Babelsberg",
        "address" => "August-Bebel-Str. 26-53, 14482 Potsdam, Deutschland",
        "coordinates" => [
          52.3877669669544,
          13.1209909915924
        ]
      }

      CANTEENS = [CANTEEN, CANTEEN2]

      FAV = {
        "id" => 55,
        "canteen_id" => 1,
        "sort_value" => 4
      }

      FAV2 = {
        "id" => 56,
        "canteen_id" => 2,
        "sort_value" => 6
      }

      FAVS = [FAV, FAV2]
    end
  end
end
