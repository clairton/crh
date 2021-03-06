# encoding: utf-8

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

require 'rexml/document'
require 'goods/item'
require 'financier/note'
require 'taxe/value'
require 'taxe/type'
require 'taxe/group'
require 'address/country'
require 'address/state'
require 'address/city'
require 'address/neighborhood'
require 'address/street'
require 'participant/person'
require 'participant/type'
require 'participant/issuer'
require 'participant/sender'
require 'participant/delivery'
require 'participant/contact'
require 'participant/contact/address'
require 'participant/contact/email'
require 'participant/contact/type'
class Transaction::Xml < ActiveRecord::Base
  belongs_to :transaction_record, :class_name => 'Transaction::Record', :dependent => :destroy , :foreign_key => "transaction_record_id"
  validates_uniqueness_of :transaction_record_id, :name
  validates_associated :transaction_record, :class_name => 'Transaction::Record', :foreign_key => "transaction_record_id"
  #validates_presence_of :content, :message => 'Deve Informar Um arquivo Xml'
  #has_attached_file :xml

  public
  def parse(file)
    Transaction::Xml.transaction do
      xml = REXML::Document.new file
      
      string = File.open(file.path, 'rb') { |file| file.read }
      
      if !xml.elements['nfeProc'].nil?
        @rootTag = xml.elements['nfeProc'].elements['NFe']
        @rootTagName = 'nfeProc/NFe/'
      elsif !xml.elements['NFe'].nil?
        @rootTag = xml.elements['NFe']
        @rootTagName = 'NFe/'
      else
        @erros = 'não é um arquivo valido'
        return false
      end
      ide = @rootTag.elements['infNFe'].elements['ide']

      if(record = Transaction::Record.find_by_code(ide.elements['nNF'].text()))
        puts 'ja existe uma nota ' + ide.elements['nNF'].text()
        return false
      end
      #corpo da nota
      record = Transaction::Record.create(
          #data de emissao
          :creation_date => ide.elements['dEmi'].text(),
          #número da nota fiscal
          :code => ide.elements['nNF'].text(),
          #natureza da operacao
          :name => ide.elements['natOp'].text(),
          #total dos produtos
          :goods => @rootTag.elements['infNFe'].elements['total'].elements['ICMSTot'].elements['vProd'].text(),
          #valor do financeiro, total da operacao
          :tot => @rootTag.elements['infNFe'].elements['total'].elements['ICMSTot'].elements['vNF'].text()
      )
      if !record.save()
        @errors = record.errors
        puts 'erro ao salvar records '
        return false
      else
        @@transaction_record_id = record.id()
      end


      Transaction::Xml.create(
        :transaction_record_id => record.id(),
        :content => string,
        :name => ide.elements['nNF'].text()
      ).save

      if !parse_create_instances()
        puts 'erro ao criar as instancias '
        return false
      end
      if !parse_issuer(
          @rootTag.elements['infNFe'].elements['emit'],
          record.id
      )
        puts 'erro ao salvar emitente '
        return false
      end
      if !parse_sender(
          @rootTag.elements['infNFe'].elements['dest'],
          record.id
      )
        puts 'erro ao salvar destinatario '
        return false
      end

      if !parse_tot(
          @rootTag.elements['infNFe'].elements['total'].elements['ICMSTot'],
          record.id
        )
        puts 'erro ao salvar os totais'
        return false
      end

      #parcelas
      if !parse_financier(xml, record)
        return false
      end

      #itens da nota
      if !parse_item(xml, record.id)
        puts 'erro ao salvar itens '
        return false
      end
    end
    return true
  end#parse

  private
  def parse_create_instances
    @additional_total = Goods::Additional::Type.find_by_name('TOTAL')
    if @additional_total.nil?()
      @additional_total = Goods::Additional::Type.create(
        :name => 'TOTAL',
        :remark => 'Total Produtos/Servicos'
      )
      if !@additional_total.save()
        puts 'erro ao criar a instancia Valor Total Produtos/Servicos'
        @errors = @additional_total.errors
        return false
      end
    end
    @additional_financeiro = Goods::Additional::Type.find_by_name('FINANCEIRO')
    if @additional_financeiro.nil?()
      @additional_financeiro = Goods::Additional::Type.create(
        :name => 'FINANCEIRO',
        :remark => 'Total Financeiro'
      )
      if !@additional_financeiro.save()
        puts 'erro ao criar a instancia Valor Total Financeiro'
        @errors = @additional_financeiro.errors
        return false
      end
    end
    @additional_frete = Goods::Additional::Type.find_by_name('FRETE')
    if @additional_frete.nil?()
     @additional_frete = Goods::Additional::Type.create(
        :name => 'FRETE',
        :remark => 'Frete'
      )
      if !@additional_frete.save()
        puts 'erro ao criar a instancia Valor Frete'
        @errors = @additional_frete.errors
        return false
      end
    end
    @additional_despesa = Goods::Additional::Type.find_by_name('DESPESAS')
    if @additional_despesa.nil?()
      @additional_despesa = Goods::Additional::Type.create(
        :name => 'DESPESAS',
        :remark => ' Despesas'
      )
      if !@additional_despesa.save()
        puts 'erro ao criar a instancia Valor Outras Despesas'
        @errors = @additional_despesa.errors
        return false
      end
    end
    @additional_seguro = Goods::Additional::Type.find_by_name('SEGURO')
    if @additional_seguro.nil?()
      @additional_seguro = Goods::Additional::Type.create(
        :name => 'SEGURO',
        :remark => 'Seguro'
      )
      if !@additional_seguro.save()
        puts 'erro ao criar a instancia Valor Seguro'
        @errors = @additional_seguro.errors
        return false
      end
    end
    @additional_desconto = Goods::Additional::Type.find_by_name('DESCONTO')
    if @additional_desconto.nil?()
      @additional_desconto = Goods::Additional::Type.create(
        :name => 'DESCONTO',
        :remark => 'Desconto'
      )
      if !@additional_desconto.save()
        puts 'erro ao criar a instancia Valor Desconto'
        @errors = @additional_desconto.errors
        return false
      end
    end
    @address_type = Participant::Contact::Type.find_by_name('NFE')
    if @address_type.nil?()
      @address_type = Participant::Contact::Type.create(
        :name => 'NFE'
      )
      if !@address_type.save()
        puts 'erro ao criar a instancia NFe'
        @errors = @address_type.errors
        return false
      end
    end
    #cria ou recupera os grupos de impostos
    @group_imcs = Taxe::Group.find_by_name('ICMS')
    if @group_imcs.nil?()
      @group_imcs = Taxe::Group.create(
		:name => 'ICMS',
		:remark => 'Icms')
      if !@group_imcs.save()
        puts 'erro ao criar a instancia Icms'
        @errors = @group_imcs.errors
        return false
      end
    end
    @group_iss = Taxe::Group.find_by_name('ISS')
    if @group_iss.nil?()
      @group_iss = Taxe::Group.create(
		:name => 'ISS',
		:remark => 'Issqn')
      if !@group_iss.save()
        puts 'erro ao criar a instancia Iss'
        @errors = @group_iss.errors
        return false
      end
    end

    @group_ipi = Taxe::Group.find_by_name('IPI')
    if @group_ipi.nil?()
      @group_ipi = Taxe::Group.create(
		:name => 'IPI',
		:remark => 'Ipi')
      if !@group_ipi.save()
        puts 'erro ao criar a instancia Ipi'
        @errors = @group_ipi.errors
        return false
      end
    end

    @group_cofins = Taxe::Group.find_by_name('COFINS')
    if @group_cofins.nil?()
      @group_cofins = Taxe::Group.create(
		:name => 'COFINS',
		:remark => 'Cofins')
      if !@group_cofins.save()
        puts 'erro ao criar a instancia Cofins'
        @errors = @group_cofins.errors
        return false
      end
    end

    @group_pis = Taxe::Group.find_by_name('PIS')
    if @group_pis.nil?()
      @group_pis = Taxe::Group.create(
		:name => 'PIS',
		:remark => 'Pis')
      if !@group_pis.save()
        puts 'erro ao criar a instancia Pis'
        @errors = @group_pis.errors
        return false
      end
    end
    return true
  end#parse_create_instances

  def parse_tot(xml, record_id)
    additional = Goods::Additional::Value.create(
      :goods_additional_type_id => @additional_desconto.id,
      :value => xml.elements['vDesc'].text()
    )
    if !additional.save()
      puts 'erro ao salvar o total de desconto'
      @errors = additional.errors
      return false
    end
    tot = Transaction::Tot.create(
      :goods_additional_value_id =>additional.id,
      :transaction_record_id => record_id
    )
    if !tot.save()
      puts 'relacionar desconto ao registro'
      @errors = tot.errors
      return false
    end

    additional = Goods::Additional::Value.create(
      :goods_additional_type_id => @additional_despesa.id,
      :value => xml.elements['vOutro'].text()
    )
    if !additional.save()
      puts 'erro ao salvar outras despesas'
      @errors = tot.errors
      return false
    end
    tot = Transaction::Tot.create(
      :goods_additional_value_id =>additional.id,
      :transaction_record_id => record_id
    )
    if !tot.save()
      puts 'erro ao relacionar outras despesas ao registro'
      @errors = tot.errors
      return false
    end

    additional = Goods::Additional::Value.create(
      :goods_additional_type_id => @additional_seguro.id,
      :value => xml.elements['vSeg'].text()
    )
    if !additional.save()
      puts 'erro ao salvar valor do seguro'
      @errors = tot.errors
      return false
    end
    tot = Transaction::Tot.create(
      :goods_additional_value_id =>additional.id,
      :transaction_record_id => record_id
    )
    if !tot.save()
      puts 'erro ao relacionar valor do seguro ao registro'
      @errors = tot.errors
      return false
    end

    additional = Goods::Additional::Value.create(
      :goods_additional_type_id => @additional_frete.id,
      :value => xml.elements['vFrete'].text()
    )
    if !additional.save()
      puts 'erro salvar o valor do frete'
      @errors = tot.errors
      return false
    end
    tot = Transaction::Tot.create(
      :goods_additional_value_id =>additional.id,
      :transaction_record_id => record_id
    )
    if !tot.save()
      puts 'erro ao relacionar o valor do frete ao registro'
      @errors = tot.errors
      return false
    end

    if !taxe_id = parse_taxe(
      'PROPRIO',
      'Total Icms Proprio',
      @group_imcs.id,
      0.00,
      xml.elements['vBC'].text(),
      xml.elements['vICMS'].text()
    )
      puts 'erro ao salvar o total de icms do regitro'
      return false
    end
    tot = Transaction::Taxe.create(
        :taxe_value_id => taxe_id,
        :transaction_record_id => record_id
    )
    if !tot.save()
      puts 'erro ao relacionar o icms ao registro'
      @errors = tot.errors
      return false
    end

    if !taxe_id = parse_taxe(
      'ST',
      'Total Icms Substituicao Tributaria',
      @group_imcs.id,
      0.00,
      xml.elements['vBCST'].text(),
      xml.elements['vST'].text()
    )
      puts 'erro ao salvar o total  de substiuicao do registro'
      return false
    end
    tot = Transaction::Taxe.create(
        :taxe_value_id => taxe_id,
        :transaction_record_id => record_id
    )
    if !tot.save()
      puts 'erro ao relacionar o total de substituicao do registro'
      @errors = tot.errors
      return false
    end

    if !taxe_id = parse_taxe(
        'TOTAL',
        'Total Ipi',
        @group_ipi.id,
        0.00,
        0.00,
        xml.elements['vIPI'].text()
    )
      puts 'erro ao salvar o total de ipi do registro'
      return false
    end
    tot = Transaction::Taxe.create(
        :taxe_value_id => taxe_id,
        :transaction_record_id => record_id
    )
    if !tot.save()
      puts 'erro ao relacioanr o total de ipi ao registro'
      @errors = tot.errors
      return false
    end

    if !taxe_id = parse_taxe(
        'TOTAL_PRODUTOS',
        'Total Cofins Produtos',
        @group_cofins.id,
        0.00,
        0.00,
        xml.elements['vCOFINS'].text()
    )
      puts 'erro ao salvar o valor total de cofins do registro'
      return false
    end
    tot = Transaction::Taxe.create(
        :taxe_value_id => taxe_id,
        :transaction_record_id => record_id
    )
    if !tot.save()
      puts 'erro ao relacionar o total de cofins ao registro'
      @errors = tot.errors
      return false
    end

    if !taxe_id = parse_taxe(
        'TOTAL_PRODUTOS',
        'Total Pis Produtos',
        @group_pis.id,
        0.00,
        0.00,
        xml.elements['vPIS'].text()
    )
      puts 'erro ao salvar o valor total de pis do registro'
      return false
    end
    tot = Transaction::Taxe.create(
        :taxe_value_id => taxe_id,
        :transaction_record_id => record_id
    )
    if !tot.save()
      puts 'erro ao relacionar o valor de pis ao registro'
      @errors = tot.errors
      return false
    end
    return true
  end#parse_tot

  def parse_issuer(xml, record_id)
    if !person_id = parse_person(xml, 'enderEmit')
      return false
    end
    if !issuer = Participant::Issuer.find_by_participant_person_id(person_id)
      issuer = Participant::Issuer.create(
          :participant_person_id => person_id
      )
      if !issuer.save
        puts 'erro ao salvar a pessoa como emitente'
        @errors = issuer.errors
        return false
      end
    end
    participant = Transaction::Participant.create(
        :transaction_record_id => record_id,
        :participant_type_id => issuer.id
    )
    if !participant.save()
      puts 'erro ao salvar o emitente da nfe'
      @errors = participant.errors
      return false
    end
    return true
  end#parse_issuer

  def parse_delivery(xml, record_id)
    if !person_id = parse_person(xml)
    delivery = Participant::Delivery.create(
        :participant_person_id => person_id
    )
      return false
    end
    if !delivery.save
      @errors = delivery.errors
      return false
    end
    participant = Transaction::Participant.create(
        :transaction_record_id => record_id,
        :participant_type_id => delivery.id
    )
    if !participant.save()
      @errors = participant.errors
      return false
    end
    return true
  end#parse_delivery

  def parse_sender(xml, record_id)
    if !person_id = parse_person(xml, 'enderDest')
      return false
    end
    if !sender = Participant::Sender.find_by_participant_person_id(person_id)
      sender = Participant::Sender.create(
          :participant_person_id => person_id
      )
      if !sender.save()
        puts 'erro ao salvar o destinario'
        @errors = sender.errors
        return false
      end
    end
    participant = Transaction::Participant.create(
        :transaction_record_id => record_id,
        :participant_type_id => sender.id
    )
    if !participant.save()
      @errors = participant.errors
      puts 'erro ao relacionar o destinatario a nfe'
      return false
    end
    return true
  end#parse_sender

  def parse_person(xml, tag_address = nil)
    if !xml.elements['CNPJ'].nil?
      code = xml.elements['CNPJ'].text()
    else
      code = xml.elements['CPF'].text()
    end
    if !person = Participant::Person.find_by_code(code)
      person = Participant::Person.create(
          :code => code,
          :first_name => xml.elements['xNome'].text()
      )
      if !person.save()
        puts 'error ao salvar pessoa'
        @errors = person.errors
        return false
      end
    end
    if !tag_address.nil?() and !Participant::Contact::Address.find_by_participant_contact_type_id(@address_type.id)
      address_id = parse_address(xml.elements[tag_address])
      address = Participant::Contact::Address.create(
          :participant_person_id => person.id,
          :address_place_id => address_id,
          :participant_contact_type_id => @address_type.id
      )
      if !address.save()
        puts 'erro ao salvar endereco'
        @errors = address.errors
        return false
      end
    end
    return person.id
  end#parse_person

  def parse_address(xml)
    country = Address::Country.find(
        :first,
        :conditions => {
            :code => xml.elements['cPais'].text().upcase,
            :type => "Address::Country"
        }
    )
    if country.nil?()
      country = Address::Country.create(
          :code => xml.elements['cPais'].text().upcase,
          :name => xml.elements['xPais'].text().upcase
      )
      if !country.save()
        @errors = country.errors
        return false
      end
    end
    state = Address::State.find(
        :first,
        :conditions => {
            :code => xml.elements['cMun'].text()[0, 2],
            :address_place_id => country.id
        }
    )
    if state.nil?()
      state = Address::State.create(
          #dois primeiros digitos do municipio e o codigo do estado
          :code => xml.elements['cMun'].text()[0, 2],
          :name => xml.elements['UF'].text().upcase,
          :acronym => xml.elements['UF'].text().upcase,
          :address_place_id => country.id
      )
      if !state.save()
        @errors = state.errors
        return false
      end
    end

    city = Address::City.find(
        :first,
        :conditions => {
            :code => xml.elements['cMun'].text().upcase,
            :address_place_id => state.id
        }
    )

    if city.nil?()
      city = Address::City.create(
          :code => xml.elements['cMun'].text().upcase,
          :name => xml.elements['xMun'].text().upcase,
          :address_place_id => state.id
      )
      if !city.save()
        @errors = city.errors
        return false
      end
    end

    neighborhood = Address::Neighborhood.find(
        :first,
        :conditions =>{
            :code => xml.elements['CEP'].text().upcase,
            :name => xml.elements['xBairro'].text().upcase,
            :address_place_id => city.id
        }
    )

    if neighborhood.nil?()
      neighborhood = Address::Neighborhood.create(
          :code => xml.elements['CEP'].text().upcase,
          :name => xml.elements['xBairro'].text().upcase,
          :address_place_id => city.id
      )
      if !neighborhood.save()
        @errors = neighborhood.errors
        return false
      end
    end

    street = Address::Street.create(
        :code => xml.elements['nro'].text().upcase,
        :name => xml.elements['xLgr'].text().upcase,
        :address_place_id => neighborhood.id
    )
    if !street.save()
      @errors = street.errors
      return false
    end
    return street.id
  end#parse_address

  def parse_item(xml, record_id)
    additional_unitario_tributado = Goods::Additional::Type.find_by_name('UNITARIO_TRIBUTADO')
    if additional_unitario_tributado.nil?()
      additional_unitario_tributado = Goods::Additional::Type.create(
        :name => 'UNITARIO_TRIBUTADO',
        :remark => 'Valor Unitario Tributado'
      )
      if !additional_unitario_tributado.save()
        puts 'criar tipo de adicional Valor Unitario Tributado'
        @errors = additional_unitario_tributado.errors
        return false
      end
    end
    additional_unitario_comercializado = Goods::Additional::Type.find_by_name('UNITARIO_COMERCIALIZADO')
    if additional_unitario_comercializado.nil?()
      additional_unitario_comercializado = Goods::Additional::Type.create(
        :name => 'UNITARIO_COMERCIALIZADO',
        :remark => 'Valor Unitario Comercializado'
      )
      if !additional_unitario_comercializado.save()
        puts 'cria tipo adicional do item Valor Unitario Tributado'
        @errors = additional_unitario_comercializado.errors
        return false
      end
    end
    additional_quantidade_tributada = Goods::Additional::Type.find_by_name('QUANTIDADE_TRIBUTADA')
    if additional_quantidade_tributada.nil?()
      additional_quantidade_tributada = Goods::Additional::Type.create(
        :name => 'QUANTIDADE_TRIBUTADA',
        :remark => 'Quantidade Tributada'
      )
      if !additional_quantidade_tributada.save()
        puts 'cria tipo adicional do item Valor Unitario Tributado'
        @errors = additional_quantidade_tributada.errors
        return false
      end
    end
    #percorre os elementos det que os produtos e servicos
    xml.elements.each(@rootTagName+'infNFe/det') do |det|
      if !goods = Goods::Item.find_by_code(det.elements['prod'].elements['cProd'].text())
        #cria o produtos/servico
        goods = Goods::Item.create(
            #codigo da mercadoria
            :code => det.elements['prod'].elements['cProd'].text(),
            #nome da mercadoria
            :name => det.elements['prod'].elements['xProd'].text()
        )
        if !goods.save()
          puts 'cadastrar um novo produto'
          @errors = goods.errors
          return false
        end
      end
      #insere o item no registro
      item = Transaction::Goods::Item.create(
          #id do item
          :goods_item_id => goods.id,
          #id da transacao
          :transaction_record_id => record_id,
          #nome do item
          :name => det.elements['prod'].elements['xProd'].text(),
          #unidade de medida
          :measure => det.elements['prod'].elements['uCom'].text(),
          #quantidade
          :quantity => det.elements['prod'].elements['qCom'].text(),
          #valor unitario
          :unit_price => det.elements['prod'].elements['vProd'].text().to_f/det.elements['prod'].elements['qCom'].text().to_f,
          #valor total
          :full_price => det.elements['prod'].elements['vProd'].text()
      )
      if !item.save()
        puts ' relacionar o item ao registro '
        @errors = item.errors
        return false
      end
      additional = Goods::Additional::Value.create(
        :goods_additional_type_id => additional_quantidade_tributada.id,
        :value => det.elements['prod'].elements['qTrib'].text()
      )
      if !additional.save()
        puts 'criar quantidade tributada '
        @errors = additional.errors
        return false
      end
      additional = Transaction::Goods::Additional.create(
        :goods_additional_value_id =>additional.id,
        :transaction_goods_item_id => item.id
      )
      if !additional.save()
        puts 'relacionar quantidade tributada ao item '
        @errors = additional.errors
        return false
      end
      additional = Goods::Additional::Value.create(
        :goods_additional_type_id => additional_unitario_tributado.id,
        :value => det.elements['prod'].elements['vUnTrib'].text()
      )
      if !additional.save()
        puts 'salvar valor unidade tributada '
        @errors = additional.errors
        return false
      end
      additional = Transaction::Goods::Additional.create(
        :goods_additional_value_id =>additional.id,
        :transaction_goods_item_id => item.id
      )
      if !additional.save()
        puts 'relacionar valor unidade tributada ao item '
        @errors = additional.errors
        return false
      end
      additional = Goods::Additional::Value.create(
        :goods_additional_type_id => additional_unitario_comercializado.id,
        :value => det.elements['prod'].elements['vUnCom'].text()
      )
      if !additional.save()
        puts 'salvar valor unidade comercializada '
        @errors = additional.errors
        return false
      end
      additional = Transaction::Goods::Additional.create(
        :goods_additional_value_id =>additional.id,
        :transaction_goods_item_id => item.id
      )
      if !additional.save()
        puts 'relacionar valor unidade comercializada ao item '
        @errors = additional.errors
        return false
      end
      if !det.elements['prod'].elements['vDesc'].nil?()
        additional = Goods::Additional::Value.create(
          :goods_additional_type_id => @additional_desconto.id,
          :value => det.elements['prod'].elements['vDesc'].text()
        )
        if !additional.save()
          puts 'salvar valor desconto '
          @errors = additional.errors
          return false
        end
        additional = Transaction::Goods::Additional.create(
          :goods_additional_value_id =>additional.id,
          :transaction_goods_item_id => item.id
        )
        if !additional.save()
          puts 'relacionar valor do desconto ao item '
          @errors = additional.errors
          return false
        end
      end
      if !det.elements['prod'].elements['vOutro'].nil?()
        additional = Goods::Additional::Value.create(
          :goods_additional_type_id => @additional_despesa.id,
          :value => det.elements['prod'].elements['vOutro'].text()
        )
        if !additional.save()
          puts 'salvar valor das outras despesas '
          @errors = additional.errors
          return false
        end
        additional = Transaction::Goods::Additional.create(
          :goods_additional_value_id =>additional.id,
          :transaction_goods_item_id => item.id
        )
        if !additional.save()
          puts 'relacionar valor das outras despesas do item '
          @errors = additional.errors
          return false
        end
      end
      if !det.elements['prod'].elements['vSeg'].nil?()
        additional = Goods::Additional::Value.create(
          :goods_additional_type_id => @additional_seguro.id,
          :value => det.elements['prod'].elements['vSeg'].text()
        )
        if !additional.save()
          puts 'salvar valor do seguro '
          @errors = additional.errors
          return false
        end
        additional = Transaction::Goods::Additional.create(
          :goods_additional_value_id =>additional.id,
          :transaction_goods_item_id => item.id
        )
        if !additional.save()
          puts ' relacionar valor do seguro ao item '
          @errors = additional.errors
          return false
        end
      end
      if !det.elements['prod'].elements['vFrete'].nil?()
        additional = Goods::Additional::Value.create(
          :goods_additional_type_id => @additional_frete.id,
          :value => det.elements['prod'].elements['vFrete'].text()
        )
        if !additional.save()
          puts 'salvar valor do frete '
          @errors = additional.errors
          return false
        end
        additional = Transaction::Goods::Additional.create(
          :goods_additional_value_id =>additional.id,
          :transaction_goods_item_id => item.id
        )
        if !additional.save()
          @errors = additional.errors
          return false
        end
      end
      #
      #verificar se existe a tag de iss,
      #se ela exisitir chamar somente ela
      #se nao existir chamar icms e ipi
      #
      if !parse_item_icms(
          det.elements['imposto'].elements['ICMS'],
          @group_imcs.id,
          item.id
      )
        puts 'icms do item'
        return false
      end
      if !det.elements['imposto'].elements['IPI'].nil?
        if !parse_item_ipi(
          det.elements['imposto'].elements['IPI'],
          @group_ipi.id,
          item.id)
          puts 'ipi do item'
          return false
        end
      end
      if !parse_item_cofins(
          det.elements['imposto'].elements['COFINS'],
          @group_cofins.id,
          item.id)
        puts 'cofins do item'
        return false
      end
      #if !parse_item_iss(
          #det.elements['imposto'].elements['PIS'],
          #@group_iss.id,
          #item.id)
        #return false
      #end
    end #fim dos itens
    return true
  end#fim parse_item

  def parse_create_taxe(taxe_value_id, transaction_goods_item_id)
    taxe = Transaction::Goods::Taxe.create(
        :taxe_value_id =>  taxe_value_id,
        :transaction_goods_item_id => transaction_goods_item_id
    )
    if !taxe.save()
      @errors = taxe.errors
      return false
    end
    return true
  end#parse_create_taxe

  def parse_taxe(code, name, taxe_group_id, percentage, basis, value, reduction = 0.00)
    if !type_id = parse_taxe_type(code, name, taxe_group_id)
      puts 'nao foi possivel recuperar o tipo de imposto'
      return false
    end
    return parse_taxe_value(type_id, percentage, basis, value, reduction)
  end#parse_taxe

  def parse_item_icms(xml, taxe_group_id,transaction_goods_item_id)
    taxe = Transaction::TaxeEnum.new
    taxe.percentage = 0.00
    taxe.basis = 0.00
    taxe.value = 0.00
    taxe.reduction = 0.00
    name = 'indefinido'
    if !xml.elements['ICMS00'].nil?()
      tag = xml.elements['ICMS00']
      code = tag.elements['CST'].text()
      name = 'Tributada integralmente'
      taxe = parse_icms_proprio_object(tag)
    elsif !xml.elements['ICMS10'].nil?()
      tag = xml.elements['ICMS10']
      code = tag.elements['CST'].text()
      name = 'Tributada e com cobranca do ICMS por substituicao tributaria'
      taxe = parse_icms_st_object(tag)
      if !taxe_value_id = parse_taxe(
          code,
          name,
          taxe_group_id,
          taxe.percentage,
          taxe.basis,
          taxe.value,
          taxe.reduction)
        return false
      end
      if !parse_create_taxe(taxe_value_id, transaction_goods_item_id)
        return false
      end
      taxe = parse_icms_proprio_object(tag)
    elsif !xml.elements['ICMS20'].nil?()
      tag = xml.elements['ICMS20']
      code = tag.elements['CST'].text()
      name = 'Com reducao de base de calculo'
      taxe = parse_icms_proprio_object(tag)
    elsif !xml.elements['ICMS30'].nil?()
      tag = xml.elements['ICMS30']
      code = tag.elements['CST'].text()
      name = 'Isenta ou nao tributada e com cobranca do ICMS por substituicao tributaria'
      taxe = parse_icms_st_object(tag)
    elsif !xml.elements['ICMS40'].nil?()
      tag = xml.elements['ICMS40']
      code = tag.elements['CST'].text()
      case code
      when 40
        name = 'Isenta'
      when 41
        name = 'Nao tributada'
      when 50
        name = 'Suspensao'
      end
      if tag.elements['vICMS '].nil?
        taxe.value = tag.elements['vICMS'].text()
      end
    elsif !xml.elements['ICMS51'].nil?()
      tag = xml.elements['ICMS51']
      code = tag.elements['CST'].text()
      name = 'Diferimento'
      taxe = parse_icms_proprio_object(tag)
    elsif !xml.elements['ICMS60'].nil?()
      tag = xml.elements['ICMS60']
      code = tag.elements['CST'].text()
      name = 'ICMS cobrado anteriormente por substituicao tributaria'
      taxe = parse_icms_retido_object(tag)
    elsif !xml.elements['ICMS70'].nil?()
      tag = xml.elements['ICMS70']
      code = tag.elements['CST'].text()
      name = 'Isenta ou nao tributada e com cobranca do ICMS por substituicao tributaria'
      taxe = parse_icms_st_object(tag)
      if !taxe_value_id = parse_taxe(
          code,
          name,
          taxe_group_id,
          taxe.percentage,
          taxe.basis,
          taxe.value,
          taxe.reduction)
        return false
      end
      if !parse_create_taxe(taxe_value_id, transaction_goods_item_id)
        return false
      end
      taxe = parse_icms_proprio_object(tag)
    elsif !xml.elements['ICMS90'].nil?()
      tag = xml.elements['ICMS90']
      code = tag.elements['CST'].text()
      name = 'Outros'
      taxe = parse_icms_st_object(tag)
      if !taxe_value_id = parse_taxe(
          code,
          name,
          taxe_group_id,
          taxe.percentage,
          taxe.basis,
          taxe.value,
          taxe.reduction)
        return false
      end
      if !parse_create_taxe(taxe_value_id, transaction_goods_item_id)
        return false
      end
      taxe = parse_icms_proprio_object(tag)
    elsif !xml.elements['ICMSSN102'].nil?()
      tag = xml.elements['ICMSSN102']
      code = tag.elements['CSOSN'].text()
      case code
      when '102'
        name = 'Tributada pelo Simples Nacional sem permissao de credito'
      when '103'
        name = 'Isencao do ICMS no Simples Nacional para faixa de receita bruta.'
      when '300'
        name = 'Imune'
      when '400'
        name = 'Nao tributada pelo Simples Nacional'
      else
        puts 'nao foi possivel determinar o nome para p codigo ' + code
      end
    elsif !xml.elements['ICMSSN201'].nil?()
      tag = xml.elements['ICMSSN202']
      code = tag.elements['CSOSN'].text()
      name = 'Tributada pelo Simples Nacional com permissao de credito e com cobranca do ICMS por Substituicao Tributaria'
      taxe = parse_icms_st_object(tag)
      if !taxe_value_id = parse_taxe(
          code,
          name,
          taxe_group_id,
          taxe.percentage,
          taxe.basis,
          taxe.value,
          taxe.reduction)
        return false
      end
      if !parse_create_taxe(taxe_value_id, transaction_goods_item_id)
        return false
      end
      taxe = parse_icms_credito_object(tag)
    elsif !xml.elements['ICMSSN202'].nil?()
      tag = xml.elements['ICMSSN202']
      code = tag.elements['CSOSN'].text()
      case code
      when 202
        name = 'Tributada pelo Simples Nacional sem permissao de credito e com cobranca do ICMS por Substituicao Tributaria'
      when 203
        name = 'Isencao do ICMS nos Simples Nacional para faixa de  receita bruta e com cobranca do  ICMS por Substituicao Tributaria'
        else
          puts 'nao foi possivel determinar o nome para p codigo ' + code
      end
      taxe = parse_icms_st_object(tag)
    elsif !xml.elements['ICMSSN500'].nil?()
      tag = xml.elements['ICMSSN500']
      code = tag.elements['CSOSN'].text()
      name = 'ICMS cobrado anteriormente por substituicao tributaria (substituido) ou por antecipacao'
      taxe = parse_icms_retido_object(tag)
    elsif !xml.elements['ICMSSN900'].nil?()
      tag = xml.elements['ICMSSN900']
      code = tag.elements['CSOSN'].text()
      name = 'Outros'
      taxe = parse_icms_st_object(tag)
      if !taxe_value_id = parse_taxe(
          code,
          name,
          taxe_group_id,
          taxe.percentage,
          taxe.basis,
          taxe.value,
          taxe.reduction)
        puts 'icms 900 st'
        return false
      end
      if !parse_create_taxe(taxe_value_id, transaction_goods_item_id)
        puts 'relacionar 900 st ao item'
        return false
      end
      taxe = parse_icms_proprio_object(tag)
      if !taxe_value_id = parse_taxe(
          code,
          name,
          taxe_group_id,
          taxe.percentage,
          taxe.basis,
          taxe.value,
          taxe.reduction)
        puts '900 icms proprio'
        return false
      end
      if !parse_create_taxe(taxe_value_id, transaction_goods_item_id)
        puts 'relacionar 900 ao iten'
        return false
      end
      taxe = parse_icms_credito_object(tag)
    else
      puts 'nao foi possivel determinar o tipo de tributacao do item'
      return false
    end

    if !taxe_value_id = parse_taxe(
        code,
        name,
        taxe_group_id,
        taxe.percentage,
        taxe.basis,
        taxe.value,
        taxe.reduction)
        puts 'criar o imposto selecionado'
      return false
    end
    if !parse_create_taxe(taxe_value_id, transaction_goods_item_id)
      puts 'relacionar o impostos ao item'
      return false
    end
    return true
  end#parse_item_icms

  def parse_item_ipi(xml, taxe_group_id,transaction_goods_item_id)
    taxe = Transaction::TaxeEnum.new
    taxe.percentage = 0.00
    taxe.basis = 0.00
    taxe.value = 0.00
    taxe.reduction = 0.00
    if !xml.elements['IPITrib'].nil?()
      tag = xml.elements['IPITrib']
      code = tag.elements['CST'].text()
      case code
      when '00'
        name = '00-Entrada com recuperacao de credito'
      when '49'
        name = '49-Outras entradas'
      when '50'
        name = '50-Saida tributada'
      when '99'
        name = '99-Outras saidas'
      end
      #taxe = parse_icms_proprio_object(tag)
    elsif !xml.elements['IPINT'].nil?()
      tag = xml.elements['IPINT']
      code = tag.elements['CST'].text()
      if !tag.elements['pIPI'].nil?()
        taxe.percentage = tag.elements['pIPI'].text()
        taxe.basis =  tag.elements['vBC'].text()
      end
      case code
      when '01'
        name = '01-Entrada tributada com  aliquota zero'
      when '02'
        name = '02-Entrada isenta'
      when '03'
        name = '03-Entrada nao-tributada'
      when '04'
      name = '04-Entrada imune'
      when '05'
        name = '05-Entrada com suspensao'
      when '51'
        name = '51-Saida tributada com aliquota zero'
      when '52'
        name = '52-Saida isenta'
      when '53'
        name = '53-Saida nao-tributada'
      when '54'
        name = '54-Saida imune'
      when '55'
        name = '55-Saida com suspensao'
      end
    end
    if !taxe_value_id = parse_taxe(
        code,
        name,
        taxe_group_id,
        taxe.percentage,
        taxe.basis,
        taxe.value,
        taxe.reduction)
      return false
    end
    if !parse_create_taxe(taxe_value_id, transaction_goods_item_id)
      return false
    end
    return true
  end#parse_item_ipi


  def parse_item_pis(xml, taxe_group_id, transaction_goods_item_id)
    taxe = Transaction::TaxeEnum.new
    taxe.percentage = 0.00
    taxe.basis = 0.00
    taxe.value = 0.00
    taxe.reduction = 0.00
    if !xml.elements['PISAliq'].nil?()
      tag = xml.elements['PISAliq']
      code = tag.elements['CST'].text()
      case code
      when '01'
        name = '01 – Operacao Tributavel (base de calculo = valor da operacao aliquota normal (cumulativo/nao cumulativo))'
      when '02'
        name = '02 - Operacao Tributavel (base de calculo = valor da operacao (aliquota diferenciada))'
      end
      taxe.percentage = tag.elements['pPIS'].text()
      taxe.value = tag.elements['pPIS'].text()
      taxe.basis =  tag.elements['vBC'].text()
    elsif !xml.elements['PISQtde'].nil?()
      tag = xml.elements['PISQtde']
      code = tag.elements['CST'].text()
      name = '03 - Operacao Tributavel (base de calculo = quantidade vendida x aliquota por unidade de produto)'
      taxe.percentage = tag.elements['vAliqProd'].text()
      taxe.value = tag.elements['vPIS'].text()
      taxe.basis =  tag.elements['qBCProd'].text()
    elsif !xml.elements['PISNT'].nil?()
      tag = xml.elements['PISNT']
      code = tag.elements['CST'].text()
      case code
      when '01'
        name = '01 – Operacao Tributavel (base de calculo = valor da operacao aliquota normal (cumulativo/nao cumulativo))'
      when '06'
        name = '06 - Operacao Tributavel (aliquota zero)'
      when '07'
        name = '07 - Operacao Isenta da Contribuicao'
      when '08'
       name = '08 - Operacao Sem Incidência da Contribuicao'
      when '09'
        name = '09 - Operacao com Suspensao da Contribuicao'
      end
    elsif !xml.elements['PISOutr'].nil?()
         tag = xml.elements['PISOutr']
         code = tag.elements['CST'].text()
         name = '99 - Outras Operacoes'
         if !xml.elements['pPIS'].nil?()
           taxe.percentage = tag.elements['pPIS'].text()
           taxe.value = tag.elements['vPIS'].text()
         else
           taxe.percentage = tag.elements['vAliqProd'].text()
           taxe.value = tag.elements['vAliqProd'].text()
           taxe.basis =  tag.elements['qBCProd'].text()
         end
        taxe.basis =  tag.elements['vBC'].text()
    end
    if !taxe_value_id = parse_taxe(
        code,
        name,
        taxe_group_id,
        taxe.percentage,
        taxe.basis,
        taxe.value,
        taxe.reduction)
      return false
    end
    if !parse_create_taxe(taxe_value_id, transaction_goods_item_id)
      return false
    end
    return true
  end#parse_item_pis

  def parse_item_cofins(xml, taxe_group_id, transaction_goods_item_id)
    taxe = Transaction::TaxeEnum.new
    taxe.percentage = 0.00
    taxe.basis = 0.00
    taxe.value = 0.00
    taxe.reduction = 0.00
    if !xml.elements['COFINSAliq'].nil?()
      tag = xml.elements['COFINSAliq']
      code = tag.elements['CST'].text()
      case code
      when '01'
        name = '01 – Operacao Tributavel (base de calculo = valor da operacao aliquota normal (cumulativo/nao cumulativo))'
      when '02'
        name = '02 - Operacao Tributavel (base de calculo = valor da operacao (aliquota diferenciada))'
      end
      taxe.percentage = tag.elements['pCOFINS'].text()
      taxe.value = tag.elements['pCOFINS'].text()
      taxe.basis =  tag.elements['vBC'].text()
    elsif !xml.elements['COFINSQtde'].nil?()
      tag = xml.elements['COFINSQtde']
      code = tag.elements['CST'].text()
      name = '03 - Operacao Tributavel (base de calculo = quantidade vendida x aliquota por unidade de produto)'
      taxe.percentage = tag.elements['vAliqProd'].text()
      taxe.value = tag.elements['vCOFINS'].text()
      taxe.basis =  tag.elements['qBCProd'].text()
    elsif !xml.elements['COFINSNT'].nil?()
      tag = xml.elements['COFINSNT']
      code = tag.elements['CST'].text()
      case code
      when '01'
        name = '01 - Operacao Tributavel (base de calculo = valor da operacao aliquota normal (cumulativo/nao cumulativo))'
      when '06'
        name = '06 - Operacao Tributavel (aliquota zero)'
      when '07'
        name = '07 - Operacao Isenta da Contribuicao'
      when '08'
        name = '08 - Operacao Sem Incidência da Contribuicao'
      when '09'
        name = '09 - Operacao com Suspensao da Contribuicao'
      end
    elsif !xml.elements['COFINSOutr'].nil?()
         tag = xml.elements['COFINSOutr']
         code = tag.elements['CST'].text()
         name = '99 - Outras Operacoes'
         if !xml.elements['pCOFINS'].nil?()
           taxe.percentage = tag.elements['pCOFINS'].text()
           taxe.value = tag.elements['vCOFINS'].text()
         elsif !tag.elements['vAliqProd'].nil?()
           taxe.percentage = tag.elements['vAliqProd'].text()
           taxe.value =  tag.elements['qBCProd'].text()
         end
         if !tag.elements['vAliqProd'].nil?()
           taxe.basis =  tag.elements['vBC'].text()
         end
    end
    if !taxe_value_id = parse_taxe(
        code,
        name,
        taxe_group_id,
        taxe.percentage,
        taxe.basis,
        taxe.value,
        taxe.reduction)
      return false
    end
    if !parse_create_taxe(taxe_value_id, transaction_goods_item_id)
      return false
    end
    return true
  end#parse_item_cofins

  #def parse_item_cofins(xml, taxe_group_id)
    #parse_taxe(code, name, taxe_group_id, percentage, basis, value)
    #return true
  #end#parse_item_cofins

  def parse_taxe_type(code, name, taxe_group_id)
    if !type = Taxe::Type.find_by_code(code)
      type = Taxe::Type.create(
          :name => name,
          :code => code,
          :taxe_group_id => taxe_group_id
      )
      if !type.save()
        @errors = type.errors
        puts 'nao foi possivel salvar um novo tipo de imposto'
        return false
      end
    end
    return type.id
  end#parse_taxe_type

  def parse_taxe_value(taxe_type_id, percentage, basis, value, reduction = 0.00)
    if percentage.nil?
      percentage = 0.00
    end
    taxe = Taxe::Value.create(
        :taxe_type_id => taxe_type_id,
        :percentage => percentage,
        :basis => basis,
        :value => value,
        :reduction => reduction
    )
    if !taxe.save()
      @errors = taxe.errors
      puts 'nao foi possivel salvar o imposto'
      return false
    end
    return taxe.id
  end#parse_taxe_value

  def parse_financier(xml, record)
    xml.elements.each(@rootTagName+'infNFe/cobr/dup') do |dup|
      note = Financier::Note.create(
          #valor
          :original_value => dup.elements['vDup'].text(),
          #name
          :name => record.code.to_s,
          #data de vencimento
          :expiration_date => dup.elements['dVenc'].text(),
          #data de emissao
          :creation_date => record.creation_date,
          #numero da parcela
          :number => dup.elements['nDup'].text()
      )
      note.save
      financier = Transaction::Financier.create(
          #id do registro
          :transaction_record_id => record.id,
          #id da parcela
          :financier_note_id => note.id
      )
      if !financier.save()
        @errors = financier.errors
        return false
      end
    end #final da iteracao das parcelas
    return true
  end #parse_financier

  def parse_icms_proprio_object(tag)
    taxe = Transaction::TaxeEnum.new
    taxe.basis = tag.elements['vBC'].text()
    taxe.value = tag.elements['vICMS'].text()
    taxe.percentage = tag.elements['pICMS'].text()
    taxe.reduction = 0.00
    if !tag.elements['pRedBC'].nil?
      taxe.reduction = tag.elements['pRedBCST'].text()
    end
    return taxe
  end#parse_icms_proprio_object

  def parse_icms_retido_object(tag)
    taxe = Transaction::TaxeEnum.new
    taxe.basis = tag.elements['vBCSTRet'].text()
    taxe.value = tag.elements['vICMSSTRet'].text()
    taxe.percentage = 0.00
    taxe.reduction = 0.00
    return taxe
  end#parse_icms_retido_object

  def parse_icms_st_object(tag)
    taxe = Transaction::TaxeEnum.new
    taxe.basis = tag.elements['vBCST'].text()
    taxe.value = tag.elements['vICMSST'].text()
    taxe.percentage = tag.elements['pICMSST'].text()
    if !tag.elements['pRedBCST'].nil?
      taxe.reduction = tag.elements['pRedBCST'].text()
    end
    return taxe
  end#parse_icms_st_object

  def parse_icms_credito_object(tag)
    taxe = Transaction::TaxeEnum.new
    taxe.basis = 0.00
    taxe.value = tag.elements['vCredICMSSN'].text()
    taxe.percentage = tag.elements['pCredSN'].text()
    taxe.reduction = 0.00
    return taxe
  end#parse_icms_credito_object

  def message=(message)
    @message = message
  end

  def message
    @message
  end
end

class Transaction::TaxeEnum
  public
  def value
    @value
  end
  def basis
    @basis
  end
  def percentage
    @percentage
  end
  def reduction
    @reduction
  end
  def value=(value)
    @value = value
  end
  def basis=(basis)
    @basis = basis
  end
  def percentage=(percentage)
    @percentage
  end
  def reduction=(reduction)
    @reduction = reduction
  end
end

