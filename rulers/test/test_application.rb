require_relative "test_helper"

class TestApp < Rulers::Application
end

class TestController < Rulers::Controller
  def test
    render text: "Hello test!"
  end
end

class RulerAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/test/test"

    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

  def test_favicon
    get "/favicon.ico"

    assert last_response.not_found?
  end
end
