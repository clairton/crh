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

#encoding: utf-8

class Transaction::Goods::Additional < ActiveRecord::Base
  belongs_to :goods_additional_value, :class_name => "Goods::Additional::Value", :dependent => :destroy, :foreign_key => "goods_additional_value_id"
  belongs_to :transaction_item, :class_name => "Transaction::Goods::Item",:foreign_key=>"transaction_goods_item_id"
  validates_associated :transaction_item, :class_name => "Transaction::Goods::Item",:foreign_key=>"transaction_goods_item_id"
  validates_associated :goods_additional_value, :class_name => "Goods::Additional::Value", :foreign_key => "goods_additional_value_id"
  validates_uniqueness_of :goods_additional_value_id
  validates_presence_of :transaction_goods_item_id, :goods_additional_value_id
end
