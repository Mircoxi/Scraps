[Code]
procedure DonateButtonOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExecAsOriginalUser('open', 'https://www.patreon.com/depthbomb', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure CreateCustomButton(ParentForm: TSetupForm; CancelButton: TNewButton);
var
  DonateButton: TNewButton;
begin
  DonateButton := TNewButton.Create(ParentForm);
  DonateButton.Left := ParentForm.ClientWidth - CancelButton.Left - CancelButton.Width;
  DonateButton.Top := CancelButton.Top;
  DonateButton.Width := CancelButton.Width*2;
  DonateButton.Height := CancelButton.Height;
  DonateButton.Caption := 'Support me on Patreon';
  DonateButton.OnClick := @DonateButtonOnClick;
  DonateButton.Parent := ParentForm;
end;

procedure InitializeWizard();
begin
  CreateCustomButton(WizardForm, WizardForm.CancelButton);
end;