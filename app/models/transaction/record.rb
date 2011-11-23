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


class Transaction::Record < ActiveRecord::Base
  has_many :transaction_participant, :class_name => "Transaction::Participant", :dependent => :destroy, :foreign_key => "transaction_record_id"
  has_many :transaction_financier, :class_name => "Transaction::Financier", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_many :transaction_taxe, :class_name => "Transaction::Taxe", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_many :transaction_tot, :class_name => "Transaction::Tot", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_many :transaction_item, :class_name => "Transaction::Goods::Item", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_one :transaction_xml, :class_name => "Transaction::Xml", :dependent => :destroy , :foreign_key => "transaction_record_id"
  validates_presence_of :creation_date, :code, :name
  validates_uniqueness_of :code
end

