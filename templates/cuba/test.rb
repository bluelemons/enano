ENV['ENV'] = 'test'

require './app'

scope do
  test 'Homepage' do
    get '/'

    assert_equal 'Welcome', last_response.body
  end
end
