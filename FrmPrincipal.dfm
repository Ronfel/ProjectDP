object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Design Patterns'
  ClientHeight = 230
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btnSingleton: TButton
    Left = 18
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Singleton'
    TabOrder = 0
    OnClick = btnSingletonClick
  end
  object btnFactoryMethod: TButton
    Left = 18
    Top = 61
    Width = 75
    Height = 25
    Caption = 'Factory M.'
    TabOrder = 1
    OnClick = btnFactoryMethodClick
  end
  object btnNotifyObservers: TButton
    Left = 18
    Top = 92
    Width = 75
    Height = 25
    Caption = 'Observer'
    TabOrder = 2
    OnClick = btnNotifyObserversClick
  end
  object btnStrategy: TButton
    Left = 18
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Strategy'
    TabOrder = 3
    OnClick = btnStrategyClick
  end
  object btnAdapter: TButton
    Left = 18
    Top = 154
    Width = 75
    Height = 25
    Caption = 'Adapter'
    TabOrder = 4
    OnClick = btnAdapterClick
  end
  object btnDecorator: TButton
    Left = 18
    Top = 185
    Width = 75
    Height = 25
    Caption = 'Decorator'
    TabOrder = 5
    OnClick = btnDecoratorClick
  end
  object btnFacade: TButton
    Left = 101
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Facade'
    TabOrder = 6
    OnClick = btnFacadeClick
  end
  object btnCommand: TButton
    Left = 101
    Top = 61
    Width = 75
    Height = 25
    Caption = 'Command'
    TabOrder = 7
    OnClick = btnCommandClick
  end
  object btnPrototype: TButton
    Left = 101
    Top = 92
    Width = 75
    Height = 25
    Caption = 'Prototype'
    TabOrder = 8
    OnClick = btnPrototypeClick
  end
  object btnState: TButton
    Left = 101
    Top = 123
    Width = 75
    Height = 25
    Caption = 'State'
    TabOrder = 9
    OnClick = btnStateClick
  end
  object btnTemplate: TButton
    Left = 101
    Top = 154
    Width = 75
    Height = 25
    Caption = 'Template'
    TabOrder = 10
    OnClick = btnTemplateClick
  end
  object btnAbstractFactory: TButton
    Left = 101
    Top = 185
    Width = 75
    Height = 25
    Caption = 'Abstract F.'
    TabOrder = 11
    OnClick = btnAbstractFactoryClick
  end
  object btnBuilder: TButton
    Left = 197
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Builder'
    TabOrder = 12
    OnClick = btnBuilderClick
  end
  object btnBridge: TButton
    Left = 197
    Top = 61
    Width = 75
    Height = 25
    Caption = 'Bridge'
    TabOrder = 13
    OnClick = btnBridgeClick
  end
  object btnComposite: TButton
    Left = 197
    Top = 92
    Width = 75
    Height = 25
    Caption = 'Composite'
    TabOrder = 14
    OnClick = btnCompositeClick
  end
  object btnProxy: TButton
    Left = 197
    Top = 154
    Width = 75
    Height = 25
    Caption = 'Proxy'
    TabOrder = 15
    OnClick = btnProxyClick
  end
  object btnFlyweight: TButton
    Left = 197
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Flyweight'
    TabOrder = 16
    OnClick = btnFlyweightClick
  end
  object btnChain: TButton
    Left = 197
    Top = 185
    Width = 75
    Height = 25
    Caption = 'Chain'
    TabOrder = 17
    OnClick = btnChainClick
  end
  object btnInterpreter: TButton
    Left = 285
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Interpreter '
    TabOrder = 18
    OnClick = btnInterpreterClick
  end
  object btnIterator: TButton
    Left = 285
    Top = 61
    Width = 75
    Height = 25
    Caption = 'Iterator'
    TabOrder = 19
    OnClick = btnIteratorClick
  end
  object btnMediator: TButton
    Left = 285
    Top = 92
    Width = 75
    Height = 25
    Caption = 'Mediator '
    TabOrder = 20
    OnClick = btnMediatorClick
  end
  object btnMemento: TButton
    Left = 285
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Memento'
    TabOrder = 21
    OnClick = btnMementoClick
  end
  object btnVisitor: TButton
    Left = 285
    Top = 154
    Width = 75
    Height = 25
    Caption = 'Visitor'
    TabOrder = 22
    OnClick = btnVisitorClick
  end
  object btnFechar: TButton
    Left = 285
    Top = 185
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 23
    OnClick = btnFecharClick
  end
end
