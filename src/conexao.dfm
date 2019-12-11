object dmConexao: TdmConexao
  OldCreateOrder = False
  Left = 196
  Top = 124
  Height = 300
  Width = 447
  object con: TADOConnection
    ConnectionString = 
      'Provider=OraOLEDB.Oracle.1;Password=manager;Persist Security Inf' +
      'o=True;User ID=daniel;Data Source=xe'
    LoginPrompt = False
    Provider = 'OraOLEDB.Oracle.1'
    Left = 24
    Top = 32
  end
  object qryAux: TADOQuery
    Connection = con
    Parameters = <>
    Left = 24
    Top = 88
  end
  object qryProdutor: TADOQuery
    Connection = con
    Parameters = <
      item
        Name = 'cgc_produtor'
        DataType = ftString
        Size = 14
        Value = Null
      end>
    SQL.Strings = (
      'select * from produtor'
      'where cgc_produtor = :cgc_produtor')
    Left = 24
    Top = 144
    object qryProdutorCGC_PRODUTOR: TStringField
      FieldName = 'CGC_PRODUTOR'
      Size = 14
    end
    object qryProdutorNOME_PRODUTOR: TStringField
      FieldName = 'NOME_PRODUTOR'
      Size = 45
    end
  end
  object qryDistribuidor: TADOQuery
    Connection = con
    Parameters = <
      item
        Name = 'cgc_distribuidor'
        DataType = ftString
        Size = 14
        Value = Null
      end>
    SQL.Strings = (
      'select * from distribuidor'
      'where cgc_distribuidor = :cgc_distribuidor')
    Left = 24
    Top = 200
    object qryDistribuidorCGC_DISTRIBUIDOR: TStringField
      FieldName = 'CGC_DISTRIBUIDOR'
      Size = 14
    end
    object qryDistribuidorNOME_DISTRIBUIDOR: TStringField
      FieldName = 'NOME_DISTRIBUIDOR'
      Size = 45
    end
  end
  object qryProdutorLimite: TADOQuery
    Connection = con
    Parameters = <
      item
        Name = 'cgc_produtor'
        DataType = ftString
        Size = 14
        Value = Null
      end>
    SQL.Strings = (
      
        'select p.*, (Select nome_distribuidor from distribuidor d where ' +
        'p.cgc_distribuidor = d.cgc_distribuidor) as NOME_DISTRIBUIDOR'
      '  from PRODUTOR_limite p'
      '          '
      'where cgc_produtor = :cgc_produtor')
    Left = 112
    Top = 32
    object qryProdutorLimiteCGC_PRODUTOR: TStringField
      FieldName = 'CGC_PRODUTOR'
      ProviderFlags = []
      Size = 14
    end
    object qryProdutorLimiteCGC_DISTRIBUIDOR: TStringField
      FieldName = 'CGC_DISTRIBUIDOR'
      ProviderFlags = []
      Size = 14
    end
    object qryProdutorLimiteVALOR_LIMITE: TBCDField
      FieldName = 'VALOR_LIMITE'
      ProviderFlags = []
      Precision = 15
    end
    object qryProdutorLimiteNOME_DISTRIBUIDOR: TStringField
      FieldName = 'NOME_DISTRIBUIDOR'
      ProviderFlags = []
      Size = 45
    end
  end
  object dsoProdutorLimite: TDataSource
    DataSet = qryProdutorLimite
    Left = 200
    Top = 32
  end
  object dsoProdutor: TDataSource
    DataSet = qryProdutor
    Left = 96
    Top = 144
  end
  object dsoDistribuidor: TDataSource
    DataSet = qryDistribuidor
    Left = 72
    Top = 200
  end
end
