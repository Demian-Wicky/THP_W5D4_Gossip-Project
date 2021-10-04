class Gossip < ApplicationRecord
  has_many :join_table_gossips_tags
  has_many :tags, through: :join_table_gossips_tags

  belongs_to :user 
end
