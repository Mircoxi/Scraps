#include "buttons.iss"

#define MyAppName "Scraps"
#define MyAppVersion "3.7.4.0"
#define MyAppPublisher "Caprine Logic"
#define MyAppExeName "Scraps.exe"
#define PluginsPath "{userdocs}\" + MyAppPublisher + "\" + MyAppName + "\Plugins"

[Setup]
AppId={{D3BD46E5-E1AF-41DA-92A3-4443B418294C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL=https://github.com/depthbomb
AppSupportURL=https://github.com/depthbomb/Scraps
AppUpdatesURL=https://github.com/depthbomb/Scraps/releases
AppCopyright=Copyright (C) 2021 Caprine Logic
VersionInfoVersion={#MyAppVersion}
DefaultDirName={autopf}\{#MyAppPublisher}\{#MyAppName}
DisableDirPage=yes
DisableProgramGroupPage=yes
AllowNoIcons=yes
LicenseFile=.\license.txt
OutputDir=..\Scraps\bin\Publish
OutputBaseFilename=scraps_setup
SetupIconFile=..\Scraps\Scraps.ico
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=classic
ArchitecturesAllowed=x64
UninstallDisplayIcon={app}\{#MyAppExeName}
UninstallDisplayName=Scraps - Scrap.TF Raffle Bot

[Code]
function FromUpdate: Boolean;
begin
	Result := ExpandConstant('{param:update|no}') = 'yes'
end;

function FromNormal: Boolean;
begin
	Result := FromUpdate = False
end;

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Types]
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom installation";  Flags: iscustom

[Components]
Name: "scraps"; Description: "Scraps"; Types: full compact custom; Flags: fixed
Name: "scraps\docs"; Description: "Document links"; Types: full
Name: "scraps\plugin1"; Description: "ApiServer plugin"; Types: full
Name: "scraps\plugin2"; Description: "CommentOnRaffles plugin"; Types: full
Name: "scraps\plugin3"; Description: "VoteInPolls plugin"; Types: full

[Files]
Source: "..\Scraps\bin\Publish\win-x64\Scraps.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: scraps
Source: ".\license.txt"; DestDir: "{app}"; Flags: ignoreversion; Components: scraps
Source: "..\Scraps.Plugins.ApiServer\bin\Release\net5.0-windows10.0.17763.0\Scraps.Plugins.ApiServer.dll"; DestDir: "{#PluginsPath}"; Flags: ignoreversion; Components: scraps\plugin1
Source: "..\Scraps.Plugins.CommentOnRaffles\bin\Release\net5.0-windows10.0.17763.0\Scraps.Plugins.CommentOnRaffles.dll"; DestDir: "{#PluginsPath}"; Flags: ignoreversion; Components: scraps\plugin2
Source: "..\Scraps.Plugins.VoteInPolls\bin\Release\net5.0-windows10.0.17763.0\Scraps.Plugins.VoteInPolls.dll"; DestDir: "{#PluginsPath}"; Flags: ignoreversion; Components: scraps\plugin3

[INI]
Filename: "{app}\Instructions.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://bit.ly/scraps-instructions"; Components: scraps\docs
Filename: "{app}\Changelog.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://bit.ly/scraps-changelog"; Components: scraps\docs 
Filename: "{app}\Source Code.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://bit.ly/scraps-repo"; Components: scraps\docs 

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\Instructions.url"; Description: "View instructions"; Flags: nowait postinstall skipifsilent shellexec unchecked
Filename: "{app}\Changelog.url"; Description: "View changelog"; Flags: nowait postinstall skipifsilent shellexec unchecked
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent; Check: FromUpdate
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent unchecked; Check: FromNormal

[UninstallDelete]
Type: files; Name: "{app}\Instructions.url"
Type: files; Name: "{app}\Changelog.url"
Type: files; Name: "{app}\Source Code.url"
Type: dirifempty; Name: "{app}"