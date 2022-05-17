@echo off
REM ����뢠�� ����஢��. ����室��� ��� ���������, ��� ��-㬮�砭�� �ᯮ������ ��㣠� ����஢��
chcp 866
echo.
REM author : albafoxx (abzaev.albert@gmail.com)

REM �������� �ணࠬ��. ����� � ��� ५���
set "titleName=Extract v4.2.15 (2022.05.22) - ��⮬���᪨� ᡮ�騪 �⥭�� ���-�������"
title %titleName%

REM ���������� ����������� ����������/����
Set "SYS=���-�������"
Set "ini=_extract_fin.ini"
Set "logfile=%CD%\extract_build.log"

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
Set "ora_url_old=172.26.24.9:1521:ORACL11B"
Set "Jram_old=1024m"
Set "Server_old=8005"
Set "Connector_old=8080"

REM �뭮ᨬ � ��砫� �ਯ�, ⠪ ��� � 4 �㭪� �஢�ન ����� �㤥� ��������
set question="�த������ �믮������? [y/n]: "
REM ������ ���祭�� "��-㬮�砭��"
set answer2=0

REM ������ ���祭�� "��-㬮�砭��" ��� �஢�ન �ᯥ譮�� �����襭�� ᡮન � ����� � ���
set success=0

REM ����������� ����������/���� �� ����� ��������
setlocal DisableDelayedExpansion
set /a c=0
for /f "UseBackQ Delims=" %%A IN (%ini%) do (
  set /a c+=1
  setlocal EnableDelayedExpansion
  If !c!==1 (setlocal DisableDelayedExpansion
			 REM 1. ��४��� ��㤠 ��६ 䠩�
			 set "in=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==2 (setlocal DisableDelayedExpansion
			 REM 2. ��४��� ��� ᮡ�ࠥ� �⥭�
			 set "out=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==3 (setlocal DisableDelayedExpansion
			 REM 3. ��४��� EIS
			 set "EIS=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==4 (setlocal DisableDelayedExpansion
			 REM 4. ��४��� ������
			 set "REPORT=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==5 (setlocal DisableDelayedExpansion
			 REM 5. ��४��� �����
			 set "SOFIT=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==6 (setlocal DisableDelayedExpansion
			 REM 6. ��४��� Delphi_XE4_Runtime_BPLs
			 set "DelphiXE=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==7 (setlocal DisableDelayedExpansion
			 REM 7. ��४��� � �������⥫�묨 䠩���� ��� ᡮન
			 set "schplanstop=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==8 (setlocal DisableDelayedExpansion
			 REM REM 8. ��४��� � �������⥫�묨 䠩���� ��� ᡮન
			 set "azka=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==9 (setlocal DisableDelayedExpansion
			 REM 9. ��४��� ��������
			 set "tomcat=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==10 (REM 10. ���� ��
			  set "renSP=%%A")
  If !c!==11 (rem 11. ���� ������
			  set "renRMI=%%A")
  If !c!==12 (setlocal DisableDelayedExpansion
			  rem 12. ��४��� �� ��娢���
			  set "winRar=%%A"
			  setlocal EnableDelayedExpansion
			  endlocal)
  If !c!==13 (rem 13. ���� �� �� Firebird
			  set "fbNew=%%A")
  If !c!==14 (rem 14. ���� �� �� Oracle
			  set "oraNew=%%A")
  If !c!==15 (rem 14.1 ���� �� �� Oracle
			  set "oraUrlNew=%%A")
  If !c!==16 (rem 15. ������ Java-�����
			  set "javaNew=%%A")
  If !c!==17 (rem 16. ���� �� ���஬ ����᪠���� ���-�ࢥ�
			  set "ServerNew=%%A")
  If !c!==18 (rem 17. ���� �� ���஬� ����� �㤥� ������ ���-������
			  set "ConnectorNew=%%A")
  If !c!==19 (rem 18. ���᮪ XML-䠩���, � ������ �㦭� ��������
			  set "listXML=%%A")
)

REM �����ࠥ� ��ப� � ᯨ᪮� XML � �����뢠�� � �⤥��� ��६���� varN
setlocal enabledelayedexpansion
set n=0
for %%i in (%listXML%) do (
	set /a n=!n! + 1
    set var!n!=%%i
)

REM ������������� ���� ��� ������ � �������
SetLocal DisableDelayedExpansion
echo ��४�ਨ:
echo ��६ �⠫���� �� %in%
echo ᮡ�ࠥ� �����    %out%
echo.
echo -----------------------------------------------------------------------
echo ���������� ��� ᡮન:
echo ���	  %EIS%
echo �����	  %REPORT%
echo �����	  %SOFIT%
echo ������	  %tomcat%
echo DelphiXE  %DelphiXE%
echo -----------------------------------------------------------------------
echo.

@echo �६� ᡮન:     %DATE% %time:~0,8%>%logfile%
@echo ����ࠥ� ᡮ�� � %out%>>%logfile%
@echo.>>%logfile%
@echo ��६ �⠫���� ��		%in%>>%logfile%
@echo �ᯮ������ ���		%EIS%>>%logfile%
@echo �ᯮ������ ����� 	%REPORT%>>%logfile%
@echo �ᯮ������ �����		%SOFIT%>>%logfile%
@echo �ᯮ������ ������		%tomcat%>>%logfile%
@echo �ᯮ������ DelphiXE	%DelphiXE%>>%logfile%
@echo.>>%logfile%

REM ========== 1.���� � ���������� (��砫�) ==========
REM 1.1.�������� �������� ����������
:check_dir
set check_stop=0
echo ������� �஢�ન 㪠������ ���祭��:
echo [��४��� %in%]
If Exist "%in%" (call :writer 2 "+ ��४��� � �⠫����� �������"
) else (call :writer 4 "- ��४��� � �⠫����� �� �������"
		set check_stop=1)
echo [��४��� %EIS%]
If Exist "%EIS%" (call :writer 2 "+ ��४��� � ��� �������"
) else (call :writer 4 "- ��४��� � ��� �� �������"
		set check_stop=1)
echo [��४��� %REPORT%]
If Exist "%REPORT%" (call :writer 2 "+ ��४��� � ���⠬� �������"
) else (call :writer 4 "- ��४��� � ���⠬� �� �������"
		set check_stop=1)
echo [��४��� %SOFIT%]
If Exist "%SOFIT%" (call :writer 2 "+ ��४��� � ��⮬ �������"
) else (call :writer 4 "- ��४��� � ��⮬ �� �������"
		set check_stop=1)
echo [��४��� %tomcat%]
If Exist "%tomcat%" (call :writer 2 "+ ��४��� � ⮬��⮬ �������"
) else (call :writer 4 "- ��४��� � ⮬��⮬ �� �������"
		set check_stop=1)
echo [��४��� %DelphiXE%]
If Exist "%DelphiXE%" (call :writer 2 "+ ��४��� � DelphiXE �������"
) else (call :writer 4 "- ��४��� � DelphiXE �� �������"
		set check_stop=1)

REM ���� ���� ���� ���� ������ ����������� - ������������� ������. ������ ���������.
echo.
If %check_stop%==0 (call :writer E "�� 㪠����� ��४�ਨ �������. �த������ ᡮ�� �⥭�� %SYS%"
				   @echo.>>%logfile%
				   goto :check_out
	) else (call :writer 4 "������⭮ 㪠���� ��४�ਨ, ����室��� �஢���� ��� � ini-䠩�� [���஡���� ���]. ���ઠ �⥭�� %SYS% ��⠭������."
			@echo.>>%logfile%
			set success=1
			goto :exit_bat)

REM 1.2.�������� ������� ����������, � ������� ����� ���������� ������
:check_out
If Not Exist "%out%" (
echo.
call :writer E "��४���, ��� ᮡ�ࠥ��� �⥭� �� �������. ��� �㤥� ᮧ����."
goto :extract
) else (
	echo.
	call :writer E "��४���, ��� ᮡ�ࠥ��� �⥭� 㦥 ᮧ����. ���⢥न� ��१����� 䠩���..."
	goto :ask)

REM 1.3.�������� �� ���������� ������ � ����� %OUT%, ���� ��� ��� ���� (�������)
:ask
set /p ask="���⢥न� ��१����� 䠩��� � ��४�ਨ "%out%"? [y/n]: "
@echo %DATE% %time:~0,8% : ���⢥न� ��१����� 䠩��� � ��४�ਨ "%out%"? [y/n]: %ask%>>%logfile%
If %ask%==y (RD /S /Q %out%
			set success=0
			@echo %DATE% %time:~0,8% : �믮������ ���⪠ ��४�ਨ "%out%" � ����ୠ� ᡮઠ ��� � 㪠������ ��⠫���...>>%logfile%
			goto :extract
) else (If %ask%==n (
		echo ���ઠ �⥭�� %SYS% ��⠭������.
		@echo %DATE% %time:~0,8% : ���ઠ �⥭�� ��⠭������. ��४��� "%out%" 㦥 �뫠 ᮧ���� ࠭��...>>%logfile%
		set success=1
		goto :exit_bat
		) else (echo ������� �� �ᯮ�����. ���஡�� ��� ࠧ.
				@echo %DATE% %time:~0,8% : ������� �� �ᯮ�����. ���஡�� ��� ࠧ...>>%logfile%
				set success=0
				echo.
				goto :ask))

REM 1.4.������ �� ����������� ������ ������, ���� ��������� ������ �� ������������ �����
:askexit
@echo %DATE% %time:~0,8% : %question% - %ask% >>%logfile%
set /p ask=%question%
If %ask%==y (
	set success=1
	goto %answer%
	) else (
		If %ask%==n (
			If %answer2%==ask_start (
				set success=0
				goto :ask_start
				) else (
				set success=0
				goto :exit_bat)
		) else (
		call :writer E "������� �� �ᯮ�����. ���஡�� ��� ࠧ."
		goto :askexit))
REM ========== 1.���� � ���������� (�����) ==========

REM ========== 2.����� ������� (��砫�) ==========
REM 2.1 ����� ������� ������ ��� ���������� ������� (��砫�)
:unzip_data
echo %textblock%
%winRar% x "%zipFile%" -o "%outputFile%" -r -y -ibck
call :check_error
echo -----------------------------------------------------------------------

REM 2.2.����� ������� ������ ��� ����������� ������ (��砫�)
:copy_data
echo %textblock%
xcopy "%inputFolder%" "%outputFolder%" /i /e /h /y
call :check_error
echo -----------------------------------------------------------------------

REM 2.3 ����� ������� ������ ��� ������ ������ (��砫�)
:rename_data
SetLocal EnableExtensions EnableDelayedExpansion
REM �।���⥫쭮 㤠�塞 ��ப� � ����묨 ���祭�ﬨ (䨪� �� ����� ⥪�� "����� �뢮�� ������ �� �࠭ (ECHO) �⪫�祭.")
echo %fileDirectory%
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
SetLocal DisableDelayedExpansion
call :check_error

REM 2.4 ���� ������������ ��� ��������� ������ (��砫�)
:color
set c=%1& exit/b
 
:echo
for /f %%i in ('"prompt $h& for %%i in (.) do rem"') do (
  pushd "%~dp0"& <nul>"%~1_" set/p="%%i%%i  "& findstr/a:%c% . "%~1_*"
  (if "%~2" neq "/" echo.)& del "%~1_"& popd& set c=& exit/b
)
echo -----------------------------------------------------------------------

REM 2.5 ���� ������������ ��� ������ ���������� (��砫�)
:writer
set massage=%2
call :color %1
call :echo %2
@echo %DATE% %time:~0,8% : %massage:~1,-1% >> %logfile%& exit/b

REM 2.6 ���� ������������ ��� ��������, ����� ���������� �������� (��砫�)
:check_error
If %errorlevel%==0 (call :writer 2 "%textblock% %fileName%... ������ �ᯥ譮 �����襭�"
					goto :%nextPoint%) else (call :writer 4 "%textblock% %fileName%... �������� �஡���� �� �믮������"
											 set answer=%nextPoint%
											 goto :askexit)
echo -----------------------------------------------------------------------
REM ========== 2.����� ������� (�����) ==========

REM ========== 3.������ ������ (��砫�) =========
:extract
REM 3.1 ������������� ����� SERVER.ZIP
If not exist "%winRar%" (
    echo ERROR: ��娢��� WinRAR �� ��� "%winRar%" �� ������. �஢���� ����, 㪠����� � 䠩�� "%ini%"
	set success=1
	goto :exit_bat
)
	set "textBlock=��ᯠ���뢠�� ��娢 server.zip"
	set "zipFile=%in%\server.zip"
	set "outputFile=%out%\"
	set "nextPoint=extract_client"
goto :unzip_data

:extract_client
REM 3.2 ������������� ����� CLIENT.ZIP
	set "textBlock=��ᯠ���뢠�� ��娢 client.zip"
	set "zipFile=%in%\client.zip"
	set "outputFile=%out%\client"
	set "nextPoint=extract_delphi"
echo �஢��塞 ����稥 ��४�ਨ client...
If not exist "%out%"\client (
		echo ��४��� client �� �����㦥��. ������� ��४��� client...
		MD "%out%"\client
		goto :unzip_data) else (goto :unzip_data)

:extract_delphi
REM 3.3 ��������� DELPHI-���������� � ��४��� CLIENT
	set "textBlock=������塞 Delphi-���������� � ��४��� client"
	set "inputFolder=%DelphiXE%"
	set "outputFolder=%out%\client"
	set "nextPoint=extract_eis"
goto :copy_data

:extract_eis
REM 3.4 �������� EIS.JAR
	set "textBlock=�����㥬 EIS.jar"
	set "inputFolder=%EIS%"
	set "outputFolder=%out%\server"
	set "nextPoint=extract_report"
goto :copy_data

:extract_report
REM 3.5 ������������� ����� ������
	set "textBlock=��ᯠ���뢠�� ��娢 ������"
	set "inputFolder=%REPORT%"
	REM ������ �஢��� ��४�ਨ/��娢�
	if exist "%REPORT%\*.*" (
		set "zipFile=%REPORT%\*.zip") else (set "zipFile=%REPORT%")
	set "outputFile=%out%\"
	set "nextPoint=extract_sofit"
goto :unzip_data

:extract_sofit
REM 3.6 ������������� ����� �����
	set "textBlock=��ᯠ���뢠�� ��娢 �����"
	set "inputFolder=%SOFIT%"
	REM ������ �஢��� ��४�ਨ/��娢�
	if exist "%SOFIT%\*.*" (
		set "zipFile=%SOFIT%\*.zip") else (set "zipFile=%SOFIT%")
	set "outputFile=%out%\"
	set "nextPoint=extract_shplan"
goto :unzip_data

:extract_shplan
REM 3.7 ��������� ����� SCHPLANSTOP
	set "textBlock=������塞 䠩�� schplanstop"
	set "inputFolder=%schplanstop%"
	set "outputFolder=%out%\SQL"
	set "nextPoint=extract_azkabat"
goto :copy_data

:extract_azkabat
REM 3.8 ��������� ����� AZKA.BAT
	set "textBlock=������塞 䠩�� azka.bat"
	set "inputFolder=%azka%"
	set "outputFolder=%out%"
	set "nextPoint=extract_port"
goto :copy_data

:extract_port
REM 3.9 ��������������� �����
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
REM 3.10 ������ ���� �� �� FIREBIRD � AZK2SERVER.PROPERTIES
	set "textBlock=���塞 ���� �� �� Firebird �"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%fb_old%"
	set "newText=%fbNew%"
	set "nextPoint=extract_db2"
goto :rename_data

:extract_db2
REM 3.11.1 ������ ���� �� �� ORACLE � AZK2SERVER.PROPERTIES
	set "textBlock=���塞 ���� �� �� Oracle �"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%ora_old%"
	set "newText=%oraNew%"
	set "nextPoint=extract_db3"
goto :rename_data

:extract_db3
REM 3.11.2 ������ ���� �� �� ORACLE � AZK2SERVER.PROPERTIES
	set "textBlock=���塞 ���� �� �� Oracle �"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%ora_url_old%"
	set "newText=%oraUrlNew%"
	set "nextPoint=extract_xml"
goto :rename_data

:extract_xml
setlocal EnableDelayedExpansion
REM 3.12 ������ ACTION="PERFORM" �� ACTION="SYNCHRONIZE"
call :writer E "�믮��塞 ��������� action � XML. ��।����� %n% xml-䠩��..."
for /L %%s in (1,1,%n%) do (
	set param=var%%s
	set v1=%%s
	call :extract_listXML !param!
)
goto :extract_Xmx

:extract_listXML
	set "textBlock=���塞 action �"
	set "fileName=!%1!"
	set "fileDirectory=%out%\XML"
	set "oldText=perform"
	set "newText=synchronize"
	set "nextPoint=stopExit"
goto :rename_data

:stopExit
exit /b 0

:extract_Xmx
setlocal DisableDelayedExpansion
REM 3.13 ������ ������ ��������� ������ ��� JAVA
	set "textBlock=���塞 ࠧ��� �뤥����� ����� ��� JAVA � 䠩��"
	set "fileName=%infile_6%"
	set "fileDirectory=%out%\server\bin"
	set "oldText=%Jram_old%"
	set "newText=%javaNew%"
	set "nextPoint=extract_tomcat"
goto :rename_data

:extract_tomcat
REM 3.14 ��������� ������ �������, ������������ AZK.WAR
	set "textBlock=�����㥬 ᡮ�� TOMCAT"
	set "fileName="
	set "inputFolder=%tomcat%"
	set "outputFolder=%out%\apache_tomcat"
	set "nextPoint=extract_tomcat2"
goto :copy_data

:extract_tomcat2
REM 3.14 ��������� ������ �������, ������������ AZK.WAR
	set "textBlock=�����㥬 䠩� azk.war"
	set "inputFolder=%in%\azk.war"
	set "outputFolder=%out%\apache_tomcat\webapps"
	set "nextPoint=extract_tomcat_port"
goto :copy_data
									 
:extract_tomcat_port
REM 3.14.1 ������ ���� ���-�������
	set "textBlock=��२�����뢠�� ����� �"
	set "fileName=%infile_7%"
	set "fileDirectory=%out%\apache_tomcat\conf"
	set "oldText=%Server_old%"
	set "newText=%ServerNew%"
	set "nextPoint=extract_tomcat_port2"
goto :rename_data

:extract_tomcat_port2
REM 3.14.2 ������ ���� ��� ������� ���-����������
	set "fileName=%infile_7%"
	set "fileDirectory=%out%\apache_tomcat\conf"
	set "oldText=%Connector_old%"
	set "newText=%ConnectorNew%"
	set "nextPoint=startweb"
goto :rename_data

:startweb
REM 3.15 ��������� ������ ��� ���������� azk.war
echo -----------------------------------------------------------------------
echo.
echo ����᪠�� ⮬��� ��� �ᯠ����� azk.war
@echo.>>%logfile%
@echo %DATE% %time:~0,8% : ����᪠�� ⮬��� ��� �ᯠ����� azk.war>>%logfile%
cd /d "%out%"\apache_tomcat\bin\
REM �ᯮ���� call, ��-�� ⮣�, �� ��᫥ �믮������ � �������� start, ⥪��� ࠡ�� bat-���� �४�頥���.
call startup.bat

:ask_web_rmi
REM 3.16 ������ RMI-���� � ��������� �������
echo -----------------------------------------------------------------------
echo.
echo ������ RMI-���� � ��������� �������
@echo %DATE% %time:~0,8% : ���塞 rmi-���� � ����ப�� ⮬���>>%logfile%
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
REM 3.17 ������� ���� AZK.WAR �� ������ �������
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
If %errorlevel%==0 (call :writer 2 "�������� 䠩�� azk.war... �ᯥ譮"
					) else (call :writer 4 "�������� 䠩�� azk.war... �訡��")
goto :ask_start

REM 3.18 �������� �� ������ �� ���-�������
:ask_start
echo -----------------------------------------------------------------------
echo.
set question="�������� �� %SYS%? [y/n]: "
set answer=startbat
set answer2=1
goto :askexit

REM ����� �� ���
:startbat
cd /d "%out%"
echo ----------------------------------------------------------------------->>%logfile%
@echo %DATE% %time:~0,8% : ���ઠ �믮����� �������. �믮���� ����� �� %SYS%>>%logfile%
call :copyright
call StartServer.bat

REM ������ ��������� ����� �������. ����� ���� ������� �� ���������
:exit_bat
pause
echo ----------------------------------------------------------------------->>%logfile%
if %success%==0 (
	@echo %DATE% %time:~0,8% : ���ઠ �믮����� �������. �� %SYS% �� ����᪠��� >>%logfile%) else (
		@echo %DATE% %time:~0,8% : ���ઠ �믮����� � �������� >>%logfile%)

:copyright
@echo.>>%logfile%
@echo ===========================================================================>>%logfile%
@echo %titleName%>>%logfile%
@echo � ��砥 �஡��� � ����ᮢ �������� � albafoxx (abzaev.albert@gmail.com)>>%logfile%
@echo ===========================================================================>>%logfile%

exit
END