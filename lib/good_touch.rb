module GoodTouch
  module InstanceMethods
    #touch a record without triggering callbacks
    #update DB directly to avoid overhead of reindexing the user
    def good_touch(attr = :updated_at, value = Time.now.utc)
      self.class.update_all({attr => value}, {:id => self.id})
    end
  end
end

ActiveRecord::Base.send(:include, GoodTouch::InstanceMethods)
