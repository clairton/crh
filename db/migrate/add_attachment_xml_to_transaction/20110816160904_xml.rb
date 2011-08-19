class AddAttachmentXmlToTransaction::Xml < ActiveRecord::Migration
  def self.up
    add_column :transaction/xmls, :xml_file_name, :string
    add_column :transaction/xmls, :xml_content_type, :string
    add_column :transaction/xmls, :xml_file_size, :integer
    add_column :transaction/xmls, :xml_updated_at, :datetime
  end

  def self.down
    remove_column :transaction/xmls, :xml_file_name
    remove_column :transaction/xmls, :xml_content_type
    remove_column :transaction/xmls, :xml_file_size
    remove_column :transaction/xmls, :xml_updated_at
  end
end
