class Tweet < ActiveRecord::Base
  attr_accessible :author, :content, :when
end
