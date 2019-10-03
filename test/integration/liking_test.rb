require 'test_helper'

class LikingTest < ActionDispatch::IntegrationTest
    def setup
        @user  = users(:michael)
        @other = users(:archer)
        @micropost = microposts(:orange)
        log_in_as(@user)
    end

    test "likes counted?" do
        log_in_as(@user)
        get root_path
        get @micropost_path
        assert_difference '@micropost.likes.count', 1 do
            post micropost_likes_path(@micropost), params: { micropost_id: @micropost.id }
        end
        
    end



end
