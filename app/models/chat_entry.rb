class ChatEntry < ActiveRecord::Base

validates :content, :presence => true
validates :date, :presence => true
belongs_to :report
belongs_to :user
end