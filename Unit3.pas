unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TResetTimerForm = class(TForm)
    ResetLabel: TLabel;
    ResetStatement: TLabel;
    Panel: TPanel;
    LabeledEdit: TLabeledEdit;
    TriesCounter: TLabel;
    TriesCounterLabel: TLabel;
    ResetTimerProcess: TTimer;
    One: TLabel;
    procedure LabeledEditKeyPress(Sender: TObject; var Key: Char);
    procedure ResetTimerProcessTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ResetTimerForm: TResetTimerForm;
  i: Integer;

implementation

{$R *.dfm}

uses Unit1;

procedure TResetTimerForm.FormCreate(Sender: TObject);
begin
  i := 3;
end;

procedure TResetTimerForm.LabeledEditKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: // Code starts
          begin
            if LabeledEdit.Text = '' then
              begin
                Application.MessageBox('This field has to be filled!', 'Oops!', MB_ICONWARNING);
              end;

            if LabeledEdit.Text = IntToStr(MainForm.r) then
              begin
                MainForm.Reset.Enabled := false;
                ResetTimerProcess.Enabled := true;
                Application.MessageBox('The timer has been resetted!', 'Success!', MB_ICONINFORMATION);
              end else if Trim(LabeledEdit.Text) <> '' then
                begin
                  begin
                    dec(i);
                    TriesCounter.Caption := IntToStr(i);
                      if i = 1 then
                        begin
                          TriesCounterLabel.Caption := 'try left';
                          TriesCounter.Visible := false;
                          One.Visible := true;
                        end;

                      if i > 0 then Application.MessageBox(PChar('Why are you trying to guess the code? Now you have only ' +
                              IntToStr(i) + ' tries (try) left!'), 'Don''t try to guess the code!', MB_ICONERROR);

                  end;
            end;

              if i = 0 then
                begin
                  Application.MessageBox('Great job! Now you''ve just successfully lost your ability to reset the timer! Be more clever next time :/', 'Great job!', MB_ICONINFORMATION);
                  MainForm.Reset.Enabled := false;
                  ResetTimerForm.Close;
                end;
          end;
       // Code finishes

    #27: ResetTimerForm.Close;
  end;

end;

procedure TResetTimerForm.ResetTimerProcessTimer(Sender: TObject);
begin
  MainForm.ProgressTimer.Enabled := false;
  inc(MainForm.t);
  MainForm.ProgressBar.Position := MainForm.ProgressBar.Position - 1;
    if (MainForm.t = 300) and (MainForm.ProgressBar.Position = 0) then
      begin
        MainForm.ProgressTimer.Enabled := true;
        ResetTimerForm.Hide;
        ResetTimerProcess.Enabled := false;
      end;

end;

end.

