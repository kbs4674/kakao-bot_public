class CrawlingEverytime < ApplicationRecord
    validates_uniqueness_of :article_id
    
    resourcify
end