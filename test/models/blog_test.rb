require 'test_helper'

class BlogTest < ActiveSupport::TestCase
    test "Blog should be valid ?" do
        @blog = Blog.new(name: "Sports")
        assert @blog.valid?
    end

end
