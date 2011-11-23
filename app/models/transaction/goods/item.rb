#encoding: utf-8
# crh - ERP
# Copyright (C) 2011-2011  Clairton Rodrigo Heinzen
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.


class Transaction::Goods::Item < ActiveRecord::Base
  belongs_to :goods_item, :class_name => "Goods::Item", :foreign_key => "goods_item_id"
  belongs_to :transaction_record, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
  has_many :transaction_goods_taxe, :class_name => "Transaction::Goods::Taxe",:foreign_key=>"transaction_goods_item_id" ,:dependent => :destroy
  has_many :transaction_goods_additional, :class_name => "Transaction::Goods::Additional",:foreign_key=>"transaction_goods_item_id" ,:dependent => :destroy
  validates_presence_of :transaction_record_id, :goods_item_id
  validates_associated :goods_item, :class_name => "Goods::Item", :foreign_key => "goods_item_id"
  validates_associated :transaction_record, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
end
