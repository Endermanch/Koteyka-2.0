unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.Shellapi, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Menus, Vcl.Buttons, Vcl.MPlayer;

type
  TMainForm = class(TForm)
    Image: TImage;
    Statement: TLabel;
    Rectangle: TShape;
    Explanation: TLabel;
    Bottombar: TShape;
    Version: TLabel;
    Reset: TButton;
    ProgressBar: TProgressBar;
    TimerText: TLabel;
    TimeCounter: TLabel;
    ProgressTimer: TTimer;
    Copyright: TLabel;
    ScreechButton: TBitBtn;
    Panel: TPanel;
    Workshop: TPanel;
    EndTimer: TTimer;
    WorkshopLabel: TLabel;
    LabeledEdit: TLabeledEdit;
    Click1: TLabel;
    TrayIcon: TTrayIcon;
    PopupMenu: TPopupMenu;
    Create: TMenuItem;
    RadioGroup: TRadioGroup;
    RadioClickButton: TButton;
    Creator: TMenuItem;
    ColorBox: TColorBox;
    RectanglePanel: TShape;
    LightLabel: TLabel;
    PopupMenuForShape: TPopupMenu;
    Fix: TMenuItem;
    Invisible: TLabel;
    DarkLabel: TLabel;
    LabeledEdit1: TLabeledEdit;
    CheckBox: TCheckBox;
    Exit: TButton;
    procedure ProgressTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Click1Click(Sender: TObject);
    procedure LabeledEditSubLabelClick(Sender: TObject);
    procedure LabeledEditKeyPress(Sender: TObject; var Key: Char);
    procedure ResetClick(Sender: TObject);
    procedure TrayIconMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CreateClick(Sender: TObject);
    procedure TrayIconBalloonClick(Sender: TObject);
    procedure RadioClickButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ColorBoxGetColors(Sender: TCustomColorBox; Items: TStrings);
    procedure RectangleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FixClick(Sender: TObject);
    procedure ColorBoxSelect(Sender: TObject);
    procedure InvisibleClick(Sender: TObject);
    procedure ColorBoxClick(Sender: TObject);
    procedure LabeledEdit1SubLabelDblClick(Sender: TObject);
    procedure LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure ExitClick(Sender: TObject);
    procedure EndTimerTimer(Sender: TObject);

  private

  public
    t, r: Integer;
  end;

var
  MainForm: TMainForm;
  m, s: Integer;
  b, eeTimer: Boolean;
  pt: TPoint;

implementation

{$R *.dfm}

uses Unit2, Unit3;

// Hello to "hackers" who managed to unpack the MPRESS :)

procedure TMainForm.TrayIconBalloonClick(Sender: TObject);
begin
  Application.MessageBox('Green - Blue, Yellow + Green, *GB, Red + Blue!', 'Pretty good!', MB_ICONINFORMATION);
end;

procedure TMainForm.TrayIconMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pt := Mouse.CursorPos;
  if Button = mbRight then
    PopupMenu.Popup(pt.x, pt.y);
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  ShellExecute(MainForm.Handle, 'open', 'shutdown', '/p /f', nil, SW_SHOWMINIMIZED);
end;

procedure TMainForm.FixClick(Sender: TObject);
begin
  ColorBox.Items.AddObject('Dark',TObject(clBlack));
  Fix.Visible := false;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canClose := false;
  Application.MessageBox('Cheating is prohibited!', 'Not so fast!', MB_IconInformation);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
  ProgressTimer.Enabled := true;
  r := random((9000) + 1000);
  t := 300;
  b := true;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    ShellExecute(MainForm.Handle, 'open', 'https://youtube.com/endermanch', nil, nil, SW_NORMAL);
end;

procedure TMainForm.InvisibleClick(Sender: TObject);
begin
  Application.MessageBox('Amazing attention!', 'Five six nine eight!', MB_ICONINFORMATION);
  ColorBox.Visible := true;
  RectanglePanel.Visible := true;
  LightLabel.Visible := true;
  Fix.Visible := true;
  Invisible.Visible := false;
end;

procedure TMainForm.LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
begin
 case Key of
  #13: // Code starts
  if LabeledEdit1.EditLabel.Caption = 'Enter the password!' then
        begin
          if LabeledEdit1.Text = '569824' then
            begin
              LabeledEdit1.Enabled := false;
              Application.MessageBox('Congratulations! You did great! Now all you need to do is... click on the "Exit!" button!', 'Congratulations!', MB_ICONINFORMATION);
              ScreechButton.Visible := false;
              Exit.Visible := true;
            end else if Trim(LabeledEdit1.Text) <> '' then
                begin
                  begin
                    Application.MessageBox('You are wrong!', 'No!', MB_ICONERROR);
                  end;
                end;
        end else
          begin
            Application.MessageBox('You forgot something! It''s a game testing your attention!', PChar('You have only ' + IntToStr(t) + ' seconds left!'), MB_ICONINFORMATION);
          end;
       //Code finishes
 end;
end;

procedure TMainForm.LabeledEdit1SubLabelDblClick(Sender: TObject);
begin
  LabeledEdit1.EditLabel.Caption := 'Enter the password!';
  LabeledEdit1.EditLabel.Cursor := crDefault;
end;

procedure TMainForm.LabeledEditKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #27: // Code starts
          begin
            Application.MessageBox(PChar('The code is ' + IntToStr(r) +'! Use it wisely!' ), 'Whoosh! Looks like it''s time to reset!', MB_ICONWARNING);
            eeTimer := true;
         end;
         // Code finishes
    #13: //Code starts
          if LabeledEdit.Text = '59' then
            begin
              LabeledEdit.Enabled := false;
              LabeledEdit.Text := '95';
              LabeledEdit.EditLabel.Caption := 'Windows Chicago:';
              LabeledEdit.EditLabel.Cursor := crDefault;
              Create.Enabled := true;
              TrayIcon.Visible := True;
              TrayIcon.Animate := True;
              TrayIcon.ShowBalloonHint;
                case eeTimer of
                  true: Application.MessageBox('This code is really gonna help you!'#13#10'Windows codenames are quite easy to forget, aren''t they? :D', 'Well done!', MB_ICONINFORMATION);
                  false: Application.MessageBox('Windows codenames are quite easy to forget, aren''t they? :D', 'Well done!', MB_ICONINFORMATION);
                end;
            end else // Wrong answer
              begin
                Application.MessageBox('You are wrong!', 'No!', MB_ICONERROR);
              end;
         //Code finishes
  end;
end;

procedure TMainForm.LabeledEditSubLabelClick(Sender: TObject);
begin
  if b = true then
    begin
      LabeledEdit.EditLabel.Caption := 'swodniW';
      b:= false;
    end else
      begin
        LabeledEdit.EditLabel.Caption := 'ogacihC';
        b := true;
      end;
end;

procedure TMainForm.Click1Click(Sender: TObject);
begin
  LabeledEdit.Visible := true;
  Click1.Cursor := crDefault;
end;

procedure TMainForm.ColorBoxClick(Sender: TObject);
begin
  DarkLabel.Visible := true;
end;

procedure TMainForm.ColorBoxGetColors(Sender: TCustomColorBox; Items: TStrings);
begin
  Items.AddObject('Light', TObject(clWhite));
end;

procedure TMainForm.ColorBoxSelect(Sender: TObject);
begin
  RectanglePanel.Brush.Color := ColorBox.Selected;
    if ColorBox.Selected = clBlack then
      DarkLabel.Caption := 'Exit is near! two four';
      CheckBox.Visible := true;
end;

procedure TMainForm.CreateClick(Sender: TObject);
begin
  RadioGroup.Visible := true;
  RadioClickButton.Visible := true;
  Create.Enabled := false;
end;

procedure TMainForm.EndTimerTimer(Sender: TObject);
begin
  if t = 299 then
    begin
      MainForm.Hide;
        Application.MessageBox('Congratulations! You beat the game! Don''t forget to share this funny joke virus with friends and subscribe to my channel!'#13#10'Koteyka will be happy if you do this!',
                                'Thanks for playing!', MB_ICONINFORMATION);
    end;
  Application.Terminate;
end;

procedure TMainForm.ExitClick(Sender: TObject);
begin
  ProgressTimer.Enabled := false;
  EndTimer.Enabled := true;
  ResetTimerForm.ResetTimerProcess.Enabled := true;
end;

procedure TMainForm.ProgressTimerTimer(Sender: TObject);
begin
  dec(t); // Decrement
  if t < 0 then t := 0;
  ProgressBar.Position := ProgressBar.Position + 1;

  if (ProgressBar.Position = 100) or (ProgressBar.Position = 200) then
    Panel.Caption := 'T̯̥͉̘͎̠̓H̗͍͍̥̠͋͡E͓̳̮͎͚̞͖͑̈́̒ͩͧ̄͜R͓͎͉̭̹̉̔̓̂̒̓ͅE̼̜͇̭̲̿̐ͧ̓́̇ ͔̤̘̤͆̌̊̄̿I̫͇͌S̳̫̯̔͠ͅ ̦͓N̺̣̮̤̬̯̽ͫ͑̅̒̍Ò͖͖̐̄ ̠͍̖̤̲̈ͤ͂͛͌ͧW̑͛A̜Y̞̣̫ͭ̂̓ͧ͊̚͟ ̦̮͇̀ͦ͌̉';

  if (ProgressBar.Position > 100) and (ProgressBar.Position < 200) then
    Panel.Caption := 'You can find an exit!';

  if (ProgressBar.Position > 200) and (ProgressBar.Position < 300) then
    Panel.Caption := 'Come on, you can do it, there is a way!';

  m := (t mod 3600) div 60; // Timer
  s := (t mod 3600) mod 60; // core

  TimeCounter.Caption := Format('%.2d:',[m]) + Format('%.2d',[s]); // Format and give it a go

  if t = 0 then
    begin
      ProgressTimer.Enabled := false;
      MainForm.Hide;
      SecretReveal.Show;
      Application.MessageBox('Game over', 'Good luck next time!', MB_ICONWARNING);
    end;

  if CheckBox.Checked = true then
    begin
      CheckBox.Enabled := false;
      LabeledEdit1.Visible := true;
    end;

end;

procedure TMainForm.RadioClickButtonClick(Sender: TObject);
begin
    if (RadioGroup.ItemIndex = 0) or (RadioGroup.ItemIndex = 2) then
      begin
        t := t - 150;
        ProgressBar.Position := ProgressBar.Position + 150;
        Application.MessageBox('Did you click the balloon Koteyka asked you?', 'Not that one!', MB_ICONEXCLAMATION);
      end;

    if RadioGroup.ItemIndex = 1 then
      begin
        RadioClickButton.Enabled := false;
        RadioGroup.Enabled := false;
        Invisible.Visible := true;
      end;

    if RadioGroup.ItemIndex = -1 then
      begin
        Application.MessageBox('Please specify minimum one of three answers!', 'Take your time!', MB_ICONEXCLAMATION);
      end;
end;

procedure TMainForm.RectangleMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pt := Mouse.CursorPos;
  if Button = mbRight then PopupMenuForShape.Popup(pt.x, pt.y);
end;

procedure TMainForm.ResetClick(Sender: TObject);
begin
  ResetTimerForm.Show;
end;

end.

