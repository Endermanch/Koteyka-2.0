object ResetTimerForm: TResetTimerForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Reset the timer!'
  ClientHeight = 150
  ClientWidth = 325
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ResetLabel: TLabel
    Left = 73
    Top = 8
    Width = 179
    Height = 29
    Caption = 'Reset the timer!'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ResetStatement: TLabel
    Left = 15
    Top = 43
    Width = 295
    Height = 14
    Caption = 'REMEMBER: You can reset the timer ONLY ONE time!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel: TPanel
    Left = 8
    Top = 72
    Width = 309
    Height = 70
    BevelInner = bvRaised
    BevelKind = bkSoft
    TabOrder = 0
    object TriesCounter: TLabel
      Left = 248
      Top = 48
      Width = 6
      Height = 13
      Caption = '3'
    end
    object TriesCounterLabel: TLabel
      Left = 259
      Top = 48
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'tries left'
    end
    object One: TLabel
      Left = 258
      Top = 48
      Width = 6
      Height = 13
      Caption = '1'
      Visible = False
    end
    object LabeledEdit: TLabeledEdit
      Left = 5
      Top = 21
      Width = 292
      Height = 21
      EditLabel.Width = 99
      EditLabel.Height = 13
      EditLabel.Caption = 'The code goes here:'
      MaxLength = 4
      NumbersOnly = True
      PasswordChar = '*'
      TabOrder = 0
      OnKeyPress = LabeledEditKeyPress
    end
  end
  object ResetTimerProcess: TTimer
    Enabled = False
    Interval = 50
    OnTimer = ResetTimerProcessTimer
    Left = 280
    Top = 65528
  end
end
