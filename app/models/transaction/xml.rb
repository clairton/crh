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
  belongs_to :Record, :class_name => 'Transaction::Record::Record'
  validates_presence_of :content, :message => 'Deve Informar Um arquivo Xml'
  has_attached_file :xml

  public
  def parse()
    Transaction::Xml.transaction do
      #@content = File.open('NFe.xml')
      xml = REXML::Document.new '<?xml version="1.0" encoding="UTF-8"?><nfeProc versao="2.00" xmlns="http://www.portalfiscal.inf.br/nfe"><NFe xmlns="http://www.portalfiscal.inf.br/nfe"><infNFe Id="NFe42110609363232000189550020000020121000012180" versao="2.00"><ide><cUF>42</cUF><cNF>00001218</cNF><natOp>VENDA MERCADORIA NO ESTADO</natOp><indPag>1</indPag><mod>55</mod><serie>2</serie><nNF>2012</nNF><dEmi>2011-06-29</dEmi><dSaiEnt>2011-06-29</dSaiEnt><hSaiEnt>08:26:16</hSaiEnt><tpNF>1</tpNF><cMunFG>4212908</cMunFG><tpImp>1</tpImp><tpEmis>1</tpEmis><cDV>0</cDV><tpAmb>2</tpAmb><finNFe>1</finNFe><procEmi>0</procEmi><verProc>2.00</verProc></ide><emit><CNPJ>09363232000189</CNPJ><xNome>WILSON C. SA PLUS</xNome><enderEmit><xLgr>AV SAO PAULO</xLgr><nro>1577</nro><xCpl>SALA 6</xCpl><xBairro>NOVA DIVINEIA</xBairro><cMun>4212908</cMun><xMun>PINHALZINHO</xMun><UF>SC</UF><CEP>89870000</CEP><cPais>1058</cPais><xPais>BRASIL</xPais><fone>4933661011</fone></enderEmit><IE>255566743</IE><CRT>1</CRT></emit><dest><CNPJ>99999999000191</CNPJ><xNome>NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL</xNome><enderDest><xLgr>RUA 19 DE JULHO 378</xLgr><nro>sn</nro><xBairro>CENTRO</xBairro><cMun>4205175</cMun><xMun>ENTRE RIOS</xMun><UF>SC</UF><CEP>89862000</CEP><cPais>1058</cPais><xPais>BRASIL</xPais></enderDest><IE/></dest><det nItem="1"><prod><cProd>30003</cProd><cEAN/><xProd>CARTEIRA</xProd><NCM>99</NCM><CFOP>5102</CFOP><uCom>UN</uCom><qCom>10.0000</qCom><vUnCom>7.3500</vUnCom><vProd>73.50</vProd><cEANTrib/><uTrib>UN</uTrib><qTrib>10.0000</qTrib><vUnTrib>7.3500</vUnTrib><indTot>1</indTot></prod><imposto><ICMS><ICMSSN102><orig>0</orig><CSOSN>102</CSOSN></ICMSSN102></ICMS><IPI><cEnq>999</cEnq><IPITrib><CST>99</CST><vBC>0.00</vBC><pIPI>0.00</pIPI><vIPI>0.00</vIPI></IPITrib></IPI><PIS><PISOutr><CST>99</CST><vBC>0.00</vBC><pPIS>0.00</pPIS><vPIS>0.00</vPIS></PISOutr></PIS><COFINS><COFINSOutr><CST>99</CST><vBC>0.00</vBC><pCOFINS>0.00</pCOFINS><vCOFINS>0.00</vCOFINS></COFINSOutr></COFINS></imposto></det><det nItem="2"><prod><cProd>30004</cProd><cEAN/><xProd>ALARME AUT</xProd><NCM>99</NCM><CFOP>5102</CFOP><uCom>UN</uCom><qCom>1.0000</qCom><vUnCom>145.4400</vUnCom><vProd>145.44</vProd><cEANTrib/><uTrib>UN</uTrib><qTrib>1.0000</qTrib><vUnTrib>145.4400</vUnTrib><indTot>1</indTot></prod><imposto><ICMS><ICMSSN102><orig>0</orig><CSOSN>102</CSOSN></ICMSSN102></ICMS><IPI><cEnq>999</cEnq><IPITrib><CST>99</CST><vBC>2.91</vBC><pIPI>2.00</pIPI><vIPI>2.91</vIPI></IPITrib></IPI><PIS><PISOutr><CST>99</CST><vBC>0.00</vBC><pPIS>0.00</pPIS><vPIS>0.00</vPIS></PISOutr></PIS><COFINS><COFINSOutr><CST>99</CST><vBC>0.00</vBC><pCOFINS>0.00</pCOFINS><vCOFINS>0.00</vCOFINS></COFINSOutr></COFINS></imposto></det><total><ICMSTot><vBC>0.00</vBC><vICMS>0.00</vICMS><vBCST>0.00</vBCST><vST>0.00</vST><vProd>218.94</vProd><vFrete>0.00</vFrete><vSeg>0.00</vSeg><vDesc>0.00</vDesc><vII>0.00</vII><vIPI>2.91</vIPI><vPIS>0</vPIS><vCOFINS>0</vCOFINS><vOutro>0.00</vOutro><vNF>221.85</vNF></ICMSTot></total><transp><modFrete>0</modFrete></transp><cobr><dup><nDup>1</nDup><dVenc>2011-07-29</dVenc><vDup>110.93</vDup></dup><dup><nDup>2</nDup><dVenc>2011-08-28</dVenc><vDup>110.93</vDup></dup></cobr><infAdic><infCpl>CONFIRA A MERCADORIA NO ATO DA ENTREGA#ICMS DIFERIDO CFE ART#.8 INCISO III ANEXO 03#Documento emitido por me ou epp optante pelo simples nacional nao gera direito a credito fiscal de IPI.#</infCpl></infAdic></infNFe><Signature xmlns="http://www.w3.org/2000/09/xmldsig#"><SignedInfo><CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/><SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/><Reference URI="#NFe42110609363232000189550020000020121000012180"><Transforms><Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/><Transform Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/></Transforms><DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/><DigestValue>h4iJX3gfbx15fA4RzDTEoZ/0VDY=</DigestValue></Reference></SignedInfo><SignatureValue>AxPXfKKlk9ddSKAtDs5E+uRivpbzsT6K8DHAQlu18cnrPYCu4b9syJ3eciLrnN2TVHWZDZ3v4q0L
                                Yaa0Tgn38SS0RjJRQmfX2Hsz5isBGzZC5ig4/bMzq2OdcHHH4m56TWFBQYqgT4W0uAm6q03uMIMK
                                pmCPT/GZgjLSc4DSqhM=</SignatureValue><KeyInfo><X509Data><X509Certificate>MIIGAjCCBOqgAwIBAgIQMjAxMTAxMDUxMzQzNTcxOTANBgkqhkiG9w0BAQUFADCBijELMAkGA1UE
                                BhMCQlIxEzARBgNVBAoTCklDUC1CcmFzaWwxNjA0BgNVBAsTLVNlY3JldGFyaWEgZGEgUmVjZWl0
                                YSBGZWRlcmFsIGRvIEJyYXNpbCAtIFJGQjEuMCwGA1UEAxMlQXV0b3JpZGFkZSBDZXJ0aWZpY2Fk
                                b3JhIGRvIFNFUlBST1JGQjAeFw0xMTAxMDUxNzA2MzlaFw0xMjAxMDUxNzA0MTdaMIHtMQswCQYD
                                VQQGEwJCUjETMBEGA1UEChMKSUNQLUJyYXNpbDE2MDQGA1UECxMtU2VjcmV0YXJpYSBkYSBSZWNl
                                aXRhIEZlZGVyYWwgZG8gQnJhc2lsIC0gUkZCMREwDwYDVQQLEwhDT1JSRUlPUzETMBEGA1UECxMK
                                QVJDT1JSRUlPUzEWMBQGA1UECxMNUkZCIGUtQ05QSiBBMTEUMBIGA1UEBxMLUElOSEFMWklOSE8x
                                CzAJBgNVBAgTAlNDMS4wLAYDVQQDEyVXSUxTT04gQ0VTQVIgU0FWRUdOQUdPOjA5MzYzMjMyMDAw
                                MTg5MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCMozDSTiITBoOTUEz4DXL2mazA9smBXaoL
                                rzGJ8/Taq5S/DGL1Sp6jdAcUZktlksWgBaIIKx327kF5tPrXCsYZArzUY7vvnidkQ/d+gEO6fGD2
                                b5lnOu4bH6QnFXUZP7CVuZKnqJSd7yvCv4F8FXeCqB0NIIi1mFhL2RXQGYRQIwIDAQABo4ICgTCC
                                An0wDwYDVR0TAQH/BAUwAwEBADAfBgNVHSMEGDAWgBS5IouGJEbnoq3nKTuMaDtNrXSRFDAOBgNV
                                HQ8BAf8EBAMCBeAwYAYDVR0gBFkwVzBVBgZgTAECAQowSzBJBggrBgEFBQcCARY9aHR0cHM6Ly9j
                                Y2Quc2VycHJvLmdvdi5ici9hY3NlcnByb3JmYi9kb2NzL2RwY2Fjc2VycHJvcmZiLnBkZjCBuwYD
                                VR0RBIGzMIGwoD0GBWBMAQMEoDQEMjAyMDgxOTc5MDIyMDI2NTk5MjcwMDAwMDAwMDAwMDAwMDAw
                                MjIwMjY1OTkyN1NTUFNDoCEGBWBMAQMCoBgEFldJTFNPTiBDRVNBUiBTQVZFR05BR0+gGQYFYEwB
                                AwOgEAQOMDkzNjMyMzIwMDAxODmgFwYFYEwBAwegDgQMMDAwMDAwMDAwMDAwgRh6ZXR0YUB6ZXR0
                                YWJyYXNpbC5jb20uYnIwIAYDVR0lAQH/BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMIGoBgNVHR8E
                                gaAwgZ0wMqAwoC6GLGh0dHA6Ly9jY2Quc2VycHJvLmdvdi5ici9sY3IvYWNzZXJwcm9yZmIuY3Js
                                MDOgMaAvhi1odHRwOi8vY2NkMi5zZXJwcm8uZ292LmJyL2xjci9hY3NlcnByb3JmYi5jcmwwMqAw
                                oC6GLGh0dHA6Ly93d3cuaXRpLmdvdi5ici9zZXJwcm8vYWNzZXJwcm9yZmIuY3JsMEwGCCsGAQUF
                                BwEBBEAwPjA8BggrBgEFBQcwAoYwaHR0cDovL2NjZC5zZXJwcm8uZ292LmJyL2NhZGVpYXMvYWNz
                                ZXJwcm9yZmIucDdiMA0GCSqGSIb3DQEBBQUAA4IBAQAIxy5s2I2JP70ggrEa3SARQKn5BgFuMsfR
                                6ZH1gT0hnW8sYCj//Fb/JsITIODr/OegB0H/l2xOOV19Vkwzfj9hQO8detogayi8fB5Z1/QubkpF
                                1XUHjTk9awVowr+TluTs0FvjJB9HI8kFxUlV50yoVpfQ/lGAljudNZcBTu2k7kD04rAPDos7TA0b
                                G1/9CXNjgOmeHeTFZ37HN8RxXg2YSvZiXw9aUmmSp3ku+2L+NrYIxpXW/bmro3Esl0S4vwDMgjXY
                                lToYnaaVnE5vNwfTafXALzYYeHU11tfFdmh1KP+Wrp2COEKhavuSJEwjaiYCmTDJmGIFQXVWYg0a
                                MJ3I</X509Certificate></X509Data></KeyInfo></Signature></NFe><protNFe versao="2.00"><infProt Id="ID342110000783631"><tpAmb>2</tpAmb><verAplic>SVRS20110505174728</verAplic><chNFe>42110609363232000189550020000020121000012180</chNFe><dhRecbto>2011-06-29T08:26:17</dhRecbto><nProt>342110000783631</nProt><digVal>h4iJX3gfbx15fA4RzDTEoZ/0VDY=</digVal><cStat>100</cStat><xMotivo>Autorizado o uso da NF-e</xMotivo></infProt></protNFe></nfeProc>'
      ide = xml.elements['nfeProc'].elements['NFe'].elements['infNFe'].elements['ide']
      #corpo da nota
      record = Transaction::Record.create(
          #data de emissão
          :creation_date => ide.elements['dEmi'].text(),
          #número da nota fiscal
          :code => ide.elements['nNF'].text(),
          #natureza da operação
          :name => ide.elements['natOp'].text(),
          #total dos produtos
          :goods => xml.elements['nfeProc'].elements['NFe'].elements['infNFe'].elements['total'].elements['ICMSTot'].elements['vProd'].text(),
          #valor do financeiro, total da operação
          :tot => xml.elements['nfeProc'].elements['NFe'].elements['infNFe'].elements['total'].elements['ICMSTot'].elements['vNF'].text()
      )
      if !record.save
        self.errors = record.errors
        return false
      end
      #cria ou recupera as instancias necessárias
      if !parse_create_instances()
        return false
      end
      if !parse_issuer(
          xml.elements['nfeProc'].elements['NFe'].elements['infNFe'].elements['emit'],
          record.id
      )
        return false
      end
      if !parse_sender(
          xml.elements['nfeProc'].elements['NFe'].elements['infNFe'].elements['dest'],
          record.id
      )
        return false
      end

      #itens da nota
      if !parse_item(xml, record.id)
        return false
      end
      #parcelas
      if !parse_financier(xml, record.id)
        return false
      end

      if !parse_tot(
          xml.elements['nfeProc'].elements['NFe'].elements['infNFe'].elements['total'].elements['ICMSTot'],
          record.id
        )
        return false
      end
    end #final da transacao no banco de dados
  end

  private
  def parse_create_instances
    @additional_total = Goods::Additional::Type.find_by_name('TOTAL')
    if @additional_total.nil?()
      @additional_total = Goods::Additional::Type.create(
        :name => 'TOTAL',
        :remark => 'Valor Total Produtos/Serviços'
      )
      if !@additional_total.save()
        self.errors = @additional_total.errors
        return false
      end
    end
    @additional_financeiro = Goods::Additional::Type.find_by_name('FINANCEIRO')
    if @additional_financeiro.nil?()
      @additional_financeiro = Goods::Additional::Type.create(
        :name => 'FINANCEIRO',
        :remark => 'Valor Total Financeiro'
      )
      if !@additional_financeiro.save()
        self.errors = @additional_financeiro.errors
        return false
      end
    end
    @additional_frete = Goods::Additional::Type.find_by_name('FRETE')
    if @additional_frete.nil?()
     @additional_frete = Goods::Additional::Type.create(
        :name => 'FRETE',
        :remark => 'valor Frete'
      )
      if !@additional_frete.save()
        self.errors = @additional_frete.errors
        return false
      end
    end
    @additional_despesa = Goods::Additional::Type.find_by_name('DESPESAS')
    if @additional_despesa.nil?()
      @additional_despesa = Goods::Additional::Type.create(
        :name => 'DESPESAS',
        :remark => 'Valor Outras Despesas'
      )
      if !@additional_despesa.save()
        self.errors = @additional_despesa.errors
        return false
      end
    end
    @additional_seguro = Goods::Additional::Type.find_by_name('SEGURO')
    if @additional_seguro.nil?()
      @additional_seguro = Goods::Additional::Type.create(
        :name => 'SEGURO',
        :remark => 'Valor Seguro'
      )
      if !@additional_seguro.save()
        self.errors = @additional_seguro.errors
        return false
      end
    end
    @additional_desconto = Goods::Additional::Type.find_by_name('DESCONTO')
    if @additional_desconto.nil?()
      @additional_desconto = Goods::Additional::Type.create(
        :name => 'DESCONTO',
        :remark => 'Valor Desconto'
      )
      if !@additional_desconto.save()
        self.errors = @additional_desconto.errors
        return false
      end
    end
    @address_type = Participant::Contact::Type.find_by_name('NFE')
    if @address_type.nil?()
      @address_type = Participant::Contact::Type.create(
        :name => 'NFE'
      )
      if !@address_type.save()
        self.errors = @address_type.errors
        return false
      end
    end
    #cria ou recupera os grupos de impostos
    @group_imcs = Taxe::Group.find_by_name('Icms')
    if @group_imcs.nil?()
      @group_imcs = Taxe::Group.create(:name => 'Icms')
      if !@group_imcs.save()
        self.errors = @group_imcs.errors
        return false
      end
    end
    @group_iss = Taxe::Group.find_by_name('Iss')
    if @group_iss.nil?()
      @group_iss = Taxe::Group.create(:name => 'Iss')
      if !@group_iss.save()
        self.errors = @group_iss.errors
        return false
      end
    end

    @group_ipi = Taxe::Group.find_by_name('Ipi')
    if @group_ipi.nil?()
      @group_ipi = Taxe::Group.create(:name => 'Ipi')
      if !@group_ipi.save()
        self.errors = @group_ipi.errors
        return false
      end
    end

    @group_cofins = Taxe::Group.find_by_name('Cofins')
    if @group_cofins.nil?()
      @group_cofins = Taxe::Group.create(:name => 'Cofins')
      if !@group_cofins.save()
        self.errors = @group_cofins.errors
        return false
      end
    end

    @group_pis = Taxe::Group.find_by_name('Pis')
    if @group_pis.nil?()
      @group_pis = Taxe::Group.create(:name => 'Pis')
      if !@group_pis.save()
        self.errors = @group_pis.errors
        return false
      end
    end
  end

  def parse_tot(xml, record_id)
#<vII>0.00</vII>
    additional = Goods::Additional::Value.create(
      :goods_additional_type_id => @additional_desconto.id,
      :value => xml.elements['vDesc'].text()
    )
    if !additional.save()
      self.errors = additional.errors
      return false
    end
    tot = Transaction::Tot.create(
      :goods_additional_value_id =>additional.id,
      :transaction_record_id => record_id
    )
    if !tot.save()
      self.errors = tot.erros
      return false
    end
    additional = Goods::Additional::Value.create(
      :goods_additional_type_id => @additional_despesa.id,
      :value => xml.elements['vOutro'].text()
    )
    if !additional.save()
      self.errors = tot.erros
      return false      
    end
    tot = Transaction::Tot.create(
      :goods_additional_value_id =>additional.id,
      :transaction_record_id => record_id
    )
    if !tot.save()
      self.errors = tot.erros
      return false
    end
    additional = Goods::Additional::Value.create(
      :goods_additional_type_id => @additional_seguro.id,
      :value => xml.elements['vSeg'].text()
    )
    if !additional.save()
      self.errors = tot.erros
      return false
    end
    tot = Transaction::Tot.create(
      :goods_additional_value_id =>additional.id,
      :transaction_record_id => record_id
    )
    if !tot.save()
      self.errors = tot.erros
      return false
    end
    additional = Goods::Additional::Value.create(
      :goods_additional_type_id => @additional_frete.id,
      :value => xml.elements['vFrete'].text()
    )
    if !additional.save()
      self.errors = tot.erros
      return false
    end
    tot = Transaction::Tot.create(
      :goods_additional_value_id =>additional.id,
      :transaction_record_id => record_id
    )
    if !tot.save()
      self.errors = tot.erros
      return false
    end
    if !taxe_id = parse_taxe(
      'PROPRIO',
      'Total Icms Próprio',
      @group_imcs.id,
      0.00,
      xml.elements['vBC'].text(),
      xml.elements['vICMS'].text()
    )
      return false
    end
    tot = Transaction::Taxe.create(
        :taxe_value_id => taxe_id,
        :transaction_record_id => record_id
    )
    if !tot.save()
      self.errors = tot.erros
      return false
    end
    if !taxe_id = parse_taxe(
      'ST',
      'Total Icms Substituição Tributaria',
      @group_imcs.id,
      0.00,
      xml.elements['vBCST'].text(),
      xml.elements['vST'].text()
    )
      return false
    end
    tot = Transaction::Taxe.create(
        :taxe_value_id => taxe_id,
        :transaction_record_id => record_id
    )
    if !tot.save()
      self.errors = tot.erros
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
      return false
    end
    tot = Transaction::Taxe.create(
        :taxe_value_id => taxe_id,
        :transaction_record_id => record_id
    )
    if !tot.save()
      self.errors = tot.erros
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
      return false
    end
    tot = Transaction::Taxe.create(
        :taxe_value_id => taxe_id,
        :transaction_record_id => record_id
    )
    if !tot.save()
      self.errors = tot.erros
      return false
    end
    id !taxe_id = parse_taxe(
        'TOTAL_PRODUTOS',
        'Total Pis Produtos',
        @group_pis.id,
        0.00,
        0.00,
        xml.elements['vPIS'].text()
    )
      return false
    end
    tot = Transaction::Taxe.create(
        :taxe_value_id => taxe_id,
        :transaction_record_id => record_id
    )
    if !tot.save()
      self.errors = tot.erros
      return false
    end
  end
  
  def parse_issuer(xml, record_id)
    if !person_id = parse_person(xml, 'enderEmit')
      return false
    end
    issuer = Participant::Issuer.create(
        :participant_person_id => person_id
    )
    if !issuer.save
      self.errors = issuer.errors
      return false
    end
    participant = Transaction::Participant.create(
        :transaction_record_id => record_id,
        :participant_type_id => issuer.id
    )
    if !participant.save()
      self.errors = participant.errors
      return false
    end
  end

  def parse_delivery(xml, record_id)
    if !person_id = parse_person(xml)
    delivery = Participant::Delivery.create(
        :participant_person_id => person_id
    )
      return false
    end
    if !delivery.save
      self.errors = delivery.errors
      return false 
    end
    participant = Transaction::Participant.create(
        :transaction_record_id => record_id,
        :participant_type_id => delivery.id
    )
    if !participant.save()
      self.errors = participant.errors
      return false
    end
  end

  def parse_sender(xml, record_id)
    if !person_id = parse_person(xml, 'enderDest')
      return false
    end
    sender = Participant::Sender.create(
        :participant_person_id => person_id
    )
    if !sender.save()
      self.errors = sender.errors
      return false
    end
    participant = Transaction::Participant.create(
        :transaction_record_id => record_id,
        :participant_type_id => sender.id
    )
    if !participant.save()
      self.errors = participant.errors
      return false
    end
  end

  def parse_person(xml, tag_address = nil)
    person = Participant::Person.create(
        :code => xml.elements['CNPJ'],
        :first_name => xml.elements['xNome']
    )
    if !person.save()
      self.errors = person.errors
      return false
    end
    if tag_address.nil? == false
      address_id = parse_address(xml.elements[tag_address])
      address = Participant::Contact::Address.create(
          :participant_person_id => person.id,
          :address_place_id => address_id,
          :participant_contact_type_id => @address_type.id
      )
      if !address.save()
        self.errors = address.errors
        return false
      end
    end
    return person.id
  end

  def parse_address(xml)
    country = Address::Country.find(
        :first,
        :conditions => {
            :code => xml.elements['cPais'].text().upcase,
            :type => "Address::Country"
        }
    )
    if country.nil?
      country = Address::Country.create(
          :code => xml.elements['cPais'].text().upcase,
          :name => xml.elements['xPais'].text().upcase
      )
      if !country.save
        self.errors = country.errors
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
    if state.nil?
      state = Address::State.create(
          #dois primeiros digitos do municipio é o codigo do estado
          :code => xml.elements['cMun'].text()[0, 2],
          :name => xml.elements['UF'].text().upcase,
          :acronym => xml.elements['UF'].text().upcase,
          :address_place_id => country.id
      )
      if !state.save()
        self.errors = state.errors
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

    if city.nil?
      city = Address::City.create(
          :code => xml.elements['cMun'].text().upcase,
          :name => xml.elements['xMun'].text().upcase,
          :address_place_id => state.id
      )
      if !city.save()
        self.errors = city.errors
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

    if neighborhood.nil?
      neighborhood = Address::Neighborhood.create(
          :code => xml.elements['CEP'].text().upcase,
          :name => xml.elements['xBairro'].text().upcase,
          :address_place_id => city.id
      )
      if !neighborhood.save()
        self.errors = neighborhood.errors
        return false
      end
    end

    street = Address::Street.create(
        :code => xml.elements['nro'].text().upcase,
        :name => xml.elements['xLgr'].text().upcase,
        :address_place_id => neighborhood.id
    )
    if !street.save
      self.errors = street.errors
      return false
    end
    street.id
  end

  def parse_item(xml, record_id)
    additional_unitario_tributado = Goods::Additional::Type.find_by_name('UNITARIO_TRIBUTADO')
    if additional_unitario_tributado.nil?()
      additional_unitario_tributado = Goods::Additional::Type.create(
        :name => 'UNITARIO_TRIBUTADO',
        :remark => 'Valor Unitário Tributado'
      )
      if !additional_unitario_tributado.save()
        self.errors = additional_unitario_tributado.errors
        return false
      end
    end
    additional_unitario_comercializado = Goods::Additional::Type.find_by_name('UNITARIO_COMERCIALIZADO')
    if additional_unitario_comercializado.nil?()
      additional_unitario_comercializado = Goods::Additional::Type.create(
        :name => 'UNITARIO_COMERCIALIZADO',
        :remark => 'Valor Unitário Tributado'
      )
      if !additional_unitario_comercializado.save()
        self.errors = additional_unitario_comercializado.errors
        return false
      end
    end
    additional_quantidade_tributada = Goods::Additional::Type.find_by_name('QUANTIDADE_TRIBUTADA')
    if additional_quantidade_tributada.nil?()
      additional_quantidade_tributada = Goods::Additional::Type.create(
        :name => 'QUANTIDADE_TRIBUTADA',
        :remark => 'Valor Unitário Tributado'
      )
      if !additional_quantidade_tributada.save()
        self.errors = additional_quantidade_tributada.errors
        return false
      end
    end
    #percorre os elementos det que os produtos e serviços
    xml.elements.each('nfeProc/NFe/infNFe/det') do |det|
      #cria o produtos/serviço
      goods = Goods::Item.create(
          #codigo da mercadoria
          :code => det.elements['prod'].elements['cProd'].text(),
          #nome da mercadoria
          :name => det.elements['prod'].elements['xProd'].text()
      )
      if !goods.save()
        self.errors = goods.erros
        return false
      end
      #insere o item no registro
      item = Transaction::Goods::Item.create(
          #id do item
          :goods_item_id => goods.id,
          #id da transação
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
        self.errors = item.errors
        return false
      end
      additional = Goods::Additional::Value.create(
        :goods_additional_type_id => additional_quantidade_tributada.id,
        :value => det.elements['prod'].elements['qTrib'].text()
      )
      if !additional.save()
        self.errors = additional.errors
        return false
      end
      additional = Transaction::Goods::Additional.create(
        :goods_additional_value_id =>additional.id,
        :transaction_goods_item_id => item.id
      )
      if !additional.save()
        self.errors = additional.errors
        return false
      end
      additional = Goods::Additional::Value.create(
        :goods_additional_type_id => additional_unitario_tributado.id,
        :value => det.elements['prod'].elements['vUnTrib'].text()
      )
      if !additional.save()
        self.errors = additional.errors
        return false
      end
      additional = Transaction::Goods::Additional.create(
        :goods_additional_value_id =>additional.id,
        :transaction_goods_item_id => item.id
      )
      if !additional.save()
        self.errors = additional.errors
        return false
      end
      additional = Goods::Additional::Value.create(
        :goods_additional_type_id => additional_unitario_comercializado.id,
        :value => det.elements['prod'].elements['vUnCom'].text()
      )
      if !additional.save()
        self.errors = additional.errors
        return false
      end
      additional = Transaction::Goods::Additional.create(
        :goods_additional_value_id =>additional.id,
        :transaction_goods_item_id => item.id
      )
      if !additional.save()
        self.errors = additional.errors
        return false
      end
      if !det.elements['prod'].elements['vDesc'].nil?()
        additional = Goods::Additional::Value.create(
          :goods_additional_type_id => @additional_desconto.id,
          :value => det.elements['prod'].elements['vDesc'].text()
        )
        if !additional.save()
          self.errors = additional.errors
          return false
        end
        additional = Transaction::Goods::Additional.create(
          :goods_additional_value_id =>additional.id,
          :transaction_goods_item_id => item.id
        )
        if !additional.save()
          self.errors = additional.errors
          return false
        end
      end
      if !det.elements['prod'].elements['vOutro'].nil?()
        additional = Goods::Additional::Value.create(
          :goods_additional_type_id => @additional_despesa.id,
          :value => det.elements['prod'].elements['vOutro'].text()
        )
        if !additional.save()
          self.errors = additional.errors
          return false
        end
        additional = Transaction::Goods::Additional.create(
          :goods_additional_value_id =>additional.id,
          :transaction_goods_item_id => item.id
        )
        if !additional.save()
          self.errors = additional.errors
          return false
        end
      end
      if !det.elements['prod'].elements['vSeg'].nil?()
        additional = Goods::Additional::Value.create(
          :goods_additional_type_id => @additional_seguro.id,
          :value => det.elements['prod'].elements['vSeg'].text()
        )
        if !additional.save()
          self.errors = additional.errors
          return false
        end
        additional = Transaction::Goods::Additional.create(
          :goods_additional_value_id =>additional.id,
          :transaction_goods_item_id => item.id
        )
        if !additional.save()
          self.errors = additional.errors
          return false
        end
      end
      if !det.elements['prod'].elements['vFrete'].nil?()
        additional = Goods::Additional::Value.create(
          :goods_additional_type_id => @additional_frete.id,
          :value => det.elements['prod'].elements['vFrete'].text()
        )
        if !additional.save()
          self.errors = additional.errors
          return false
        end
        additional = Transaction::Goods::Additional.create(
          :goods_additional_value_id =>additional.id,
          :transaction_goods_item_id => item.id
        )
        if !additional.save()
          self.errors = additional.errors
          return false
        end
      end
      #
      #verificar se existe a tag de iss,
      #se ela exisitir chamar somente ela
      #se nao existir chamar icms e ipi
      #
      Transaction::Goods::Taxe.create(
          :taxe_value_id =>
              parse_item_icms(
                  det.elements['imposto'].elements['ICMS'],
                  @group_imcs.id
              ),
          :transaction_goods_item_id => item.id
      )
      Transaction::Goods::Taxe.create(
          :taxe_value_id =>
              parse_item_ipi(
                  det.elements['imposto'].elements['IPI'],
                  @group_ipi.id
              ),
          :transaction_goods_item_id => item.id
      )
      Transaction::Goods::Taxe.create(
          :taxe_value_id =>
              parse_item_cofins(
                  det.elements['imposto'].elements['COFINS'],
                 @group_cofins.id
              ),
          :transaction_goods_item_id => item.id
      )
      Transaction::Goods::Taxe.create(
          :taxe_value_id =>
              parse_item_iss(
                  det.elements['imposto'].elements['PIS'],
                  @group_iss.id
              ),
          :transaction_goods_item_id => item.id
      )
    end #fim dos itens
  end#fim parse_item

  def parse_taxe(code, name, taxe_group_id, percentage, basis, value, reduction = 0.00)
    type_id = parse_taxe_type(code, name, taxe_group_id)
    parse_taxe_value(type_id, percentage, basis, value, reduction)
  end

  def parse_item_icms(xml, taxe_group_id)
    basis = 0.00
    value = 0.00
    percentage = 0.00
    reduction = 0.00
    if !xml.elements['ICMS00'].nil?()
      tag = xml.elements['ICMS00']
      code = tag.elements['CST'].text()
      name = 'Tributada integralmente' 
      basis = tag.elements['vBC'].text()
      value = tag.elements['vICMS'].text()
      percentage = tag.elements['pICMS'].text()
    elsif !xml.elements['ICMS10'].nil?()
      tag = xml.elements['ICMS10']
      code = tag.elements['CST'].text()
      name = 'Tributada e com cobrança do ICMS por substituição tributária' 
      basis = tag.elements['vBC'].text()
      value = tag.elements['vICMS'].text()
      percentage = tag.elements['pICMS'].text()  
    elsif !xml.elements['ICMS20'].nil?()
      tag = xml.elements['ICMS20']
      code = tag.elements['CST'].text()
      name = 'Com redução de base de cálculo' 
      basis = tag.elements['vBC'].text()
      value = tag.elements['vICMS'].text()
      percentage = tag.elements['pICMS'].text()
      reduction = tag.elements['pRedBC'].text()
    elsif !xml.elements['ICMS30'].nil?()
      tag = xml.elements['ICMS30']
      code = tag.elements['CST'].text()
      name = 'Isenta ou não tributada e com cobrança do ICMS por substituição tributária' 
      basis = tag.elements['vBCST'].text()
      value = tag.elements['vICMSST'].text()
      percentage = tag.elements['pICMSST'].text()
      if !tag.elements['pRedBCST'].nil?
        reduction = tag.elements['pRedBCST'].text()
      end
    elsif !xml.elements['ICMS40'].nil?()
      tag = xml.elements['ICMS40']
      code = tag.elements['CST'].text()
      case code
      when 40
        name = 'Isenta'
      when 41
        name = 'Não tributada'
      when 50
        name = 'Suspensão'
      end
      if tag.elements['vICMS '].nil?
        value = tag.elements['vICMS'].text()
      end
    elsif !xml.elements['ICMS51'].nil?()
      tag = xml.elements['ICMS51']
      code = tag.elements['CST'].text()
      name = 'Diferimento' 
      basis = tag.elements['vBC'].text()
      value = tag.elements['vICMS'].text()
      percentage = tag.elements['pICMS'].text()
    elsif !xml.elements['ICMS60'].nil?()
      tag = xml.elements['ICMS60']
      code = tag.elements['CST'].text()
      name = 'ICMS cobrado anteriormente por substituição tributária' 
      basis = tag.elements['vICMSSTRet'].text()
      value = tag.elements['vBCSTRet'].text() 
    elsif !xml.elements['ICMS70'].nil?()
      tag = xml.elements['ICMS70']
      code = tag.elements['CST'].text()
      name = 'Isenta ou não tributada e com cobrança do ICMS por substituição tributária' 
      basis = tag.elements['vBCST'].text()
      value = tag.elements['vICMSST'].text()
      percentage = tag.elements['pICMSST'].text()
      if !tag.elements['pRedBCST'].nil?
        reduction = tag.elements['pRedBCST'].text()
      end
      percentage = tag.elements['pICMS'].text()  
    elsif !xml.elements['ICMSSN102'].nil?()
      tag = xml.elements['ICMSSN102']
      code = tag.elements['CSOSN'].text()
      name = 'Tributada pelo Simples Nacional sem permissão de crédito'
    end
    parse_taxe(code, name, taxe_group_id, percentage, basis, value, reduction)
  end

  def parse_item_ipi(xml, taxe_group_id)
    parse_taxe(code, name, taxe_group_id, percentage, basis, value)
  end

  def parse_item_pis(xml, taxe_group_id)
    parse_taxe(code, name, taxe_group_id, percentage, basis, value)
  end

  def parse_item_cofins(xml, taxe_group_id)
    parse_taxe(code, name, taxe_group_id, percentage, basis, value)
  end

  def parse_taxe_type(code, name, taxe_group_id)
    type = Taxe::Type.create(
        :name => name,
        :code => code,
        :taxe_group_id => taxe_group_id
    )
    type.save
    type.id
  end

  def parse_taxe_value(taxe_type_id, percentage, basis, value, reduction = 0.00)
    taxe = Taxe::Value.create(
        :taxe_type_id => taxe_type_id,
        :percentage => percentage,
        :basis => basis,
        :value => value,
        :reduction => reduction
    )
    taxe.save
    taxe.id
  end

  def parse_financier(xml, record_id)
    xml.elements.each('nfeProc/NFe/infNFe/cobr/dup') do |dup|
      note = Financier::Note.create(
          #valor
          :original_value => dup.elements['vDup'].text(),
          #name
          :name => record.code,
          #data de vencimento
          :expiration_date => dup.elements['dVenc'].text(),
          #data de emissão
          :creation_date => record.creation_date,
          #numero da parcela
          :number => dup.elements['nDup'].text()
      )
      note.save
      financier = Transaction::Financier.create(
          #id do registro
          :transaction_record_id => record_id,
          #id da parcela
          :financier_note_id => note.id
      )
      financier.save
    end #final da iteração das parcelas
  end #parse_financier
end
