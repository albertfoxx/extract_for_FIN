@echo off
REM �������� �ணࠬ��. ����� � ��� ५���
title Extract v4.2.*(2022.05.22) - ��⮬���᪨� ᡮ�騪 �⥭�� ���-�������
REM author : albafoxx (abzaev.albert@gmail.com)

REM ����뢠�� ����஢��. ����室��� ��� ���������, ��� ��-㬮�砭�� �ᯮ������ ��㣠� ����஢��
chcp 866
echo.

REM ���������� ����������� ����������/����
Set "SYS=���-�������"
Set "ini=_extract_fin.ini"

Set "infile_1=StartServer.bat"
Set "infile_2=xml.properties"
Set "infile_3=Azk2Clnt.ini"
Set "infile_4=Azk2Server.properties"
Set "infile_5=web.properties"
Set "infile_6=start.bat"
Set "infile_7=server.xml"

Set "SP_PORT=2001"
Set "RMI_PORT=2099"
Set "fb_old=3050:D:/_DBase/balagan/R_MK.FDB"
Set "ora_old=F_IRKOBL_190327"
Set "Jram_old=1024m"
Set "Server_old=8005"
Set "Connector_old=8080"

REM ��᪫��뢠�� ���� �� ��⠢�� (����, �����, ���):
set daDD=%DATE:~0,2%
set daMM=%DATE:~3,2%
set daYY=%DATE:~-2%
REM � ��६����� �६��� �����塞 �஡�� (����� �⠢����� ��� �᫠ �ᮢ � ����� ������) ���:
set datime=%time: =0%
REM ��᪫��뢠�� �६� �� ��⠢�� (���, ������, ᥪ㭤�):
set daho=%datime:~0,2%
set dami=%datime:~3,2%
set dass=%datime:~6,2%
REM �����뢠�� ࠧ������� ��⠢�� � ����室���� �ଥ:
set daDATE="%daDD%/%daMM%/%daYY% %daho%:%dami%:%dass%"

REM ========== ����������� XML-�����, � ������� ������ "ACTION" ==========
REM �㦭� �㤥� ��७��� �� � ���� ᯨ᮪ ini 䠩�� � ᤥ���� 㭨���ᠫ�� ���
Set "operkind=operkind.xml"
Set "unidoctype=unidoctype.xml"
Set "serverprocessor=serverprocessor.xml"
Set "reportprocessor=reportprocessor.xml"

REM �뭮ᨬ � ��砫� �ਯ�, ⠪ ��� � 4 �㭪� �஢�ન ����� �㤥� ��������
set question="�த������ �믮������? [y/n]: "
REM ������ ���祭�� "��-㬮�砭��"
set answer2=0

REM ������ ���祭�� "��-㬮�砭��" ��� �஢�ન �ᯥ譮�� �����襭�� ᡮન � ����� � ���
set success=0

REM ����������� ����������/���� �� ����� ��������
SetLocal ENABLEDELAYEDEXPANSION
set /a c=0
for /f "UseBackQ Delims=" %%A IN (%ini%) do (
  set /a c+=1
  If !c!==1  set "in=%%A"			rem 1. ��४��� ��㤠 ��६ 䠩�
  If !c!==2  set "out=%%A"			rem 2. ��४��� ��� ᮡ�ࠥ� �⥭�
  If !c!==3  set "EIS=%%A"			rem 3. ��४��� EIS
  If !c!==4  set "REPORT=%%A"		rem 4. ��४��� ������
  If !c!==5  set "SOFIT=%%A"		rem 5. ��४��� �����
  If !c!==6  set "DelphiXE=%%A"		rem 6. ��४��� Delphi_XE4_Runtime_BPLs_
  If !c!==7  set "schplanstop=%%A"	rem 7. ��४��� � �������⥫�묨 䠩���� ��� ᡮન
  If !c!==8  set "azka=%%A"			rem 8. ��४��� � �������⥫�묨 䠩���� ��� ᡮન
  If !c!==9  set "tomcat=%%A"		rem 9. ��४��� ��������
  If !c!==10 set "renSP=%%A"		rem 10. ���� ��
  If !c!==11 set "renRMI=%%A"		rem 11. ���� ������
  If !c!==12 set "winRar=%%A"		rem 12. ��४��� �� ��娢���
  If !c!==13 set "fbNew=%%A"		rem 13. ���� �� �� Firebird
  If !c!==14 set "oraNew=%%A"		rem 14. ���� �� �� Oracle
  If !c!==15 set "javaNew=%%A"		rem 15. ������ Java-�����
  If !c!==16 set "ServerNew=%%A"		rem 16. ���� �� ���஬ ����᪠���� ���-�ࢥ�
  If !c!==17 set "ConnectorNew=%%A"		rem 17. ���� �� ���஬� �㤥� ���뢠���� �ਫ������
)

REM ������������� ���� ��� ������ � �������
SetLocal DISABLEDELAYEDEXPANSION
echo ��४�ਨ:
echo ��६ �⠫���� �� %in%
echo ᮡ�ࠥ� �����    %out%
echo -----------------------------------------------------------------------
echo ���      %EIS%
echo �����   %REPORT%
echo �����    %SOFIT%
echo ������   %tomcat%
echo DelphiXE %DelphiXE%
echo -----------------------------------------------------------------------
echo.

@echo �६� ᡮન: %daDATE%>extract_build.log
@echo ����ࠥ� ᡮ�� � %out%>>extract_build.log
@echo.>>extract_build.log
@echo ��६ �⠫���� �� %in%>>extract_build.log
@echo �ᯮ������ ��� %EIS%>>extract_build.log
@echo �ᯮ������ ����� %REPORT%>>extract_build.log
@echo �ᯮ������ ����� %SOFIT%>>extract_build.log
@echo �ᯮ������ ������ %tomcat%>>extract_build.log
@echo �ᯮ������ DelphiXE %DelphiXE%>>extract_build.log
@echo.>>extract_build.log

REM ========== 1.���� � ���������� (��砫�) ==========
REM 1.1.�������� �������� ����������
:check_dir
set check_stop=0
echo ������� �஢�ન 㪠������ ���祭��:
echo [��४��� %in%]
If Exist "%in%" (call :color 2
				 call :echo "- ��४��� � �⠫����� �������"
) else (call :color 4
		call :echo "- ��४��� � �⠫����� �� �������"
		set check_stop=1)
echo [��४��� %EIS%]
If Exist "%EIS%" (call :color 2
				  call :echo "- ��४��� � ��� �������"
) else (call :color 4
		call :echo "- ��४��� � ��� �� �������"
		set check_stop=1)
echo [��४��� %REPORT%]
If Exist "%REPORT%" (call :color 2
				     call :echo "- ��४��� � ���⠬� �������"
) else (call :color 4
		call :echo "- ��४��� � ���⠬� �� �������"
		set check_stop=1)
echo [��४��� %SOFIT%]
If Exist "%SOFIT%" (call :color 2
				    call :echo "- ��४��� � ��⮬ �������"
) else (call :color 4
		call :echo "- ��४��� � ��⮬ �� �������"
		set check_stop=1)
echo [��४��� %tomcat%]
If Exist "%tomcat%" (call :color 2
				     call :echo "- ��४��� � ⮬��⮬ �������"
) else (call :color 4
		call :echo "- ��४��� � ⮬��⮬ �� �������"
		set check_stop=1)
echo [��४��� %DelphiXE%]
If Exist "%DelphiXE%" (call :color 2
				       call :echo "- ��४��� � DelphiXE �������"
) else (call :color 4
		call :echo "- ��४��� � DelphiXE �� �������"
		set check_stop=1)

SetLocal ENABLEDELAYEDEXPANSION
echo.
REM ���� ���� ���� ���� ������ ����������� - ������������� ������. ������ ���������.
If %check_stop%==0 (echo �� 㪠����� ��४�ਨ �������. �த������ ᡮ�� �⥭�� %SYS% 
	goto :check_out
	) else (echo ������⭮ 㪠���� ��४�ਨ, ����室��� �஢���� ��� � ini-䠩�� [���஡���� ���]. ���ઠ �⥭�� %SYS% ��⠭������.
			set success=1
			goto :exit_bat)

REM 1.2.�������� ������� ����������, � ������� ����� ���������� ������
:check_out
If Not Exist "%out%" (
echo.
echo ��४��� "%out%" �� �������. ��� �㤥� ᮧ����.
goto :extract
) else (
	echo.
	echo ��४��� "%out%" 㦥 ᮧ����.
	goto :ask)

REM 1.3.�������� �� ���������� ������ � ����� %OUT%, ���� ��� ��� ���� (�������)
:ask
set /p ask="���⢥न� ��१����� 䠩��� � ��४�ਨ "%out%"? [y/n]: "
If %ask%==y (RD /S /Q %out%
			goto :extract
) else (If %ask%==n (
		echo ���ઠ �⥭�� %SYS% ��⠭������.
		set success=1
		goto :exit_bat
		) else (echo ������� �� �ᯮ�����. ���஡�� ��� ࠧ.
				echo.
				goto :ask))

REM 1.4.������ �� ����������� ������ ������, ���� ��������� ������ �� ������������ �����
:askexit
set /p ask=%question%
If %ask%==y (
	goto %answer%
	) else (
		If %ask%==n (
			If %answer2%==ask_start (
				goto :ask_start
				) else (
				set success=1
				goto :exit_bat)
		) else (
		echo ������� �� �ᯮ�����. ���஡�� ��� ࠧ.
		pause
		goto :askexit))
REM ========== 1.���� � ���������� (�����) ==========

REM ========== 2.����� ������� (��砫�) ==========
REM 2.1 ����� ������� ������ ��� ���������� ������� (��砫�)
:unzip_data
echo %textblock%
%winRar% x "%zipFile%" -o "%outputFile%" -r -y -ibck
If %errorlevel%==0 (Echo "- - - ������ �ᯥ譮 �����襭�. - - -"
				   @echo %textblock% �ᯥ譮>>extract_build.log
					goto :%nextPoint%) else (Echo "- - - �������� �஡���� �� �믮������. - - -" 
										@echo %textblock% �訡��>>extract_build.log
										 set answer=%nextPoint%
										 goto :askexit)
echo -----------------------------------------------------------------------

REM 2.2.����� ������� ������ ��� ����������� ������ (��砫�)
:copy_data
echo %textblock%
xcopy "%inputFolder%" "%outputFolder%" /i /e /h /y
If %errorlevel%==0 (Echo "- - - ������ �ᯥ譮 �����襭�. - - -" 
				   @echo %textblock% �ᯥ譮>>extract_build.log
					goto :%nextPoint%) else (Echo "- - - �������� �஡���� �� �믮������. - - -" 
										@echo %textblock% �訡��>>extract_build.log
										 set answer=%nextPoint%
										 goto :askexit)
echo -----------------------------------------------------------------------

REM 2.3.����� ������� ������ ��� ������ ������ (��砫�)
:rename_data
SetLocal EnableExtensions EnableDelayedExpansion
REM �।���⥫쭮 㤠�塞 ��ப� � ����묨 ���祭�ﬨ (䨪� �� ����� ⥪�� "����� �뢮�� ������ �� �࠭ (ECHO) �⪫�祭.")
cd /d "%fileDirectory%"
findstr /vrc:"^$" /vrc:"^ $" /vrc:"^  $" %fileName%>tmp0.tmp
set "tempFile=tmp0.tmp"

echo %textblock% %fileName%
<"%tempFile%" >"tmp1.tmp" (
  for /f %%a in ('find /c /v "" ^< "%tempFile%"') do for /L %%C in (1,1,%%a) do (
    set LINE=& set /p LINE=
    if defined LINE (echo !LINE:%oldText%=%newText%!) else echo.
  )
)
del %tempFile%
move tmp1.tmp %fileName%
If %errorlevel%==0 (Echo "- - - ������ �ᯥ譮 �����襭�. - - -"
				   @echo %textblock% %fileName% �ᯥ譮>>extract_build.log
					goto :%nextPoint%) else (Echo "- - - �������� �஡���� �� �믮������. - - -"
									   @echo %textblock% �訡��>>extract_build.log
										set answer=%nextPoint%
										goto :askexit)
echo -----------------------------------------------------------------------
REM ========== 2.����� ������� (�����) ==========

REM ========== 3.������ ������ (��砫�) =========
:extract
REM 3.1.������������� ����� SERVER.ZIP
If not exist "%winRar%" (
    echo ERROR: ��娢��� WinRAR �� ��� "%winRar%" �� ������. �஢���� ����, 㪠����� � 䠩�� "%ini%"
	pause
	set success=1
	goto :exit_bat
)
	set "textBlock=��ᯠ���뢠�� ��娢 server.zip ..."
	set "zipFile=%in%\server.zip"
	set "outputFile=%out%\"
	set "nextPoint=extract_client"
goto :unzip_data

:extract_client
REM 3.2.������������� ����� CLIENT.ZIP
	set "textBlock=��ᯠ���뢠�� ��娢 client.zip ..."
	set "zipFile=%in%\client.zip"
	set "outputFile=%out%\client"
	set "nextPoint=extract_delphi"
echo �஢��塞 ����稥 ��४�ਨ client ...
If not exist "%out%"\client (
		echo ��४��� client �� �����㦥��. ������� ��४��� client...
		MD "%out%"\client
		goto :unzip_data) else (goto :unzip_data)

:extract_delphi
REM 3.3.��������� DELPHI-���������� � ��४��� CLIENT
	set "textBlock=������塞 Delphi-���������� � ��४��� client ..."
	set "inputFolder=%DelphiXE%"
	set "outputFolder=%out%\client"
	set "nextPoint=extract_eis"
goto :copy_data

:extract_eis
REM 3.4.�������� EIS.JAR
	set "textBlock=�����㥬 EIS.jar ..."
	set "inputFolder=%EIS%"
	set "outputFolder=%out%\server"
	set "nextPoint=extract_report"
goto :copy_data

:extract_report
REM 3.5.������������� ����� ������
	set "textBlock=��ᯠ���뢠�� ��娢 ������ ..."
	set "inputFolder=%REPORT%"
	REM ������ �஢��� ��४�ਨ/��娢�
	if exist "%REPORT%\*.*" (
		set "zipFile=%REPORT%\*.zip"
	) else (
		set zipFile=%REPORT%
	)
	set "outputFile=%out%\"
	set "nextPoint=extract_sofit"
goto :unzip_data

:extract_sofit
REM 3.6.������������� ����� �����
	set "textBlock=��ᯠ���뢠�� ��娢 ����� ..."
	set "inputFolder=%SOFIT%"
	REM ������ �஢��� ��४�ਨ/��娢�
	if exist "%SOFIT%\*.*" (
		set "zipFile=%SOFIT%\*.zip"
	) else (
		set zipFile=%SOFIT%
	)
	set "outputFile=%out%\"
	set "nextPoint=extract_shplan"
goto :unzip_data

:extract_shplan
REM 3.7.��������� ����� SCHPLANSTOP
	set "textBlock=������塞 䠩�� schplanstop..."
	set "inputFolder=%schplanstop%"
	set "outputFolder=%out%\SQL"
	set "nextPoint=extract_azkabat"
goto :copy_data

:extract_azkabat
REM 3.8.��������� ����� AZKA.BAT
	set "textBlock=������塞 䠩�� azka.bat ..."
	set "inputFolder=%azka%"
	set "outputFolder=%out%"
	set "nextPoint=extract_port"
goto :copy_data

:extract_port
REM 3.9. ��������������� �����
	set "textBlock=��२�����뢠�� ����� �"
	set "fileName=%infile_1%"
	set "fileDirectory=%out%"
	set "oldText=%SP_PORT%"
	set "newText=%renSP%"
	set "nextPoint=extract_port2"
goto :rename_data

:extract_port2
	set "fileName=%infile_1%"
	set "fileDirectory=%out%"
	set "oldText=%RMI_PORT%"
	set "newText=%renRMI%"
set "nextPoint=extract_port3"
goto :rename_data

:extract_port3
	set "fileName=%infile_2%"
	set "fileDirectory=%out%\XML"
	set "oldText=%SP_PORT%"
	set "newText=%renSP%"
	set "nextPoint=extract_port4"
goto :rename_data

:extract_port4
	set "fileName=%infile_3%"
	set "fileDirectory=%out%\client"
	set "oldText=%SP_PORT%"
	set "newText=%renSP%"
	set "nextPoint=extract_db"
goto :rename_data

:extract_db
REM 3.10.������ ���� �� �� FIREBIRD � AZK2SERVER.PROPERTIES
	set "textBlock=���塞 ���� �� �� Firebird �"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%fb_old%"
	set "newText=%fbNew%"
	set "nextPoint=extract_db2"
goto :rename_data

:extract_db2
REM 3.11.������ ���� �� �� ORACLE � AZK2SERVER.PROPERTIES
	set "textBlock=���塞 ���� �� �� Oracle �"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%ora_old%"
	set "newText=%oraNew%"
	set "nextPoint=extract_xm1"
goto :rename_data

:extract_xm1
REM 3.12.1.������ ACTION="PERFORM" �� ACTION="SYNCHRONIZE"
	set "textBlock=���塞 action �"
	set "fileName=%operkind%"
	set "fileDirectory=%out%\XML"
	set "oldText=perform"
	set "newText=synchronize"
	set "nextPoint=extract_xm2"
goto :rename_data

:extract_xm2
REM 3.12.2.������ ACTION="PERFORM" �� ACTION="SYNCHRONIZE"
	set "fileName=%unidoctype%"
	set "fileDirectory=%out%\XML"
	set "oldText=perform"
	set "newText=synchronize"
	set "nextPoint=extract_xm3"
goto :rename_data

:extract_xm3
REM 3.12.2.������ ACTION="PERFORM" �� ACTION="SYNCHRONIZE"
	set "fileName=%serverprocessor%"
	set "fileDirectory=%out%\XML"
	set "oldText=perform"
	set "newText=synchronize"
	set "nextPoint=extract_xm4"
goto :rename_data

:extract_xm4
REM 3.12.2.������ ACTION="PERFORM" �� ACTION="SYNCHRONIZE"
	set "fileName=%reportprocessor%"
	set "fileDirectory=%out%\XML"
	set "oldText=perform"
	set "newText=synchronize"
	set "nextPoint=extract_Xmx"
goto :rename_data

:extract_Xmx
REM 3.13.������ ������ ��������� ������ ��� JAVA
	set "textBlock=���塞 ࠧ��� �뤥����� ����� ��� JAVA � 䠩��"
	set "fileName=%infile_6%"
	set "fileDirectory=%out%\server\bin"
	set "oldText=%Jram_old%"
	set "newText=%javaNew%"
	set "nextPoint=extract_tomcat"
goto :rename_data

:extract_tomcat
REM 3.14.��������� ������ �������, ������������ AZK.WAR
	set "textBlock=�����㥬 ᡮ�� TOMCAT"
	set "inputFolder=%tomcat%"
	set "outputFolder=%out%\apache_tomcat"
	set "nextPoint=extract_tomcat2"
goto :copy_data

:extract_tomcat2
REM 3.14.��������� ������ �������, ������������ AZK.WAR
	set "textBlock=�����㥬 䠩� azk.war"
	set "inputFolder=%in%\azk.war"
	set "outputFolder=%out%\apache_tomcat\webapps"
	set "nextPoint=extract_tomcat_port"
goto :copy_data
									 
:extract_tomcat_port
REM 3.14.1.������ ���� ���-�������
	set "textBlock=��२�����뢠�� ����� � "
	set "fileName=%infile_7%"
	set "fileDirectory=%out%\apache_tomcat\conf"
	set "oldText=%Server_old%"
	set "newText=%ServerNew%"
	set "nextPoint=extract_tomcat_port2"
goto :rename_data

:extract_tomcat_port2
REM 3.14.2.������ ���� ��� ������� ���-����������
	set "fileName=%infile_7%"
	set "fileDirectory=%out%\apache_tomcat\conf"
	set "oldText=%Connector_old%"
	set "newText=%ConnectorNew%"
	set "nextPoint=startweb"
goto :rename_data

:startweb
REM 3.15.��������� ������ ��� ���������� azk.war
echo -----------------------------------------------------------------------
echo.
echo ��������� ������ ��� ���������� azk.war
@echo ��������� ������ ��� ���������� azk.war>>extract_build.log
cd /d "%out%"\apache_tomcat\bin\
REM �ᯮ���� call, ��-�� ⮣�, �� ��᫥ �믮������ � �������� start, ⥪��� ࠡ�� bat-���� �४�頥���.
call startup.bat

:ask_web_rmi
REM 3.16.������ RMI-���� � ��������� �������
echo -----------------------------------------------------------------------
echo.
echo ������ RMI-���� � ��������� �������
@echo ������ RMI-���� � ��������� �������>>extract_build.log
	set question="�������� ���� � 䠩�� "%infile_5%?" [y/n]: "
	set answer=web_rmi
goto :askexit

:web_rmi
echo -----------------------------------------------------------------------
echo.
cd /d "%out%\apache_tomcat\webapps\azk\WEB-INF\"
If exist %infile_5% (
		set "textBlock=���� ����஥� ������. ��२�����뢠�� ����� �"
		set "fileName=%infile_5%"
		set "fileDirectory=%out%\apache_tomcat\webapps\azk\WEB-INF\"
		set "oldText=%RMI_PORT%"
		set "newText=%renRMI%"
		set "nextPoint=ask_drop_war"
	goto :rename_data
) else (
	echo ���� ����஥� �� ������.
		set question="������� ���� 䠩�� %infile_5%? [y/n]: "
		set answer=web_rmi
	goto :askexit)

:ask_drop_war
REM 3.17.������� ���� AZK.WAR �� ������ �������
echo -----------------------------------------------------------------------
echo.
set question="������� 䠩� azk.war �� ᡮન ⮬���? [y/n]: "
set answer=drop_war
set answer2=ask_start
goto :askexit

:drop_war
cd /d "%out%"\apache_tomcat\bin\
call shutdown.bat
TIMEOUT /T 5 /NOBREAK
cd /d "%out%"\apache_tomcat\webapps
DEL /Q azk.war
If %errorlevel%==0 (Echo "- - - ������ �ᯥ譮 �����襭�. - - -"
					@echo ���� azk.war 㤠���...�ᯥ譮>>extract_build.log
					) else (Echo "- - - �������� �஡���� �� �믮������. - - -"
							@echo ���� azk.war 㤠���...�訡��>>extract_build.log)
goto :ask_start

REM 3.18.�஢�ઠ �� ����� �� ���-�������
:ask_start
echo -----------------------------------------------------------------------
echo.
set answer2=1
set question="�������� �� %SYS%? [y/n]: "
set answer=startbat
goto :askexit

REM ����� �� ���
:startbat
cd /d "%out%"
call StartServer.bat

:color
set c=%1& exit/b
 
:echo
for /f %%i in ('"prompt $h& for %%i in (.) do rem"') do (
  pushd "%~dp0"& <nul>"%~1_" set/p="%%i%%i  "& findstr/a:%c% . "%~1_*"
  (if "%~2" neq "/" echo.)& del "%~1_"& popd& set c=& exit/b
)

REM ������ ��⠭���� ��। ��室��. ��᫥ 祣� ��室�� �� �ணࠬ��
:exit_bat
pause

@echo.>>extract_build.log
@echo � ��砥 �஡��� � ����ᮢ �������� albafoxx (abzaev.albert@gmail.com)>>extract_build.log
if %success%==0 (echo ���ઠ �믮����� �ᯥ譮. �������� �� ���஢�>>extract_build.log
	) else (echo ���ઠ �믮����� � �訡����...>>extract_build.log)

exit
END