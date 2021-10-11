unit txp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry, ShellApi;

type
  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  select: boolean=true;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 Rg: TRegistry;
begin
 Rg:=TRegistry.Create;
 Rg.RootKey:=HKEY_CURRENT_USER;
 Rg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\System', true);
 // �������� ������
 if CheckBox3.Checked=true
 then Rg.WriteInteger('NoDispCPL', 0) // ��������
 else Rg.WriteInteger('NoDispCPL', 1); // ���������
 // �������������� �������
 if CheckBox4.Checked=true
 then Rg.WriteInteger('DisableRegistryTools', 0) // ��������
 else Rg.WriteInteger('DisableRegistryTools', 1); // ���������
 // ������� ����
 if CheckBox7.Checked=true
 then Rg.WriteInteger('NoDispBackgroundPage', 0) // ��������
 else Rg.WriteInteger('NoDispBackgroundPage', 1); // ���������
 // ������� ���� � ����������
 if CheckBox9.Checked=true
 then Rg.WriteInteger('NoDispAppearancePage', 0) // ��������
 else Rg.WriteInteger('NoDispAppearancePage', 1); // ���������
 // ������� ���������
 if CheckBox10.Checked=true
 then Rg.WriteInteger('NoDispSettingsPage', 0) // ��������
 else Rg.WriteInteger('NoDispSettingsPage', 1); // ���������
 // ������� ��������
 if CheckBox11.Checked=true
 then Rg.WriteInteger('NoDispScrSavPage', 0) // ��������
 else Rg.WriteInteger('NoDispScrSavPage', 1); // ���������
 //
 Rg.CloseKey;
 ///////////////////////////////////////////////////////////
 Rg.OpenKey('\Software\Policies\Microsoft\Windows\System', true);
 // ��������� ������
 if CheckBox5.Checked=true
 then Rg.WriteInteger('DisableCMD', 0) // ��������
 else Rg.WriteInteger('DisableCMD', 1); // ���������
 //
 Rg.CloseKey;
 ///////////////////////////////////////////////////////////
 Rg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Uninstall', true);
 // ��������/������� ���������
 if CheckBox6.Checked=true
 then Rg.WriteInteger('NoAddRemovePrograms', 0) // ��������
 else Rg.WriteInteger('NoAddRemovePrograms', 1); // ���������
 //
 Rg.CloseKey;
 ///////////////////////////////////////////////////////////
 Rg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer', true);
 // ������ ����������, ������� �����������, �������� � ����� �� ���� ���������
 if CheckBox12.Checked=true
 then Rg.WriteInteger('NoSetFolders', 0) // ��������
 else Rg.WriteInteger('NoSetFolders', 1); // ���������
 // �������� ������ � �������� ����� � ������ �� ��������� ����������� ����
 if CheckBox8.Checked=true
 then Rg.WriteInteger('NoDesktop', 0) // ��������
 else Rg.WriteInteger('NoDesktop', 1); // ���������
 // ���������
 if CheckBox1.Checked=true
 then Rg.WriteInteger('NoRun', 0) // ��������
 else Rg.WriteInteger('NoRun', 1); // ���������
 // �����
 if CheckBox2.Checked=true
 then Rg.WriteInteger('NoFind', 0) // ��������
 else Rg.WriteInteger('NoFind', 1); // ���������
 //
 Rg.CloseKey;
 //
 Rg.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 s: string;
 i: integer;
 Rg: TRegistry;
begin
 i:=0;
 Rg:=TRegistry.Create;
 Rg.RootKey:=HKEY_CURRENT_USER;
 Rg.OpenKeyReadOnly('\Software\Microsoft\Windows\CurrentVersion\Policies\System');
 // �������� ������
 if Rg.ValueExists('NoDispCPL')
 then i:=Rg.ReadInteger('NoDispCPL');
 if i=0
 then CheckBox3.Checked:=true
 else CheckBox3.Checked:=false;
 // �������������� �������
 if Rg.ValueExists('DisableRegistryTools')
 then i:=Rg.ReadInteger('DisableRegistryTools');
 if i=0
 then CheckBox4.Checked:=true
 else CheckBox4.Checked:=false;
 // ������� ����
 if Rg.ValueExists('NoDispBackgroundPage')
 then i:=Rg.ReadInteger('NoDispBackgroundPage');
 if i=0
 then CheckBox7.Checked:=true
 else CheckBox7.Checked:=false;
 // ������� ���� � ����������
 if Rg.ValueExists('NoDispAppearancePage')
 then i:=Rg.ReadInteger('NoDispAppearancePage');
 if i=0
 then CheckBox9.Checked:=true
 else CheckBox9.Checked:=false;
 // ������� ���������
 if Rg.ValueExists('NoDispSettingsPage')
 then i:=Rg.ReadInteger('NoDispSettingsPage');
 if i=0
 then CheckBox10.Checked:=true
 else CheckBox10.Checked:=false;
 // ������� ��������
 if Rg.ValueExists('NoDispScrSavPage')
 then i:=Rg.ReadInteger('NoDispScrSavPage');
 if i=0
 then CheckBox11.Checked:=true
 else CheckBox11.Checked:=false;
 //
 Rg.CloseKey;
 ////////////////////////////////////////////////////
 Rg.OpenKeyReadOnly('\Software\Policies\Microsoft\Windows\System');
 // ��������� ������
 if Rg.ValueExists('DisableCMD')
 then i:=Rg.ReadInteger('DisableCMD');
 if i=0
 then CheckBox5.Checked:=true
 else CheckBox5.Checked:=false;
 Rg.CloseKey;
 ////////////////////////////////////////////////////
 Rg.OpenKeyReadOnly('\Software\Microsoft\Windows\CurrentVersion\Policies\Uninstall');
 // ��������/������� ���������
 if Rg.ValueExists('NoAddRemovePrograms')
 then i:=Rg.ReadInteger('NoAddRemovePrograms');
 if i=0
 then CheckBox6.Checked:=true
 else CheckBox6.Checked:=false;
 Rg.CloseKey;
 ////////////////////////////////////////////////////
 Rg.OpenKeyReadOnly('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer');
 // ������ ����������, ������� �����������, �������� � ����� �� ���� ���������
 if Rg.ValueExists('NoSetFolders')
 then i:=Rg.ReadInteger('NoSetFolders');
 if i=0
 then CheckBox12.Checked:=true
 else CheckBox12.Checked:=false;
 // �������� ������ � �������� ����� � ������ �� ��������� ����������� ����
 if Rg.ValueExists('NoDesktop')
 then i:=Rg.ReadInteger('NoDesktop');
 if i=0
 then CheckBox8.Checked:=true
 else CheckBox8.Checked:=false;
 // ���������
 if Rg.ValueExists('NoRun')
 then i:=Rg.ReadInteger('NoRun');
 if i=0
 then CheckBox1.Checked:=true
 else CheckBox1.Checked:=false;
 // �����
 if Rg.ValueExists('NoFind')
 then i:=Rg.ReadInteger('NoFind');
 if i=0
 then CheckBox2.Checked:=true
 else CheckBox2.Checked:=false;
 Rg.CloseKey;
 //
 Rg.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 if select=true
 then
  begin
   CheckBox1.Checked:=true;
   CheckBox2.Checked:=true;
   CheckBox3.Checked:=true;
   CheckBox4.Checked:=true;
   CheckBox5.Checked:=true;
   CheckBox6.Checked:=true;
   CheckBox7.Checked:=true;
   CheckBox8.Checked:=true;
   CheckBox9.Checked:=true;
   CheckBox10.Checked:=true;
   CheckBox11.Checked:=true;
   CheckBox12.Checked:=true;
   select:=false;
   Button3.Caption:='Deselect All';
  end
 else
  begin
   CheckBox1.Checked:=false;
   CheckBox2.Checked:=false;
   CheckBox3.Checked:=false;
   CheckBox4.Checked:=false;
   CheckBox5.Checked:=false;
   CheckBox6.Checked:=false;
   CheckBox7.Checked:=false;
   CheckBox8.Checked:=false;
   CheckBox9.Checked:=false;
   CheckBox10.Checked:=false;
   CheckBox11.Checked:=false;
   CheckBox12.Checked:=false;
   select:=true;
   Button3.Caption:='Select All';   
  end;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
 ShellExecute(0,'open',PChar(ExtractFilePath(Application.ExeName)+'\commands'),'','',SW_SHOW);
end;

end.
