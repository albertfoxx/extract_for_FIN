@echo off
REM Ŗ §ė¢ „¬ Ŗ®¤Øą®¢Ŗć. „®”å®¤Ø¬® ¤«ļ Ŗ®¬Æģīā„ą å, £¤„ Æ®-ć¬®«ē ­Øī ØįÆ®«ģ§ć„āįļ ¤ąć£ ļ Ŗ®¤Øą®¢Ŗ 
chcp 866
echo.
REM author : albafoxx (abzaev.albert@gmail.com)

REM  §¢ ­Ø„ Æą®£ą ¬¬ė. „ąįØļ Ø ¤ ā  ą„«Ø§ 
set "titleName=Extract v4.2.15 (2022.05.22) -  ¢ā®¬ āØē„įŖØ© į”®ąéØŖ įā„­¤  -Ø­ ­įė"
title %titleName%

REM   /
Set "SYS=-Ø­ ­įė"
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

REM ė­®įØ¬ ¢ ­ ē «® įŖąØÆā , ā Ŗ Ŗ Ŗ ¢ 4 Æć­Ŗā„ Æą®¢„ąŖØ ¢®Æą®į ”ć¤„ā ¬„­ļāģįļ
set question="ą®¤®«¦Øāģ ¢ėÆ®«­„­Ø„? [y/n]: "
REM  ¤ „¬ §­ ē„­Ø„ "Æ®-ć¬®«ē ­Øī"
set answer2=0

REM  ¤ „¬ §­ ē„­Ø„ "Æ®-ć¬®«ē ­Øī" ¤«ļ Æą®¢„ąŖØ ćįÆ„č­®įāØ § ¢„ąč„­Øļ į”®ąŖØ Ø § ÆØįØ ¢ «®£
set success=0

REM  /   
setlocal DisableDelayedExpansion
set /a c=0
for /f "UseBackQ Delims=" %%A IN (%ini%) do (
  set /a c+=1
  setlocal EnableDelayedExpansion
  If !c!==1 (setlocal DisableDelayedExpansion
			 REM 1. ¤Øą„Ŗā®ąØļ ®āŖć¤  ”„ą„¬ ä ©«
			 set "in=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==2 (setlocal DisableDelayedExpansion
			 REM 2. ¤Øą„Ŗā®ąØļ £¤„ į®”Øą „¬ įā„­¤
			 set "out=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==3 (setlocal DisableDelayedExpansion
			 REM 3. ¤Øą„Ŗā®ąØļ EIS
			 set "EIS=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==4 (setlocal DisableDelayedExpansion
			 REM 4. ¤Øą„Ŗā®ąØļ 
			 set "REPORT=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==5 (setlocal DisableDelayedExpansion
			 REM 5. ¤Øą„Ŗā®ąØļ 
			 set "SOFIT=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==6 (setlocal DisableDelayedExpansion
			 REM 6. ¤Øą„Ŗā®ąØļ Delphi_XE4_Runtime_BPLs
			 set "DelphiXE=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==7 (setlocal DisableDelayedExpansion
			 REM 7. ¤Øą„Ŗā®ąØļ į ¤®Æ®«­Øā„«ģ­ė¬Ø ä ©« ¬Ø ¤«ļ į”®ąŖØ
			 set "schplanstop=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==8 (setlocal DisableDelayedExpansion
			 REM REM 8. ¤Øą„Ŗā®ąØļ į ¤®Æ®«­Øā„«ģ­ė¬Ø ä ©« ¬Ø ¤«ļ į”®ąŖØ
			 set "azka=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==9 (setlocal DisableDelayedExpansion
			 REM 9. ¤Øą„Ŗā®ąØļ ®¬
			 set "tomcat=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==10 (REM 10. ®ąā 
			  set "renSP=%%A")
  If !c!==11 (rem 11. ®ąā ®¬Ŗ ā 
			  set "renRMI=%%A")
  If !c!==12 (setlocal DisableDelayedExpansion
			  rem 12. ¤Øą„Ŗā®ąØļ ¤®  ąåØ¢ ā®ą 
			  set "winRar=%%A"
			  setlocal EnableDelayedExpansion
			  endlocal)
  If !c!==13 (rem 13. ćāģ ¤®  Firebird
			  set "fbNew=%%A")
  If !c!==14 (rem 14. ćāģ ¤®  Oracle
			  set "oraNew=%%A")
  If !c!==15 (rem 14.1 ćāģ ¤®  Oracle
			  set "oraUrlNew=%%A")
  If !c!==16 (rem 15.  §¬„ą Java-Æ ¬ļāØ
			  set "javaNew=%%A")
  If !c!==17 (rem 16. ®ąā ­  Ŗ®ā®ą®¬ § ÆćįŖ „āįļ ¢„”-į„ą¢„ą
			  set "ServerNew=%%A")
  If !c!==18 (rem 17. ®ąā Æ® Ŗ®ā®ą®¬ć ¬®¦­® ”ć¤„ā ®āŖąėāģ ¢„”-Ŗ«Ø„­ā
			  set "ConnectorNew=%%A")
  If !c!==19 (rem 18. ÆØį®Ŗ XML-ä ©«®¢, ¢ Ŗ®ā®ąėå ­ć¦­® Ø§¬„­Øāģ
			  set "listXML=%%A")
)

REM  §”Øą „¬ įāą®Ŗć į® įÆØįŖ®¬ XML Ø § ÆØįė¢ „¬ ¢ ®ā¤„«ģ­ė„ Æ„ą„¬„­­ė„ varN
setlocal enabledelayedexpansion
set n=0
for %%i in (%listXML%) do (
	set /a n=!n! + 1
    set var!n!=%%i
)

REM      
SetLocal DisableDelayedExpansion
echo Øą„Ŗā®ąØØ:
echo ”„ą„¬ ķā «®­Ŗć Ø§ %in%
echo į®”Øą „¬ §¤„įģ    %out%
echo.
echo -----------------------------------------------------------------------
echo ®¬Æ®­„­āė ¤«ļ į”®ąŖØ:
echo 	  %EIS%
echo āē„āė	  %REPORT%
echo 	  %SOFIT%
echo 	  %tomcat%
echo DelphiXE  %DelphiXE%
echo -----------------------------------------------------------------------
echo.

@echo ą„¬ļ į”®ąŖØ:     %DATE% %time:~0,8%>%logfile%
@echo ®”Øą „¬ į”®ąŖć ¢ %out%>>%logfile%
@echo.>>%logfile%
@echo „ą„¬ ķā «®­Ŗć Ø§		%in%>>%logfile%
@echo įÆ®«ģ§ć„āįļ 		%EIS%>>%logfile%
@echo įÆ®«ģ§ć„āįļ āē„āė 	%REPORT%>>%logfile%
@echo įÆ®«ģ§ć„āįļ 		%SOFIT%>>%logfile%
@echo įÆ®«ģ§ć„āįļ 		%tomcat%>>%logfile%
@echo įÆ®«ģ§ć„āįļ DelphiXE	%DelphiXE%>>%logfile%
@echo.>>%logfile%

REM ========== 1.   (­ ē «®) ==========
REM 1.1.  
:check_dir
set check_stop=0
echo „§ć«ģā ā Æą®¢„ąŖØ ćŖ § ­­ėå §­ ē„­Ø©:
echo [Øą„Ŗā®ąØļ %in%]
If Exist "%in%" (call :writer 2 "+ Øą„Ŗā®ąØļ į ķā «®­Ŗ®© ­ ©¤„­ "
) else (call :writer 4 "- Øą„Ŗā®ąØļ į ķā «®­Ŗ®© ­„ ­ ©¤„­ "
		set check_stop=1)
echo [Øą„Ŗā®ąØļ %EIS%]
If Exist "%EIS%" (call :writer 2 "+ Øą„Ŗā®ąØļ į  ­ ©¤„­ "
) else (call :writer 4 "- Øą„Ŗā®ąØļ į  ­„ ­ ©¤„­ "
		set check_stop=1)
echo [Øą„Ŗā®ąØļ %REPORT%]
If Exist "%REPORT%" (call :writer 2 "+ Øą„Ŗā®ąØļ į ®āē„ā ¬Ø ­ ©¤„­ "
) else (call :writer 4 "- Øą„Ŗā®ąØļ į ®āē„ā ¬Ø ­„ ­ ©¤„­ "
		set check_stop=1)
echo [Øą„Ŗā®ąØļ %SOFIT%]
If Exist "%SOFIT%" (call :writer 2 "+ Øą„Ŗā®ąØļ į į®äØā®¬ ­ ©¤„­ "
) else (call :writer 4 "- Øą„Ŗā®ąØļ į į®äØā®¬ ­„ ­ ©¤„­ "
		set check_stop=1)
echo [Øą„Ŗā®ąØļ %tomcat%]
If Exist "%tomcat%" (call :writer 2 "+ Øą„Ŗā®ąØļ į ā®¬Ŗ ā®¬ ­ ©¤„­ "
) else (call :writer 4 "- Øą„Ŗā®ąØļ į ā®¬Ŗ ā®¬ ­„ ­ ©¤„­ "
		set check_stop=1)
echo [Øą„Ŗā®ąØļ %DelphiXE%]
If Exist "%DelphiXE%" (call :writer 2 "+ Øą„Ŗā®ąØļ į DelphiXE ­ ©¤„­ "
) else (call :writer 4 "- Øą„Ŗā®ąØļ į DelphiXE ­„ ­ ©¤„­ "
		set check_stop=1)

REM       -  .  .
echo.
If %check_stop%==0 (call :writer E "į„ ćŖ § ­­ė„ ¤Øą„Ŗā®ąØØ ­ ©¤„­ė. ą®¤®«¦ „¬ į”®ąŖć įā„­¤  %SYS%"
				   @echo.>>%logfile%
				   goto :check_out
	) else (call :writer 4 "„Ŗ®ąą„ā­® ćŖ § ­ė ¤Øą„Ŗā®ąØØ, ­„®”å®¤Ø¬® Æą®¢„ąØāģ ÆćāØ ¢ ini-ä ©«„ [Æ®¤ą®”­®įāØ ¢ėč„]. ”®ąŖ  įā„­¤  %SYS% ®įā ­®¢«„­ ."
			@echo.>>%logfile%
			set success=1
			goto :exit_bat)

REM 1.2.  ,     
:check_out
If Not Exist "%out%" (
echo.
call :writer E "Øą„Ŗā®ąØļ, £¤„ į®”Øą „āįļ įā„­¤ ­„ ­ ©¤„­ . ­  ”ć¤„ā į®§¤ ­ ."
goto :extract
) else (
	echo.
	call :writer E "Øą„Ŗā®ąØļ, £¤„ į®”Øą „āįļ įā„­¤ ć¦„ į®§¤ ­ . ®¤ā¢„ą¤Øā„ Æ„ą„§ ÆØįģ ä ©«®¢..."
	goto :ask)

REM 1.3.      %OUT%,     ()
:ask
set /p ask="®¤ā¢„ą¤Øā„ Æ„ą„§ ÆØįģ ä ©«®¢ ¢ ¤Øą„Ŗā®ąØØ "%out%"? [y/n]: "
@echo %DATE% %time:~0,8% : ®¤ā¢„ą¤Øā„ Æ„ą„§ ÆØįģ ä ©«®¢ ¢ ¤Øą„Ŗā®ąØØ "%out%"? [y/n]: %ask%>>%logfile%
If %ask%==y (RD /S /Q %out%
			set success=0
			@echo %DATE% %time:~0,8% : ėÆ®«­ļ„āįļ ®ēØįāŖ  ¤Øą„Ŗā®ąØØ "%out%" Ø Æ®¢ā®ą­ ļ į”®ąŖ   ¢ ćŖ § ­­®¬ Ŗ ā «®£„...>>%logfile%
			goto :extract
) else (If %ask%==n (
		echo ”®ąŖ  įā„­¤  %SYS% ®įā ­®¢«„­ .
		@echo %DATE% %time:~0,8% : ”®ąŖ  įā„­¤  ®įā ­®¢«„­ . Øą„Ŗā®ąØļ "%out%" ć¦„ ”ė«  į®§¤ ­  ą ­„„...>>%logfile%
		set success=1
		goto :exit_bat
		) else (echo ®¬ ­¤  ­„ ą įÆ®§­ ­ . ®Æą®”ć©ā„ „éń ą §.
				@echo %DATE% %time:~0,8% : ®¬ ­¤  ­„ ą įÆ®§­ ­ . ®Æą®”ć©ā„ „éń ą §...>>%logfile%
				set success=0
				echo.
				goto :ask))

REM 1.4.    ,      
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
		call :writer E "®¬ ­¤  ­„ ą įÆ®§­ ­ . ®Æą®”ć©ā„ „éń ą §."
		goto :askexit))
REM ========== 1.   (Ŗ®­„ę) ==========

REM ========== 2.  (­ ē «®) ==========
REM 2.1       (­ ē «®)
:unzip_data
echo %textblock%
%winRar% x "%zipFile%" -o "%outputFile%" -r -y -ibck
call :check_error
echo -----------------------------------------------------------------------

REM 2.2.      (­ ē «®)
:copy_data
echo %textblock%
xcopy "%inputFolder%" "%outputFolder%" /i /e /h /y
call :check_error
echo -----------------------------------------------------------------------

REM 2.3       (­ ē «®)
:rename_data
SetLocal EnableExtensions EnableDelayedExpansion
REM ą„¤¢ ąØā„«ģ­® ć¤ «ļ„¬ įāą®ŖØ į Æćįāė¬Ø §­ ē„­Øļ¬Ø (äØŖį ®ā § ÆØįØ ā„Ŗįā  "„¦Ø¬ ¢ė¢®¤  Ŗ®¬ ­¤ ­  ķŖą ­ (ECHO) ®āŖ«īē„­.")
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

REM 2.4      (­ ē «®)
:color
set c=%1& exit/b
 
:echo
for /f %%i in ('"prompt $h& for %%i in (.) do rem"') do (
  pushd "%~dp0"& <nul>"%~1_" set/p="%%i%%i  "& findstr/a:%c% . "%~1_*"
  (if "%~2" neq "/" echo.)& del "%~1_"& popd& set c=& exit/b
)
echo -----------------------------------------------------------------------

REM 2.5      (­ ē «®)
:writer
set massage=%2
call :color %1
call :echo %2
@echo %DATE% %time:~0,8% : %massage:~1,-1% >> %logfile%& exit/b

REM 2.6    ,    (­ ē «®)
:check_error
If %errorlevel%==0 (call :writer 2 "%textblock% %fileName%... Æ„ą ęØļ ćįÆ„č­® § ¢„ąč„­ "
					goto :%nextPoint%) else (call :writer 4 "%textblock% %fileName%... ®§­ØŖ«Ø Æą®”«„¬ė ÆąØ ¢ėÆ®«­„­ØØ"
											 set answer=%nextPoint%
											 goto :askexit)
echo -----------------------------------------------------------------------
REM ========== 2.  (Ŗ®­„ę) ==========

REM ========== 3.  (­ ē «®) =========
:extract
REM 3.1   SERVER.ZIP
If not exist "%winRar%" (
    echo ERROR: ąåØ¢ ā®ą WinRAR Æ® ÆćāØ "%winRar%" ­„ ­ ©¤„­. ą®¢„ąģā„ Æćāģ, ćŖ § ­­ė© ¢ ä ©«„ "%ini%"
	set success=1
	goto :exit_bat
)
	set "textBlock= įÆ Ŗ®¢ė¢ „¬  ąåØ¢ server.zip"
	set "zipFile=%in%\server.zip"
	set "outputFile=%out%\"
	set "nextPoint=extract_client"
goto :unzip_data

:extract_client
REM 3.2   CLIENT.ZIP
	set "textBlock= įÆ Ŗ®¢ė¢ „¬  ąåØ¢ client.zip"
	set "zipFile=%in%\client.zip"
	set "outputFile=%out%\client"
	set "nextPoint=extract_delphi"
echo ą®¢„ąļ„¬ ­ «ØēØ„ ¤Øą„Ŗā®ąØØ client...
If not exist "%out%"\client (
		echo Øą„Ŗā®ąØļ client ­„ ®”­ ąć¦„­ . ®§¤ „¬ ¤Øą„Ŗā®ąØī client...
		MD "%out%"\client
		goto :unzip_data) else (goto :unzip_data)

:extract_delphi
REM 3.3  DELPHI-  ¤Øą„Ŗā®ąØī CLIENT
	set "textBlock=®” ¢«ļ„¬ Delphi-Ŗ®¬Æ®­„­āė ¢ ¤Øą„Ŗā®ąØī client"
	set "inputFolder=%DelphiXE%"
	set "outputFolder=%out%\client"
	set "nextPoint=extract_eis"
goto :copy_data

:extract_eis
REM 3.4  EIS.JAR
	set "textBlock=®ÆØąć„¬ EIS.jar"
	set "inputFolder=%EIS%"
	set "outputFolder=%out%\server"
	set "nextPoint=extract_report"
goto :copy_data

:extract_report
REM 3.5   
	set "textBlock= įÆ Ŗ®¢ė¢ „¬  ąåØ¢ "
	set "inputFolder=%REPORT%"
	REM „« „¬ Æą®¢„ąŖć ¤Øą„Ŗā®ąØØ/ ąåØ¢ 
	if exist "%REPORT%\*.*" (
		set "zipFile=%REPORT%\*.zip") else (set "zipFile=%REPORT%")
	set "outputFile=%out%\"
	set "nextPoint=extract_sofit"
goto :unzip_data

:extract_sofit
REM 3.6   
	set "textBlock= įÆ Ŗ®¢ė¢ „¬  ąåØ¢ "
	set "inputFolder=%SOFIT%"
	REM „« „¬ Æą®¢„ąŖć ¤Øą„Ŗā®ąØØ/ ąåØ¢ 
	if exist "%SOFIT%\*.*" (
		set "zipFile=%SOFIT%\*.zip") else (set "zipFile=%SOFIT%")
	set "outputFile=%out%\"
	set "nextPoint=extract_shplan"
goto :unzip_data

:extract_shplan
REM 3.7   SCHPLANSTOP
	set "textBlock=®” ¢«ļ„¬ ä ©«ė schplanstop"
	set "inputFolder=%schplanstop%"
	set "outputFolder=%out%\SQL"
	set "nextPoint=extract_azkabat"
goto :copy_data

:extract_azkabat
REM 3.8   AZKA.BAT
	set "textBlock=®” ¢«ļ„¬ ä ©«ė azka.bat"
	set "inputFolder=%azka%"
	set "outputFolder=%out%"
	set "nextPoint=extract_port"
goto :copy_data

:extract_port
REM 3.9  
	set "textBlock=„ą„Ø¬„­®¢ė¢ „¬ Æ®ąāė ¢"
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
REM 3.10     FIREBIRD  AZK2SERVER.PROPERTIES
	set "textBlock=„­ļ„¬ Æćāģ ¤®  Firebird ¢"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%fb_old%"
	set "newText=%fbNew%"
	set "nextPoint=extract_db2"
goto :rename_data

:extract_db2
REM 3.11.1     ORACLE  AZK2SERVER.PROPERTIES
	set "textBlock=„­ļ„¬ Æćāģ ¤®  Oracle ¢"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%ora_old%"
	set "newText=%oraNew%"
	set "nextPoint=extract_db3"
goto :rename_data

:extract_db3
REM 3.11.2     ORACLE  AZK2SERVER.PROPERTIES
	set "textBlock=„­ļ„¬ Æćāģ ¤®  Oracle ¢"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%ora_url_old%"
	set "newText=%oraUrlNew%"
	set "nextPoint=extract_xml"
goto :rename_data

:extract_xml
setlocal EnableDelayedExpansion
REM 3.12  ACTION="PERFORM"  ACTION="SYNCHRONIZE"
call :writer E "ėÆ®«­ļ„¬ Ø§¬„­„­Ø„ action ¢ XML. Æą„¤„«„­® %n% xml-ä ©« ..."
for /L %%s in (1,1,%n%) do (
	set param=var%%s
	set v1=%%s
	call :extract_listXML !param!
)
goto :extract_Xmx

:extract_listXML
	set "textBlock=„­ļ„¬ action ¢"
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
REM 3.13      JAVA
	set "textBlock=„­ļ„¬ ą §¬„ą ¢ė¤„«„­®© Æ ¬ļāØ ¤«ļ JAVA ¢ ä ©«„"
	set "fileName=%infile_6%"
	set "fileDirectory=%out%\server\bin"
	set "oldText=%Jram_old%"
	set "newText=%javaNew%"
	set "nextPoint=extract_tomcat"
goto :rename_data

:extract_tomcat
REM 3.14   ,  AZK.WAR
	set "textBlock=®ÆØąć„¬ į”®ąŖć TOMCAT"
	set "fileName="
	set "inputFolder=%tomcat%"
	set "outputFolder=%out%\apache_tomcat"
	set "nextPoint=extract_tomcat2"
goto :copy_data

:extract_tomcat2
REM 3.14   ,  AZK.WAR
	set "textBlock=®ÆØąć„¬ ä ©« azk.war"
	set "inputFolder=%in%\azk.war"
	set "outputFolder=%out%\apache_tomcat\webapps"
	set "nextPoint=extract_tomcat_port"
goto :copy_data
									 
:extract_tomcat_port
REM 3.14.1   -
	set "textBlock=„ą„Ø¬„­®¢ė¢ „¬ Æ®ąāė ¢"
	set "fileName=%infile_7%"
	set "fileDirectory=%out%\apache_tomcat\conf"
	set "oldText=%Server_old%"
	set "newText=%ServerNew%"
	set "nextPoint=extract_tomcat_port2"
goto :rename_data

:extract_tomcat_port2
REM 3.14.2     -
	set "fileName=%infile_7%"
	set "fileDirectory=%out%\apache_tomcat\conf"
	set "oldText=%Connector_old%"
	set "newText=%ConnectorNew%"
	set "nextPoint=startweb"
goto :rename_data

:startweb
REM 3.15     azk.war
echo -----------------------------------------------------------------------
echo.
echo  ÆćįŖ „¬ ā®¬Ŗ ā ¤«ļ ą įÆ Ŗ®¢ŖØ azk.war
@echo.>>%logfile%
@echo %DATE% %time:~0,8% :  ÆćįŖ „¬ ā®¬Ŗ ā ¤«ļ ą įÆ Ŗ®¢ŖØ azk.war>>%logfile%
cd /d "%out%"\apache_tomcat\bin\
REM įÆ®«ģ§ćī call, Ø§-§  ā®£®, ēā® Æ®į«„ ¢ėÆ®«­„­Øļ į Ŗ®¬ ­¤®© start, ā„Ŗćé ļ ą ”®ā  bat-­ØŖ  Æą„Ŗą é „āįļ.
call startup.bat

:ask_web_rmi
REM 3.16  RMI-   
echo -----------------------------------------------------------------------
echo.
echo  RMI-   
@echo %DATE% %time:~0,8% : „­ļ„¬ rmi-Æ®ąā ¢ ­ įāą®Ŗ å ā®¬Ŗ ā >>%logfile%
	set question="§¬„­Øāģ Æ®ąā ¢ ä ©«„ "%infile_5%?" [y/n]: "
	set answer=web_rmi
goto :askexit

:web_rmi
echo -----------------------------------------------------------------------
echo.
cd /d "%out%\apache_tomcat\webapps\azk\WEB-INF\"
If exist %infile_5% (
		set "textBlock= ©« ­ įāą®„Ŗ ­ ©¤„­. „ą„Ø¬„­®¢ė¢ „¬ Æ®ąāė ¢"
		set "fileName=%infile_5%"
		set "fileDirectory=%out%\apache_tomcat\webapps\azk\WEB-INF\"
		set "oldText=%RMI_PORT%"
		set "newText=%renRMI%"
		set "nextPoint=ask_drop_war"
	goto :rename_data
) else (
	echo  ©« ­ įāą®„Ŗ ­„ ­ ©¤„­.
		set question="®¢ā®ąØāģ Æ®ØįŖ ä ©«  %infile_5%? [y/n]: "
		set answer=web_rmi
	goto :askexit)

:ask_drop_war
REM 3.17   AZK.WAR   
echo -----------------------------------------------------------------------
echo.
set question="¤ «Øāģ ä ©« azk.war Ø§ į”®ąŖØ ā®¬Ŗ ā ? [y/n]: "
set answer=drop_war
set answer2=ask_start
goto :askexit

:drop_war
cd /d "%out%"\apache_tomcat\bin\
call shutdown.bat
TIMEOUT /T 5 /NOBREAK
cd /d "%out%"\apache_tomcat\webapps
DEL /Q azk.war
If %errorlevel%==0 (call :writer 2 "¤ «„­Ø„ ä ©«  azk.war... įÆ„č­®"
					) else (call :writer 4 "¤ «„­Ø„ ä ©«  azk.war... čØ”Ŗ ")
goto :ask_start

REM 3.18     -
:ask_start
echo -----------------------------------------------------------------------
echo.
set question=" ÆćįāØāģ  %SYS%? [y/n]: "
set answer=startbat
set answer2=1
goto :askexit

REM  ÆćįŖ  
:startbat
cd /d "%out%"
start StartServer.bat
echo ----------------------------------------------------------------------->>%logfile%
@echo %DATE% %time:~0,8% : ”®ąŖ  ¢ėÆ®«­„­  . ėÆ®«­„­ § ÆćįŖ  %SYS%>>%logfile%
call :copyright

REM    .     
:exit_bat
pause
echo ----------------------------------------------------------------------->>%logfile%
if %success%==0 (
	@echo %DATE% %time:~0,8% : ”®ąŖ  ¢ėÆ®«­„­  .  %SYS% ­„ § ÆćįŖ «įļ >>%logfile%) else (
		@echo %DATE% %time:~0,8% : ”®ąŖ  ¢ėÆ®«­„­  į  >>%logfile%)

:copyright
@echo.>>%logfile%
@echo ===========================================================================>>%logfile%
@echo %titleName%>>%logfile%
@echo  į«ćē „ Æą®”«„¬ Ø ¢®Æą®į®¢ ®”ą é āģįļ Ŗ albafoxx (abzaev.albert@gmail.com)>>%logfile%
@echo ===========================================================================>>%logfile%

exit
END