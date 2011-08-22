class Transaction::Goods::Item < ActiveRecord::Base
  belongs_to :goods_item
  belongs_to :transaction_record
end
