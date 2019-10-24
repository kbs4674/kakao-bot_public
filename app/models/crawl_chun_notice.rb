class CrawlChunNotice < ApplicationRecord
  validates_uniqueness_of :title
end
