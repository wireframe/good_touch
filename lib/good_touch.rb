require "good_touch/version"

module GoodTouch
  module InstanceMethods
    #touch a record without triggering callbacks
    #update DB directly to avoid overhead of reindexing the user
    def good_touch(*args)
      value=args.pop unless args.empty?
      if value.kind_of? Symbol
        args << value
        value=Time.now.utc
      end
      args << :updated_at if args.empty?
      updates={}
      args.each { |arg| updates[arg]=value }
      self.class.update_all(updates, {:id => self.id})
    end
  end
end

ActiveRecord::Base.send(:include, GoodTouch::InstanceMethods)
