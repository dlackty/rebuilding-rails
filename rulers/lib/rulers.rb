require "rulers/version"
require "rulers/array"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"
require "rulers/file_model"

module Rulers
  class Application
    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        return [404, {"Content-Type" => "text/html"}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      controller.send(act)

      unless controller.get_response
        controller.render(act)
      end

      st, hd, rs = controller.get_response.to_a
      [st, hd, [rs.body].flatten]
    end
  end
end
