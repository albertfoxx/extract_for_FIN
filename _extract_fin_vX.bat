@echo off
REM �������� �ணࠬ��. ����� � ��� ५���
title Extract v4.0(2021.10.11) - ��⮬���᪨� ᡮ�騪 �⥭�� ���-�������
REM author : albafoxx (abzaev.albert@gmail.com)

REM ����뢠�� ����஢��. ����室��� ��� ���������, ��� ��-㬮�砭�� �ᯮ������ ��㣠� ����஢��
chcp 866
echo.

REM ���������� ����������� ����������/����
Set "SYS=���-�������"
Set "ini=_extract_fin.ini"
Set "SP_PORT=2001"
Set "RMI_PORT=2099"
Set "infile_1=StartServer.bat"
Set "infile_2=xml.properties"
Set "infile_3=Azk2Clnt.ini"
Set "infile_4=Azk2Server.properties"
Set "infile_5=web.properties"
Set "infile_6=start.bat"
Set "fb_old=3050:D:/_DBase/balagan/R_MK.FDB"
Set "ora_old=F_IRKOBL_190327"
Set "Jram_old=1024m"

REM �ய��뢠�� xml-䠩��, � ������ ���塞 "action"
Set "operkind=operkind.xml"
Set "unidoctype=unidoctype.xml"
Set "serverprocessor=serverprocessor.xml"

REM �뭮ᨬ � ��砫� bat, ⠪ ��� � 4 �㭪� �஢�ન ����� �㤥� ��������
set question="�த������ �믮������? [y/n]: "
REM ������ ���祭�� "��-㬮�砭��"
set answer2=0

REM ����������� ����������/���� �� ����� ��������
SetLocal EnableDelayedExpansion
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
)

REM ������������� ���� ��� ������ � �������
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

REM ========== 1.���� � ���������� (��砫�) ==========
REM 1.1.�������� �������� ����������
:check_dir
set check_stop=0
If Exist "%in%" ( echo + ��४��� "%in%" �������.
) else (echo - ��४��� "%in%" �� �������.
		set check_stop=1)
If Exist "%EIS%" ( echo + ��४��� "%EIS%" �������.
) else (echo - ��४��� "%EIS%" �� �������.
		set check_stop=1)
If Exist "%REPORT%" ( echo + ��४��� "%REPORT%" �������.
) else (echo - ��४��� "%REPORT%" �� �������.
		set check_stop=1)
If Exist "%SOFIT%" ( echo + ��४��� "%SOFIT%" �������.
) else (echo - ��४��� "%SOFIT%" �� �������.
		set check_stop=1)
If Exist "%tomcat%" ( echo + ��४��� "%tomcat%" �������.
) else (echo - ��४��� "%tomcat%" �� �������.
		set check_stop=1)
If Exist "%DelphiXE%" ( echo + ��४��� "%DelphiXE%" �������.
) else (echo - ��४��� "%DelphiXE%" �� �������. 
		set check_stop=1)
echo.
REM ���� ���� ���� ���� ������ ����������� - ������������� ������. ������ ���������.
If %check_stop%==0 (echo �� 㪠����� ��४�ਨ �������. �த������ ᡮ�� �⥭�� %SYS% 
	goto :check_out
	) else (echo ������⭮ 㪠���� ��४�ਨ, ����室��� �஢���� ��� � ini-䠩�� [���஡���� ���]. ���ઠ �⥭�� %SYS% ��⠭������.
pause
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
					goto :%nextPoint%) else (Echo "- - - �������� �஡���� �� �믮������. - - -" 
										 set answer=%nextPoint%
										 goto :askexit)
echo -----------------------------------------------------------------------

REM 2.2.����� ������� ������ ��� ����������� ������ (��砫�)
:copy_data
echo %textblock%
xcopy "%inputFolder%" "%outputFolder%" /i /e /h /y
If %errorlevel%==0 (Echo "- - - ������ �ᯥ譮 �����襭�. - - -"
					goto :%nextPoint%) else (Echo "- - - �������� �஡���� �� �믮������. - - -" 
										 set answer=%nextPoint%
										 goto :askexit)
echo -----------------------------------------------------------------------

REM 2.3.����� ������� ������ ��� ������ ������ (��砫�)
:rename_data
setlocal enabledelayedexpansion
REM �।���⥫쭮 㤠�塞 ��ப� � ����묨 ���祭�ﬨ (䨪� �� ����� ⥪�� "����� �뢮�� ������ �� �࠭ (ECHO) �⪫�祭.")
cd /d "%fileDirectory%"
findstr /vrc:"^$" /vrc:"^ $" /vrc:"^  $" %FILENAME%>tmp0.tmp
set "tempFile=tmp0.tmp"

echo %textblock% %fileName%
set COUNT=0
for /F "tokens=* delims=," %%n in (!tempFile!) do (
set LINE=%%n
set TMPR=!LINE:%oldText%=%newText%!
Echo !TMPR!>>tmp1.tmp
)
move tmp1.tmp %fileName%
REM del %tempFile%
If %errorlevel%==0 (Echo "- - - ������ �ᯥ譮 �����襭�. - - -"
					goto :%nextPoint%) else (Echo "- - - �������� �஡���� �� �믮������. - - -" 
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
	if exist %SOFIT%\ (
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
	if exist %SOFIT%\ (
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
	set "textBlock=��२�����뢠�� ����� � "
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
echo �����㥬 ᡮ�� TOMCAT
xcopy "%tomcat%" "%out%"\apache_tomcat /i /e /h /y
echo �����㥬 䠩� azk.war
xcopy "%in%"\azk.war "%out%"\apache_tomcat\webapps /i /e /h /y
If %errorlevel%==0 (Echo "- - - ������ �ᯥ譮 �����襭�. - - -") else (Echo "- - - �������� �஡���� �� �믮������. - - -" 
																	set answer=startweb
																	goto :askexit)

:startweb
REM 3.15.��������� ������ ��� ���������� azk.war
echo -----------------------------------------------------------------------
echo.
echo ��������� ������ ��� ���������� azk.war
cd /d "%out%"\apache_tomcat\bin\
REM �ᯮ���� call, ��-�� ⮣�, �� ��᫥ �믮������ � �������� start, ⥪��� ࠡ�� bat-���� �४�頥���.
call startup.bat

:ask_web_rmi
REM 3.16.������ RMI-���� � ��������� �������
echo -----------------------------------------------------------------------
echo.
echo ������ RMI-���� � ��������� �������
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
If %errorlevel%==0 (Echo "- - - ������ �ᯥ譮 �����襭�. - - -") else (Echo "- - - �������� �஡���� �� �믮������. - - -" )
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

REM ������ ��⠭���� ��। ��室��. ��᫥ 祣� ��室�� �� �ணࠬ��
pause
:exit_bat
exit

END