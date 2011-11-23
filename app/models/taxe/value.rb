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


class Taxe::Value < ActiveRecord::Base
	has_one :transaction_taxe, :class_name => "Transaction::Taxe", :dependent => :destroy, :foreign_key => "taxe_value_id"
  has_one :transaction_goods_taxe, :class_name => "Transaction::Goods::Taxe", :foreign_key => "taxe_value_id", :dependent => :destroy
	belongs_to :taxe_type, :class_name => "Taxe::Type", :foreign_key => "taxe_type_id"
	validates_numericality_of :percentage
	validates_numericality_of :basis
	validates_numericality_of :value
  validates_numericality_of :reduction
	validates_associated :taxe_type, :class_name => "Taxe::Type", :foreign_key => "taxe_type_id"
end

