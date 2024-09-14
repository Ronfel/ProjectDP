object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Design Patterns'
  ClientHeight = 248
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btnSingleton: TButton
    Left = 32
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Singleton'
    TabOrder = 0
    OnClick = btnSingletonClick
  end
  object btnFactoryMethod: TButton
    Left = 32
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Factory M.'
    TabOrder = 1
    OnClick = btnFactoryMethodClick
  end
  object btnNotifyObservers: TButton
    Left = 32
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Observer'
    TabOrder = 2
    OnClick = btnNotifyObserversClick
  end
  object btnStrategy: TButton
    Left = 32
    Top = 133
    Width = 75
    Height = 25
    Caption = 'Strategy'
    TabOrder = 3
    OnClick = btnStrategyClick
  end
  object btnAdapter: TButton
    Left = 32
    Top = 164
    Width = 75
    Height = 25
    Caption = 'Adapter'
    TabOrder = 4
    OnClick = btnAdapterClick
  end
  object btnDecorator: TButton
    Left = 32
    Top = 195
    Width = 75
    Height = 25
    Caption = 'Decorator'
    TabOrder = 5
    OnClick = btnDecoratorClick
  end
  object btnFacade: TButton
    Left = 136
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Facade'
    TabOrder = 6
    OnClick = btnFacadeClick
  end
  object btnCommand: TButton
    Left = 136
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Command'
    TabOrder = 7
    OnClick = btnCommandClick
  end
  object Button3: TButton
    Left = 136
    Top = 102
    Width = 75
    Height = 25
    TabOrder = 8
  end
  object Button4: TButton
    Left = 136
    Top = 133
    Width = 75
    Height = 25
    TabOrder = 9
  end
  object Button5: TButton
    Left = 136
    Top = 164
    Width = 75
    Height = 25
    TabOrder = 10
  end
  object Button6: TButton
    Left = 136
    Top = 195
    Width = 75
    Height = 25
    TabOrder = 11
  end
end
