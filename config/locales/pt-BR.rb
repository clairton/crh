#encoding: utf-8
{
  :'pt-BR' => {
    :New => "Novo",
    :Back => "Voltar",
    :Destroy => "Excluir",
    :Show => "Mostar",
    :Edit => "Editar",
    :Listing => "Listando",
    :Editing => "Editando",
    :Transaction => "Transação",
    :Import => "Importar",
    :Welcome => "Bem Vindo",
    :CRH => "CRH",
    :to => "ao",
    :home => "Início",
    :taxe_groups => "Grupos de Impostos",
    :taxe_group => "Grupo de Imposto",
    :taxe_types => "Tipos de Impostos",
    :taxe_type => "Tipo de Imposto",
    :taxe_values => "Registros de Impostos",
    :taxe_value => "Registro de Imposto",
    :address_places => "Lugares de Endereços",
    :address_place => "Lugar de Endereço",
    :Place => "Lugar",
    :Places => "Lugares",
    :Country => "País",
    :State => "Estado",
    :City => "Município",
    :Neighborhood => "Bairro",
    :Street => "Logradouro",
    :financier_notes => "Faturas",
    :financier_note => "Fatura",
    :participant_people => "Pessoas Participantes",
    :participant_person => "Pessoa Participante",
    :participant_types => "Tipos de Participantes",
    :participant_type => "Tipo de Participante",
    :Delivery => "Destinatário",
    :Sender => "Transportadora",
    :Issuer => "Emitente",
    :participant_contact_addresses => "Endereços de Contato dos Participantes",
    :Addresses => "Endereços",
    :Addres => "Endereço",
    :participant_contact_address => "Endereço de Contato do Participante",
    :participant_contact_types => "Tipos de Contato dos Participantes",
    :participant_contact_type => "Tipo de Contato do Participante",
    :transaction_financiers => "Faturas da NFe",
    :transaction_financier => "Fatura da NFe",
    :transaction_goods_items => "Itens da NFe",
    :transaction_goods_item => "Item da NFe",
    :transaction_xmls =>  "XML's NFe",
    :transaction_xml =>  "XML NFe",
    :Xml => "Xml",
    :xml => "xml",
    :goods_additional_types =>  "Tipos de Valores Adicionais",
    :goods_additional_type =>  "Tipo de Valor Adicional",
    :Types => "Tipos",
    :Type => "Tipo",
    :goods_additional_values =>  "Valores Adicionais",
    :goods_additional_value =>  "Valor Adicional",
    :Values => "Valores",
    :Value => "Valor",
    :transaction_goods_items =>  "Itens da NFe",
    :transaction_goods_item =>  "Item da NFe",
    :transaction_goods_taxes =>  "Impostos dos Itens da NFe",
    :transaction_goods_taxe =>  "Imposto do Item da NFe",
    :transaction_goods_additionals =>  "Valores Adicionais dos Itens da NFe",
    :transaction_goods_additional =>  "Valor Adicional do Item da NFe",
    :transaction_participants =>  "Participantes da NFe",
    :transaction_participant =>  "Participante da NFe",
    :transaction_records =>  "Registros de Transações da NFe",
    :transaction_record =>  "Registro de Transação da NFe",
    :record => "Registro",
    :records => "Registros",
    :Record => "Registro",
    :Records => "Registros",
    :transaction_taxes =>  "Impostos da NFe",
    :transaction_taxe =>  "Imposto da NFe",
    :transaction_tots =>  "Valores Adicionais da NFe",
    :transaction_tot =>  "Valor Adicional da NFe",
    :Tot => "Totalizador",
    # formatos de data e hora
    :date => {
      :formats => {
        :default      => "%d/%m/%Y",
        :short        => lambda { |date| "#{date.day} %b" },
        :long         => lambda { |date| "#{date.day} de %B de %Y" },
        :only_day     => "%e"
      },
      :day_names => %w(Domingo Segunda Terça Quarta Quinta Sexta Sábado),
      :abbr_day_names => %w(Dom Seg Ter Qua Qui Sex Sáb),
      :month_names => [nil] + %w(Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro),
      :abbr_month_names => [nil] + %w(Jan Fev Mar Abr Mai Jun Jul Ago Set Out Nov Dez),
      :order => [:day, :month, :year]
    },
    :time => {
      :formats => {
        :default      => lambda { |time| "%A, #{time.day} de %B de %Y, %H:%M hs" },
        :time         => "%H:%M hs",
        :short        => lambda { |time| "#{time.day}/%m, %H:%M hs" },
        :long         => lambda { |time| "%A, #{time.day} de %B de %Y, %H:%M hs" },
        :only_second  => "%S"
      },
      :am => '',
      :pm => ''
    },

    # date helper distanci em palavras
    :datetime => {
      :distance_in_words => {
        :half_a_minute => 'meio minuto',
        :less_than_x_seconds => {
          :one => 'menos de 1 segundo',
          :other => 'menos de {{count}} segundos'
        },
        :x_seconds => {
          :one => '1 segundo',
          :other => '{{count}} segundos'
        },
        :less_than_x_minutes => {
          :one => 'menos de um minuto',
          :other => 'menos de {{count}} minutos'
        },
        :x_minutes => {
          :one => '1 minuto',
          :other => '{{count}} minutos'
        },
        :about_x_hours => {
          :one => 'aproximadamente 1 hora',
          :other => 'aproximadamente {{count}} horas'
        },
        :x_days => {
          :one => '1 dia',
          :other => '{{count}} dias'
        },
        :about_x_months => {
          :one => 'aproximadamente 1 mês',
          :other => 'aproximadamente {{count}} meses'
        },
        :x_months => {
          :one => '1 mês',
          :other => '{{count}} meses'
        },
        :about_x_years => {
          :one => 'aproximadamente 1 ano',
          :other => 'aproximadamente {{count}} anos'
        },
        :over_x_years => {
          :one => 'mais de 1 ano',
          :other => 'mais de {{count}} anos'
        }
      }
    },

    # numeros
    :number => {
      :format => {
        :precision => 3,
        :separator => ',',
        :delimiter => '.'
      },
      :currency => {
        :format => {
          :unit => 'R$',
          :precision => 2,
          :format => '%u %n'
        }
      }
    },

    # Active Record
    :activerecord => {
      :errors => {
        :template => {
          :header => {
            :one => "{{model}} não pôde ser salvo: 1 erro",
            :other => "{{model}} não pôde ser salvo: {{count}} erros."
          },
          :body => "Por favor, cheque os seguintes campos:"
        },
        :messages => {
          :inclusion => "não está incluso na lista",
          :exclusion => "não está disponível",
          :invalid => "não é válido",
          :confirmation => "não bate com a confirmação",
          :accepted  => "precisa ser aceito",
          :empty => "não pode ser vazio",
          :blank => "não pode ser vazio",
          :too_long => "é muito longo (não mais do que {{count}} caracteres)",
          :too_short => "é muito curto (não menos do que {{count}} caracteres)",
          :wrong_length => "não é do tamanho correto (precisa ter {{count}} caracteres)",
          :taken => "não está disponível",
          :not_a_number => "não é um número",
          :greater_than => "precisa ser maior do que {{count}}",
          :greater_than_or_equal_to => "precisa ser maior ou igual a {{count}}",
          :equal_to => "precisa ser igual a {{count}}",
          :less_than => "precisa ser menor do que {{count}}",
          :less_than_or_equal_to => "precisa ser menor ou igual a {{count}}",
          :odd => "precisa ser ímpar",
          :even => "precisa ser par"
        }
      }
    }
  }
}

