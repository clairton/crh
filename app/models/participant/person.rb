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

class Participant::Person < ActiveRecord::Base
  #has_many :Email, :class_name => "Participant::Contact::Email"
  #has_many :address, :class_name => "Participant::Contact::Address"
  has_many :participant_type, :class_name => "Participant::Type", :dependent => :destroy, :foreign_key => "participant_person_id"
  validates_presence_of :first_name,:code
  validates_uniqueness_of :code
end

