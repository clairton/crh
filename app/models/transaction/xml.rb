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
require 'participant/contact'
require 'participant/contact/address'
require 'participant/contact/email'
require 'participant/contact/type'
class Transaction::Xml < ActiveRecord::Base
	belongs_to :Record, :class_name => "Transaction::Record"
	validates_presence_of :content, :message => "Deve Informar Um arquivo Xml"
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
        :creation_date => ide.elements['dEmi'].text,
        #número da nota fiscal
        :code => ide.elements['nNF'].text,
        #natureza da operação
        :name => ide.elements['natOp'].text
      )
      record.save
      @transaction_record_id = record.id
      
      emit = xml.elements['nfeProc'].elements['NFe'].elements['infNFe'].elements['emit']
      dest = xml.elements['nfeProc'].elements['NFe'].elements['infNFe'].elements['dest']
      total = xml.elements['nfeProc'].elements['NFe'].elements['infNFe'].elements['total']
      
      #itens da nota
      parse_item(xml,record.id)
      #parcelas
      parse_financier(xml,record.id)
        
    end#final da transacao no banco de dados    
	end
	
	private
	def parse_issuer(xml,record_id)
	  person_id = parse_person(xml,'enderEmit')
	  issuer = Transaction::Issuer.create(
      :transaction_record_id => record_id,
      :participant_person_id => person_id
    )
	  issuer.save	
	end
	
	def parse_delivery(xml,record_id)
	  person_id = parse_person(xml)
	  delivery = Transaction::Delivery.create(
      :transaction_record_id => record_id,
      :participant_person_id => person_id
    )
	  delivery.save	
	end
	
	def parse_sender(xml,record_id)
	  person_id = parse_person(xml,'enderDest')
	  sender = Transaction::Sender.create(
      :transaction_record_id => record_id,
      :participant_person_id => person_id
    )
	  sender.save
	end
	
	def parse_person(xml,tag_address = nil)
    person = Participant::Person.create(
      :code => xml.elements['CNPJ'],
      :name => xml.elements['xNome']
    )
    person.save
    if tag_address.nil? == false
      address_id = parse_address(xml.elements[tag_address])
      address = Participant::Contact::Address.create(
        :participant_person_id => person.id,
        :address_place_id => address_id#,
        #:participant_contact_type_id =>  
      )
      address.save  
    end
    return person.id
	end
	
	def parse_address(xml)
    country = Address::Country.create(
      :code => xml.elements['cPais'],
      :name => xml.elements['xPais']
    )
    country.save
    state = Address::State.create(
      :code => xml.elements['cPais'],
      :name => xml.elements['UF'],
      :acronym => xml.elements['UF'],
      :place_id => country.id   
    )
    state.save
    city = Address::City.create(
      :code => xml.elements['cMun'],
      :name => xml.elements['xMun'],   
      :place_id => state.id 
    )
    city.save
    neighborhood = Address::City.create(
      :code => xml.elements['CEP'],
      :name => xml.elements['xBairro'],   
      :place_id => city.id 
    )
    neighborhood.save
    street = Address::City.create(
      :code => xml.elements['nro'],
      :name => xml.elements['xLgr'],  
      :remark => xml.elements['xCpl'],  
      :place_id => neighborhood.id 
    )
    street.save
    street.id
	end	
	
  def parse_item(xml,record_id)
      #cria ou recupera os grupos de impostos
      group_imcs = Taxe::Group.create(:name => "Icms")
      group_iss = Taxe::Group.create(:name => "Iss")
      group_ipi = Taxe::Group.create(:name => "Ipi")
      group_cofins = Taxe::Group.create(:name => "Cofins")
      group_pis = Taxe::Group.create(:name => "Pis")
      
      #percorre os elementos det que os produtos e serviços
      xml.elements.each('nfeProc/NFe/infNFe/det') do |det|
        #cria o produtos/serviço
        goods = Goods::Item.create(
          #codigo da mercadoria
          :code => det.elements['prod'].elements['cProd'].text,
          #nome da mercadoria
          :name => det.elements['prod'].elements['xProd'].text        
        )
        goods.save  
        #insere o item no registro
        item = Transaction::Item.create(
          #id do item
          :goods_item_id => goods.id,
          #id da transação
          :transaction_record_id => record_id,
          #nome do item
          :name => det.elements['prod'].elements['xProd'].text,
          #unidade de medida
          :measure => det.elements['prod'].elements['uCom'].text,
          #quantidade
          :quantity => det.elements['prod'].elements['qCom'].text,
          #valor unitario
          :unit_price => det.elements['prod'].elements['vUnCom'].text,
          #valor total
          :full_price => det.elements['prod'].elements['vProd'].text      
        )    
        item.save
        #
          #verificar se existe a tag de iss,
          #se ela exisitir chamar somente ela
          #se nao existir chamar icms e ipi
        #
        Transaction::ItemTaxe.create(
          :taxe_value_id => 
            parse_item_icms(
              det.elements['prod'].elements['imposto'].elements['ICMS'],
              group_imcs.id
            ),
          :transaction_item_id => item.id
        )
        Transaction::ItemTaxe.create(
          :taxe_value_id => 
            parse_item_ipi(
              det.elements['prod'].elements['imposto'].elements['IPI'],
              group_imcs.id
            ),
          :transaction_item_id => item.id
        )
        Transaction::ItemTaxe.create(
          :taxe_value_id => 
            parse_item_cofins(
              det.elements['prod'].elements['imposto'].elements['COFINS'],
              group_imcs.id
            ),
          :transaction_item_id => item.id
        )
        Transaction::ItemTaxe.create(
          :taxe_value_id => 
            parse_item_iss(
              det.elements['prod'].elements['imposto'].elements['PIS'],
              group_imcs.id
            ),
          :transaction_item_id => item.id
        )
      end#fim dos itens  
  end#fim parse_item
  
  def parse_item_icms(xml,taxe_group_id)
    type_id = parse_item_taxe_type(code,name,taxe_group_id)
    parse_item_taxe_value(type_id,percentage,basis,value)
  end
  
  def parse_item_ipi(xml,taxe_group_id)
    type_id = parse_item_taxe_type(code,name,taxe_group_id)
    parse_item_taxe_value(type_id,percentage,basis,value)
  end
  
  
  def parse_item_pis(xml,taxe_group_id)
    type_id = parse_item_taxe_type(code,name,taxe_group_id)
    parse_item_taxe_value(type_id,percentage,basis,value)
  end
  
  
  def parse_item_cofins(xml,taxe_group_id)
    type_id = parse_item_taxe_type(code,name,taxe_group_id)
    parse_item_taxe_value(type_id,percentage,basis,value)
  end
  
  def parse_item_taxe_type(code,name,taxe_group_id)
    type = Taxe::Type.create(
      :name => name,
      :code => code, 
      :taxe_group_id => taxe_group_id
    )
    type.save
    type.id  
  end
  
  def parse_item_taxe_value(taxe_type_id,percentage,basis,value)
    taxe = Taxe::Value(
      :taxe_type_id => taxe_type_id,
      :percentage => percentage,
      :basis => basis,
      :value =>  value     
    )
    taxe.save
    taxe.id  
  end
  
  def parse_financier(xml,record_id)  
    xml.elements.each('nfeProc/NFe/infNFe/cobr/dup') do |dup|
      note = Financier::Note.create(
        #valor
        :original_value => dup.elements['vDup'].text,
        #name
        :name => record.code,
        #data de vencimento
        :expiration_date => dup.elements['dVenc'].text,
        #data de emissão
        :creation_date => record.creation_date,
        #numero da parcela
        :number => dup.elements['nDup'].text
      )
      note.save
      financier = Transaction::Financier.create(
        #id do registro
        :transaction_record_id => record_id,
        #id da parcela
        :financier_note_id => note.id
      )
      financier.save
    end#final da iteração das parcelas
  end#parse_financier
end