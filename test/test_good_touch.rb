require 'helper'

class Post < ActiveRecord::Base
end

ActiveRecord::Schema.define(:version => 1) do
  create_table :posts, :force => true do |t|
    t.column :title, :string
    t.column :posted_at, :timestamp
    t.timestamps
  end
end

class TestGoodTouch < Test::Unit::TestCase
  context "a new Post object" do
    setup do
      @post = Post.create! :title => 'hello world'
      @now = Time.now
    end

    context "calling good_touch with no params" do
      setup do
        @post.good_touch
      end
      should_change "updated_at timestamp", :to => @now do
        @post.reload.updated_at
      end
    end

    context "calling good_touch with posted_at timestamp attribute" do
      setup do
        @post.good_touch :posted_at
      end
      should_change "posted_at timestamp", :to => @now do
        @post.reload.posted_at
      end
    end

    context "calling good_touch with a value" do
      setup do
        @time = Date.parse("01/01/2010 12:00")
        @post.good_touch :updated_at, @time
      end
      should_change "updated_at timestamp", :to => @time do
        @post.reload.updated_at
      end
    end
  end
end
