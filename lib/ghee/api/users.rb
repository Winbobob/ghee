class Ghee

  # API module encapsulates all of API endpoints
  # implemented thus far
  #
  module API

    # The Users module handles all of the Github User
    # API endpoints
    #
    module Users

      # Users::Proxy inherits from Ghee::Proxy and
      # enables defining methods on the proxy object
      #
      class Proxy < ::Ghee::ResourceProxy

        # Patch user
        #
        # attributes - Hash of attributes
        #
        # Returns json
        #
        def patch(attributes)
          connection.patch('/user', attributes).body
        end

        # Gists for a user
        #
        # Returns json
        #
        def gists
          connection.get("#{path_prefix}/gists").body
        end
      end

      # Get authenticated user
      #
      # Returns json
      #
      def user
        Proxy.new(connection, '/user')
      end

      # Get a single user
      #
      # user - String of user login
      #
      # Returns json
      #
      def users(user)
        Proxy.new(connection, "/users/#{user}")
      end
    end
  end
end