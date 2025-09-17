unit AboutWindow;

interface

uses
  Winapi.Windows, Winapi.ShellAPI,
  System.SysUtils, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Dialogs, Vcl.Clipbrd;

type
  TFrmAbout = class(TForm)
  private
    LblLink: TLabel;
    procedure LinkClick(Sender: TObject);
    procedure CopyClick(Sender: TObject);
    class function GetFileVersion: string; static;
    class function GetBuildDate: string; static;
  public
    class procedure Execute(const Author, LinkURL: string);
  end;

implementation


class function TFrmAbout.GetFileVersion: string;
var
  Size, Handle: DWORD;
  Buffer: TBytes;
  Fixed: PVSFixedFileInfo;
  Len: UINT;
begin
  Result := '0.0.0.0';
  Size := GetFileVersionInfoSize(PChar(ParamStr(0)), Handle);
  if Size = 0 then Exit;
  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(ParamStr(0)), Handle, Size, Buffer) then Exit;
  if VerQueryValue(Buffer, '\', Pointer(Fixed), Len) and (Len >= SizeOf(TVSFixedFileInfo)) then
    Result := Format('%d.%d.%d.%d',
      [HiWord(Fixed.dwFileVersionMS), LoWord(Fixed.dwFileVersionMS),
       HiWord(Fixed.dwFileVersionLS), LoWord(Fixed.dwFileVersionLS)]);
end;

class function TFrmAbout.GetBuildDate: string;
var
  FT: TDateTime;
begin
  if FileAge(ParamStr(0), FT) then
    Result := FormatDateTime('dd.mm.yyyy, hh:nn', FT)
  else
    Result := '-';
end;

procedure TFrmAbout.LinkClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(LblLink.Hint), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmAbout.CopyClick(Sender: TObject);
var
  S: string;
begin
  S :=
    'App:    ' + Caption + sLineBreak +
    'Version:' + #9 + GetFileVersion + sLineBreak +
    'Build:  ' + #9 + GetBuildDate + sLineBreak +
    (Sender as TButton).Hint; // hier legen wir gleich „Autor: … | Link: …“ ab
  Clipboard.AsText := S;
  MessageDlg('Infos in die Zwischenablage kopiert.', mtInformation, [mbOK], 0);
end;

class procedure TFrmAbout.Execute(const Author, LinkURL: string);
var
  F: TFrmAbout;
  PanelTop, PanelBottom: TPanel;
  Img: TImage;
  LblApp, LblVer, LblBuild, LblAuthor: TLabel;
  BtnOK, BtnCopy: TButton;
begin
  F := TFrmAbout.CreateNew(nil);       // <<— wichtig: CreateNew statt Create
  try
    // Basis
    F.BorderStyle := bsDialog;
    F.Position := poScreenCenter;
    F.Caption := Application.Title;
    if F.Caption = '' then
      F.Caption := ChangeFileExt(ExtractFileName(ParamStr(0)), '');
    F.ClientWidth := 480;
    F.ClientHeight := 180;

    // Panels
    PanelTop := TPanel.Create(F);
    PanelTop.Parent := F;
    PanelTop.Align := alTop;
    PanelTop.Height := 110;
    PanelTop.BevelOuter := bvNone;

    PanelBottom := TPanel.Create(F);
    PanelBottom.Parent := F;
    PanelBottom.Align := alBottom;
    PanelBottom.Height := 50;
    PanelBottom.BevelOuter := bvNone;

    // Icon
    Img := TImage.Create(F);
    Img.Parent := PanelTop;
    Img.Align := alLeft;
    Img.Width := 72;
    Img.Picture.Icon := Application.Icon;

    // Labels
    LblApp := TLabel.Create(F);
    LblApp.Parent := PanelTop;
    LblApp.Left := 88; LblApp.Top := 8;
    LblApp.Font.Style := [fsBold];
    LblApp.Font.Size := 11;
    LblApp.Caption := F.Caption;

    LblVer := TLabel.Create(F);
    LblVer.Parent := PanelTop;
    LblVer.Left := 88; LblVer.Top := 32;
    LblVer.Caption := 'Version: ' + GetFileVersion;

    LblBuild := TLabel.Create(F);
    LblBuild.Parent := PanelTop;
    LblBuild.Left := 88; LblBuild.Top := 52;
    LblBuild.Caption := 'Build:   ' + GetBuildDate;

    LblAuthor := TLabel.Create(F);
    LblAuthor.Parent := PanelTop;
    LblAuthor.Left := 88; LblAuthor.Top := 72;
    LblAuthor.Caption := 'Autor:   ' + Author;

    F.LblLink := TLabel.Create(F);
    F.LblLink.Parent := PanelTop;
    F.LblLink.Left := 88; F.LblLink.Top := 92;
    F.LblLink.Font.Color := clBlue;
    F.LblLink.Font.Style := [fsUnderline];
    F.LblLink.Cursor := crHandPoint;
    F.LblLink.Caption := 'Projektseite';
    F.LblLink.Hint := LinkURL;
    F.LblLink.ShowHint := True;
    F.LblLink.OnClick := F.LinkClick;

    // Buttons
    BtnOK := TButton.Create(F);
    BtnOK.Parent := PanelBottom;
    BtnOK.Caption := 'OK';
    BtnOK.ModalResult := mrOK;
    BtnOK.Top := 10; BtnOK.Left := F.ClientWidth - 90;

    BtnCopy := TButton.Create(F);
    BtnCopy.Parent := PanelBottom;
    BtnCopy.Caption := 'Kopieren';
    BtnCopy.Top := 10; BtnCopy.Left := BtnOK.Left - 100;
    BtnCopy.Hint := 'Autor: ' + Author + ' | Link: ' + LinkURL;
    BtnCopy.OnClick := F.CopyClick;

    F.ShowModal;
  finally
    F.Free;
  end;
end;

end.

