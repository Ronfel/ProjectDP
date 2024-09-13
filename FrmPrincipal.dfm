object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'FormPrincipal'
  ClientHeight = 441
  ClientWidth = 624
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
end
