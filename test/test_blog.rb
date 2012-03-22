require_relative "../lib/blog.rb"
require "test/unit"
require "rack/test"

# this is from http://ruby.learncodethehardway.org/book/ex51.html

ENV['RACK_ENV'] = 'test'

class BlogTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end

  def assert_response(resp, contains=nil, matches=nil, headers=nil, status=200)
    assert_equal(resp.status, status, "Expected response #{status} not in #{resp}")

    if status == 200
      assert(resp.body, "Response data is empty.")
    end

    if contains
      assert((resp.body.include? contains), "Response does not contain #{contains}")
    end

    if matches
      reg = Regexp.new(matches)
      assert reg.match(contains), "Response does not match #{matches}"
    end

    if headers
      assert_equal(resp.headers, headers)
    end
  end

  def test_index
    # check that we get a 404 on the / URL
    get("/foo")
    assert_response(last_response, nil, nil, nil, 404)

    # test our first GET request to /hello
    get("/sorts")
    assert_response(last_response)

    # make sure default values work for the form
    post("/sorts")
    assert_response(last_response, "Nobody")

    # test that we get expected values
    post("/sorts", :numbers_in => "5,3,4,1,2")
    assert_response(last_response, "5,3,4,1,2")
  end
end

