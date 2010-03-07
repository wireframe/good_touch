module GoodTouch
  module InstanceMethods
    #touch a record without triggering callbacks
    #update DB directly to avoid overhead of reindexing the user
    def good_touch(attr = :updated_at)
      self.class.update_all({attr => Time.now.utc}, {:id => self.id})
    end
  end
end

ActiveRecord::Base.send(:include, GoodTouch::InstanceMethods)
