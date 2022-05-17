@echo off
REM “ª §ë¢ ¥¬ ª®¤¨à®¢ªã. ¥®¡å®¤¨¬® ¤«ï ª®¬¯ìîâ¥à å, £¤¥ ¯®-ã¬®«ç ­¨î ¨á¯®«ì§ã¥âáï ¤àã£ ï ª®¤¨à®¢ª 
chcp 866
echo.
REM author : albafoxx (abzaev.albert@gmail.com)

REM  §¢ ­¨¥ ¯à®£à ¬¬ë. ‚¥àá¨ï ¨ ¤ â  à¥«¨§ 
set "titleName=Extract v4.2.15 (2022.05.22) -  ¢â®¬ â¨ç¥áª¨© á¡®àé¨ª áâ¥­¤  €–Š-”¨­ ­áë"
title %titleName%

REM Ž…„…‹Ÿ…Œ ‘’€„€’›… ……Œ…›…/“’ˆ
Set "SYS=€–Š-”¨­ ­áë"
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

REM ‚ë­®á¨¬ ¢ ­ ç «® áªà¨¯â , â ª ª ª ¢ 4 ¯ã­ªâ¥ ¯à®¢¥àª¨ ¢®¯à®á ¡ã¤¥â ¬¥­ïâìáï
set question="à®¤®«¦¨âì ¢ë¯®«­¥­¨¥? [y/n]: "
REM ‡ ¤ ¥¬ §­ ç¥­¨¥ "¯®-ã¬®«ç ­¨î"
set answer2=0

REM ‡ ¤ ¥¬ §­ ç¥­¨¥ "¯®-ã¬®«ç ­¨î" ¤«ï ¯à®¢¥àª¨ ãá¯¥è­®áâ¨ § ¢¥àè¥­¨ï á¡®àª¨ ¨ § ¯¨á¨ ¢ «®£
set success=0

REM ‚›’€‘Šˆ‚€…Œ ……Œ…›…/“’ˆ ˆ‡ ”€‰‹€ €‘’Ž…Š
setlocal DisableDelayedExpansion
set /a c=0
for /f "UseBackQ Delims=" %%A IN (%ini%) do (
  set /a c+=1
  setlocal EnableDelayedExpansion
  If !c!==1 (setlocal DisableDelayedExpansion
			 REM 1. ¤¨à¥ªâ®à¨ï ®âªã¤  ¡¥à¥¬ ä ©«
			 set "in=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==2 (setlocal DisableDelayedExpansion
			 REM 2. ¤¨à¥ªâ®à¨ï £¤¥ á®¡¨à ¥¬ áâ¥­¤
			 set "out=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==3 (setlocal DisableDelayedExpansion
			 REM 3. ¤¨à¥ªâ®à¨ï EIS
			 set "EIS=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==4 (setlocal DisableDelayedExpansion
			 REM 4. ¤¨à¥ªâ®à¨ï Ž’—…’›
			 set "REPORT=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==5 (setlocal DisableDelayedExpansion
			 REM 5. ¤¨à¥ªâ®à¨ï ‘Ž”ˆ’
			 set "SOFIT=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==6 (setlocal DisableDelayedExpansion
			 REM 6. ¤¨à¥ªâ®à¨ï Delphi_XE4_Runtime_BPLs
			 set "DelphiXE=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==7 (setlocal DisableDelayedExpansion
			 REM 7. ¤¨à¥ªâ®à¨ï á ¤®¯®«­¨â¥«ì­ë¬¨ ä ©« ¬¨ ¤«ï á¡®àª¨
			 set "schplanstop=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==8 (setlocal DisableDelayedExpansion
			 REM REM 8. ¤¨à¥ªâ®à¨ï á ¤®¯®«­¨â¥«ì­ë¬¨ ä ©« ¬¨ ¤«ï á¡®àª¨
			 set "azka=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==9 (setlocal DisableDelayedExpansion
			 REM 9. ¤¨à¥ªâ®à¨ï ’ŽŒŠ€’®¬
			 set "tomcat=%%A"
			 setlocal EnableDelayedExpansion
			 endlocal)
  If !c!==10 (REM 10. ®àâ ‘
			  set "renSP=%%A")
  If !c!==11 (rem 11. ®àâ ’®¬ª â 
			  set "renRMI=%%A")
  If !c!==12 (setlocal DisableDelayedExpansion
			  rem 12. ¤¨à¥ªâ®à¨ï ¤®  àå¨¢ â®à 
			  set "winRar=%%A"
			  setlocal EnableDelayedExpansion
			  endlocal)
  If !c!==13 (rem 13. ãâì ¤® „ Firebird
			  set "fbNew=%%A")
  If !c!==14 (rem 14. ãâì ¤® „ Oracle
			  set "oraNew=%%A")
  If !c!==15 (rem 14.1 ãâì ¤® „ Oracle
			  set "oraUrlNew=%%A")
  If !c!==16 (rem 15.  §¬¥à Java-¯ ¬ïâ¨
			  set "javaNew=%%A")
  If !c!==17 (rem 16. ®àâ ­  ª®â®à®¬ § ¯ãáª ¥âáï ¢¥¡-á¥à¢¥à
			  set "ServerNew=%%A")
  If !c!==18 (rem 17. ®àâ ¯® ª®â®à®¬ã ¬®¦­® ¡ã¤¥â ®âªàëâì ¢¥¡-ª«¨¥­â
			  set "ConnectorNew=%%A")
  If !c!==19 (rem 18. ‘¯¨á®ª XML-ä ©«®¢, ¢ ª®â®àëå ­ã¦­® ¨§¬¥­¨âì
			  set "listXML=%%A")
)

REM  §¡¨à ¥¬ áâà®ªã á® á¯¨áª®¬ XML ¨ § ¯¨áë¢ ¥¬ ¢ ®â¤¥«ì­ë¥ ¯¥à¥¬¥­­ë¥ varN
setlocal enabledelayedexpansion
set n=0
for %%i in (%listXML%) do (
	set /a n=!n! + 1
    set var!n!=%%i
)

REM ˆ”ŽŒ€’ˆ‚›‰ ‹ŽŠ „‹Ÿ ‚›‚Ž„€ ‚ ŠŽ‘Ž‹œ
SetLocal DisableDelayedExpansion
echo „¨à¥ªâ®à¨¨:
echo ¡¥à¥¬ íâ «®­ªã ¨§ %in%
echo á®¡¨à ¥¬ §¤¥áì    %out%
echo.
echo -----------------------------------------------------------------------
echo Š®¬¯®­¥­âë ¤«ï á¡®àª¨:
echo …ˆ‘	  %EIS%
echo Žâç¥âë	  %REPORT%
echo ‘Ž”ˆ’	  %SOFIT%
echo ’ŽŒŠ€’	  %tomcat%
echo DelphiXE  %DelphiXE%
echo -----------------------------------------------------------------------
echo.

@echo ‚à¥¬ï á¡®àª¨:     %DATE% %time:~0,8%>%logfile%
@echo ‘®¡¨à ¥¬ á¡®àªã ¢ %out%>>%logfile%
@echo.>>%logfile%
@echo ¥à¥¬ íâ «®­ªã ¨§		%in%>>%logfile%
@echo ˆá¯®«ì§ã¥âáï …ˆ‘		%EIS%>>%logfile%
@echo ˆá¯®«ì§ã¥âáï Žâç¥âë 	%REPORT%>>%logfile%
@echo ˆá¯®«ì§ã¥âáï ‘Ž”ˆ’		%SOFIT%>>%logfile%
@echo ˆá¯®«ì§ã¥âáï ’ŽŒŠ€’		%tomcat%>>%logfile%
@echo ˆá¯®«ì§ã¥âáï DelphiXE	%DelphiXE%>>%logfile%
@echo.>>%logfile%

REM ========== 1.‹ŽŠ ‘ Ž‚…Š€Œˆ (­ ç «®) ==========
REM 1.1.Ž‚…Š€ Ž‘Ž‚›• „ˆ…Š’Žˆ‰
:check_dir
set check_stop=0
echo ¥§ã«ìâ â ¯à®¢¥àª¨ ãª § ­­ëå §­ ç¥­¨©:
echo [„¨à¥ªâ®à¨ï %in%]
If Exist "%in%" (call :writer 2 "+ „¨à¥ªâ®à¨ï á íâ «®­ª®© ­ ©¤¥­ "
) else (call :writer 4 "- „¨à¥ªâ®à¨ï á íâ «®­ª®© ­¥ ­ ©¤¥­ "
		set check_stop=1)
echo [„¨à¥ªâ®à¨ï %EIS%]
If Exist "%EIS%" (call :writer 2 "+ „¨à¥ªâ®à¨ï á …ˆ‘ ­ ©¤¥­ "
) else (call :writer 4 "- „¨à¥ªâ®à¨ï á …ˆ‘ ­¥ ­ ©¤¥­ "
		set check_stop=1)
echo [„¨à¥ªâ®à¨ï %REPORT%]
If Exist "%REPORT%" (call :writer 2 "+ „¨à¥ªâ®à¨ï á ®âç¥â ¬¨ ­ ©¤¥­ "
) else (call :writer 4 "- „¨à¥ªâ®à¨ï á ®âç¥â ¬¨ ­¥ ­ ©¤¥­ "
		set check_stop=1)
echo [„¨à¥ªâ®à¨ï %SOFIT%]
If Exist "%SOFIT%" (call :writer 2 "+ „¨à¥ªâ®à¨ï á á®ä¨â®¬ ­ ©¤¥­ "
) else (call :writer 4 "- „¨à¥ªâ®à¨ï á á®ä¨â®¬ ­¥ ­ ©¤¥­ "
		set check_stop=1)
echo [„¨à¥ªâ®à¨ï %tomcat%]
If Exist "%tomcat%" (call :writer 2 "+ „¨à¥ªâ®à¨ï á â®¬ª â®¬ ­ ©¤¥­ "
) else (call :writer 4 "- „¨à¥ªâ®à¨ï á â®¬ª â®¬ ­¥ ­ ©¤¥­ "
		set check_stop=1)
echo [„¨à¥ªâ®à¨ï %DelphiXE%]
If Exist "%DelphiXE%" (call :writer 2 "+ „¨à¥ªâ®à¨ï á DelphiXE ­ ©¤¥­ "
) else (call :writer 4 "- „¨à¥ªâ®à¨ï á DelphiXE ­¥ ­ ©¤¥­ "
		set check_stop=1)

REM …‘‹ˆ •Ž’œ Ž„ˆ “’œ “Š€‡€ …ŠŽ…Š’Ž - Ž‘’€€‚‹ˆ‚€…Œ ‘ŽŠ“. ‚›„€…Œ ‘ŽŽ™…ˆ….
echo.
If %check_stop%==0 (call :writer E "‚á¥ ãª § ­­ë¥ ¤¨à¥ªâ®à¨¨ ­ ©¤¥­ë. à®¤®«¦ ¥¬ á¡®àªã áâ¥­¤  %SYS%"
				   @echo.>>%logfile%
				   goto :check_out
	) else (call :writer 4 "¥ª®àà¥â­® ãª § ­ë ¤¨à¥ªâ®à¨¨, ­¥®¡å®¤¨¬® ¯à®¢¥à¨âì ¯ãâ¨ ¢ ini-ä ©«¥ [¯®¤à®¡­®áâ¨ ¢ëè¥]. ‘¡®àª  áâ¥­¤  %SYS% ®áâ ­®¢«¥­ ."
			@echo.>>%logfile%
			set success=1
			goto :exit_bat)

REM 1.2.Ž‚…Š€ €‹ˆ—ˆŸ „ˆ…Š’Žˆˆ, ‚ ŠŽ’ŽŽ‰ “„…’ ‘Žˆ€’œ‘Ÿ ‘ŽŠ€
:check_out
If Not Exist "%out%" (
echo.
call :writer E "„¨à¥ªâ®à¨ï, £¤¥ á®¡¨à ¥âáï áâ¥­¤ ­¥ ­ ©¤¥­ . Ž­  ¡ã¤¥â á®§¤ ­ ."
goto :extract
) else (
	echo.
	call :writer E "„¨à¥ªâ®à¨ï, £¤¥ á®¡¨à ¥âáï áâ¥­¤ ã¦¥ á®§¤ ­ . ®¤â¢¥à¤¨â¥ ¯¥à¥§ ¯¨áì ä ©«®¢..."
	goto :ask)

REM 1.3.Ž‚…Š€ € ……‡€ˆ‘œ ”€‰‹Ž‚ ‚ €Š… %OUT%, …‘‹ˆ Ž€ “†… …‘’œ (‘Ž‡„€€)
:ask
set /p ask="®¤â¢¥à¤¨â¥ ¯¥à¥§ ¯¨áì ä ©«®¢ ¢ ¤¨à¥ªâ®à¨¨ "%out%"? [y/n]: "
@echo %DATE% %time:~0,8% : ®¤â¢¥à¤¨â¥ ¯¥à¥§ ¯¨áì ä ©«®¢ ¢ ¤¨à¥ªâ®à¨¨ "%out%"? [y/n]: %ask%>>%logfile%
If %ask%==y (RD /S /Q %out%
			set success=0
			@echo %DATE% %time:~0,8% : ‚ë¯®«­ï¥âáï ®ç¨áâª  ¤¨à¥ªâ®à¨¨ "%out%" ¨ ¯®¢â®à­ ï á¡®àª  €–Š ¢ ãª § ­­®¬ ª â «®£¥...>>%logfile%
			goto :extract
) else (If %ask%==n (
		echo ‘¡®àª  áâ¥­¤  %SYS% ®áâ ­®¢«¥­ .
		@echo %DATE% %time:~0,8% : ‘¡®àª  áâ¥­¤  ®áâ ­®¢«¥­ . „¨à¥ªâ®à¨ï "%out%" ã¦¥ ¡ë«  á®§¤ ­  à ­¥¥...>>%logfile%
		set success=1
		goto :exit_bat
		) else (echo Š®¬ ­¤  ­¥ à á¯®§­ ­ . ®¯à®¡ã©â¥ ¥éñ à §.
				@echo %DATE% %time:~0,8% : Š®¬ ­¤  ­¥ à á¯®§­ ­ . ®¯à®¡ã©â¥ ¥éñ à §...>>%logfile%
				set success=0
				echo.
				goto :ask))

REM 1.4.‚ŽŽ‘ € Ž„Ž‹†…ˆ… ‘ŽŠˆ ‘’…„€, …‘‹ˆ ‚Ž‡ˆŠ…’ Ž˜ˆŠ€ € Ž…„…‹…ŽŒ ’€…
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
		call :writer E "Š®¬ ­¤  ­¥ à á¯®§­ ­ . ®¯à®¡ã©â¥ ¥éñ à §."
		goto :askexit))
REM ========== 1.‹ŽŠ ‘ Ž‚…Š€Œˆ (ª®­¥æ) ==========

REM ========== 2.Ž™ˆ… ŠŽŒ€„› (­ ç «®) ==========
REM 2.1 Ž™ˆ‰ ŽŸ„ŽŠ ŠŽŒ€„ ˆ €‘€ŠŽ‚Š… €•ˆ‚Ž‚ (­ ç «®)
:unzip_data
echo %textblock%
%winRar% x "%zipFile%" -o "%outputFile%" -r -y -ibck
call :check_error
echo -----------------------------------------------------------------------

REM 2.2.Ž™ˆ‰ ŽŸ„ŽŠ ŠŽŒ€„ ˆ ŠŽˆŽ‚€ˆˆ ”€‰‹Ž‚ (­ ç «®)
:copy_data
echo %textblock%
xcopy "%inputFolder%" "%outputFolder%" /i /e /h /y
call :check_error
echo -----------------------------------------------------------------------

REM 2.3 Ž™ˆ‰ ŽŸ„ŽŠ ŠŽŒ€„ ˆ ‡€Œ…… „€›• (­ ç «®)
:rename_data
SetLocal EnableExtensions EnableDelayedExpansion
REM à¥¤¢ à¨â¥«ì­® ã¤ «ï¥¬ áâà®ª¨ á ¯ãáâë¬¨ §­ ç¥­¨ï¬¨ (ä¨ªá ®â § ¯¨á¨ â¥ªáâ  "¥¦¨¬ ¢ë¢®¤  ª®¬ ­¤ ­  íªà ­ (ECHO) ®âª«îç¥­.")
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

REM 2.4 ‹ŽŠ Ž„Žƒ€ŒŒ› „‹Ÿ Ž„‘‚…’Šˆ ‚›‚Ž„€ (­ ç «®)
:color
set c=%1& exit/b
 
:echo
for /f %%i in ('"prompt $h& for %%i in (.) do rem"') do (
  pushd "%~dp0"& <nul>"%~1_" set/p="%%i%%i  "& findstr/a:%c% . "%~1_*"
  (if "%~2" neq "/" echo.)& del "%~1_"& popd& set c=& exit/b
)
echo -----------------------------------------------------------------------

REM 2.5 ‹ŽŠ Ž„Žƒ€ŒŒ› „‹Ÿ ‚›‚Ž„€ ˆ”ŽŒ€–ˆˆ (­ ç «®)
:writer
set massage=%2
call :color %1
call :echo %2
@echo %DATE% %time:~0,8% : %massage:~1,-1% >> %logfile%& exit/b

REM 2.6 ‹ŽŠ Ž„Žƒ€ŒŒ› „‹Ÿ Ž‚…Šˆ, Ž‘‹… ‚›Ž‹…ˆŸ Ž…€–ˆ‰ (­ ç «®)
:check_error
If %errorlevel%==0 (call :writer 2 "%textblock% %fileName%... Ž¯¥à æ¨ï ãá¯¥è­® § ¢¥àè¥­ "
					goto :%nextPoint%) else (call :writer 4 "%textblock% %fileName%... ‚®§­¨ª«¨ ¯à®¡«¥¬ë ¯à¨ ¢ë¯®«­¥­¨¨"
											 set answer=%nextPoint%
											 goto :askexit)
echo -----------------------------------------------------------------------
REM ========== 2.Ž™ˆ… ŠŽŒ€„› (ª®­¥æ) ==========

REM ========== 3.‘ŽŠ€ ‘’…„€ (­ ç «®) =========
:extract
REM 3.1 €‘€ŠŽ‚›‚€…Œ €•ˆ‚ SERVER.ZIP
If not exist "%winRar%" (
    echo ERROR: €àå¨¢ â®à WinRAR ¯® ¯ãâ¨ "%winRar%" ­¥ ­ ©¤¥­. à®¢¥àìâ¥ ¯ãâì, ãª § ­­ë© ¢ ä ©«¥ "%ini%"
	set success=1
	goto :exit_bat
)
	set "textBlock= á¯ ª®¢ë¢ ¥¬  àå¨¢ server.zip"
	set "zipFile=%in%\server.zip"
	set "outputFile=%out%\"
	set "nextPoint=extract_client"
goto :unzip_data

:extract_client
REM 3.2 €‘€ŠŽ‚›‚€…Œ €•ˆ‚ CLIENT.ZIP
	set "textBlock= á¯ ª®¢ë¢ ¥¬  àå¨¢ client.zip"
	set "zipFile=%in%\client.zip"
	set "outputFile=%out%\client"
	set "nextPoint=extract_delphi"
echo à®¢¥àï¥¬ ­ «¨ç¨¥ ¤¨à¥ªâ®à¨¨ client...
If not exist "%out%"\client (
		echo „¨à¥ªâ®à¨ï client ­¥ ®¡­ àã¦¥­ . ‘®§¤ ¥¬ ¤¨à¥ªâ®à¨î client...
		MD "%out%"\client
		goto :unzip_data) else (goto :unzip_data)

:extract_delphi
REM 3.3 „Ž€‚‹Ÿ…Œ DELPHI-ŠŽŒŽ…’› ‚ ¤¨à¥ªâ®à¨î CLIENT
	set "textBlock=„®¡ ¢«ï¥¬ Delphi-ª®¬¯®­¥­âë ¢ ¤¨à¥ªâ®à¨î client"
	set "inputFolder=%DelphiXE%"
	set "outputFolder=%out%\client"
	set "nextPoint=extract_eis"
goto :copy_data

:extract_eis
REM 3.4 ŠŽˆ“…Œ EIS.JAR
	set "textBlock=Š®¯¨àã¥¬ EIS.jar"
	set "inputFolder=%EIS%"
	set "outputFolder=%out%\server"
	set "nextPoint=extract_report"
goto :copy_data

:extract_report
REM 3.5 €‘€ŠŽ‚›‚€…Œ €•ˆ‚ Ž’—…’›
	set "textBlock= á¯ ª®¢ë¢ ¥¬  àå¨¢ Ž’—…’›"
	set "inputFolder=%REPORT%"
	REM „¥« ¥¬ ¯à®¢¥àªã ¤¨à¥ªâ®à¨¨/ àå¨¢ 
	if exist "%REPORT%\*.*" (
		set "zipFile=%REPORT%\*.zip") else (set "zipFile=%REPORT%")
	set "outputFile=%out%\"
	set "nextPoint=extract_sofit"
goto :unzip_data

:extract_sofit
REM 3.6 €‘€ŠŽ‚›‚€…Œ €•ˆ‚ ‘Ž”ˆ’
	set "textBlock= á¯ ª®¢ë¢ ¥¬  àå¨¢ ‘Ž”ˆ’"
	set "inputFolder=%SOFIT%"
	REM „¥« ¥¬ ¯à®¢¥àªã ¤¨à¥ªâ®à¨¨/ àå¨¢ 
	if exist "%SOFIT%\*.*" (
		set "zipFile=%SOFIT%\*.zip") else (set "zipFile=%SOFIT%")
	set "outputFile=%out%\"
	set "nextPoint=extract_shplan"
goto :unzip_data

:extract_shplan
REM 3.7 „Ž€‚‹Ÿ…Œ ”€‰‹› SCHPLANSTOP
	set "textBlock=„®¡ ¢«ï¥¬ ä ©«ë schplanstop"
	set "inputFolder=%schplanstop%"
	set "outputFolder=%out%\SQL"
	set "nextPoint=extract_azkabat"
goto :copy_data

:extract_azkabat
REM 3.8 „Ž€‚‹Ÿ…Œ ”€‰‹› AZKA.BAT
	set "textBlock=„®¡ ¢«ï¥¬ ä ©«ë azka.bat"
	set "inputFolder=%azka%"
	set "outputFolder=%out%"
	set "nextPoint=extract_port"
goto :copy_data

:extract_port
REM 3.9 ……ˆŒ…Ž‚›‚€…Œ Ž’›
	set "textBlock=¥à¥¨¬¥­®¢ë¢ ¥¬ ¯®àâë ¢"
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
REM 3.10 Œ…Ÿ…Œ “’œ „Ž „ FIREBIRD ‚ AZK2SERVER.PROPERTIES
	set "textBlock=Œ¥­ï¥¬ ¯ãâì ¤® „ Firebird ¢"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%fb_old%"
	set "newText=%fbNew%"
	set "nextPoint=extract_db2"
goto :rename_data

:extract_db2
REM 3.11.1 Œ…Ÿ…Œ “’œ „Ž „ ORACLE ‚ AZK2SERVER.PROPERTIES
	set "textBlock=Œ¥­ï¥¬ ¯ãâì ¤® „ Oracle ¢"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%ora_old%"
	set "newText=%oraNew%"
	set "nextPoint=extract_db3"
goto :rename_data

:extract_db3
REM 3.11.2 Œ…Ÿ…Œ “’œ „Ž „ ORACLE ‚ AZK2SERVER.PROPERTIES
	set "textBlock=Œ¥­ï¥¬ ¯ãâì ¤® „ Oracle ¢"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%ora_url_old%"
	set "newText=%oraUrlNew%"
	set "nextPoint=extract_xml"
goto :rename_data

:extract_xml
setlocal EnableDelayedExpansion
REM 3.12 Œ…Ÿ…Œ ACTION="PERFORM" € ACTION="SYNCHRONIZE"
call :writer E "‚ë¯®«­ï¥¬ ¨§¬¥­¥­¨¥ action ¢ XML. Ž¯à¥¤¥«¥­® %n% xml-ä ©« ..."
for /L %%s in (1,1,%n%) do (
	set param=var%%s
	set v1=%%s
	call :extract_listXML !param!
)
goto :extract_Xmx

:extract_listXML
	set "textBlock=Œ¥­ï¥¬ action ¢"
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
REM 3.13 Œ…Ÿ…Œ €‡Œ… ‚›„…‹…Ž‰ €ŒŸ’ˆ „‹Ÿ JAVA
	set "textBlock=Œ¥­ï¥¬ à §¬¥à ¢ë¤¥«¥­®© ¯ ¬ïâ¨ ¤«ï JAVA ¢ ä ©«¥"
	set "fileName=%infile_6%"
	set "fileDirectory=%out%\server\bin"
	set "oldText=%Jram_old%"
	set "newText=%javaNew%"
	set "nextPoint=extract_tomcat"
goto :rename_data

:extract_tomcat
REM 3.14 „Ž€‚‹Ÿ…Œ ‘ŽŠ“ ’ŽŒŠ€’€, Ž„Š‹€„›‚€…Œ AZK.WAR
	set "textBlock=Š®¯¨àã¥¬ á¡®àªã TOMCAT"
	set "fileName="
	set "inputFolder=%tomcat%"
	set "outputFolder=%out%\apache_tomcat"
	set "nextPoint=extract_tomcat2"
goto :copy_data

:extract_tomcat2
REM 3.14 „Ž€‚‹Ÿ…Œ ‘ŽŠ“ ’ŽŒŠ€’€, Ž„Š‹€„›‚€…Œ AZK.WAR
	set "textBlock=Š®¯¨àã¥¬ ä ©« azk.war"
	set "inputFolder=%in%\azk.war"
	set "outputFolder=%out%\apache_tomcat\webapps"
	set "nextPoint=extract_tomcat_port"
goto :copy_data
									 
:extract_tomcat_port
REM 3.14.1 Œ…Ÿ…Œ Ž’ ‚…-‘…‚…€
	set "textBlock=¥à¥¨¬¥­®¢ë¢ ¥¬ ¯®àâë ¢"
	set "fileName=%infile_7%"
	set "fileDirectory=%out%\apache_tomcat\conf"
	set "oldText=%Server_old%"
	set "newText=%ServerNew%"
	set "nextPoint=extract_tomcat_port2"
goto :rename_data

:extract_tomcat_port2
REM 3.14.2 Œ…Ÿ…Œ Ž’ „‹Ÿ „Ž‘’“€ ‚…-ˆ‹Ž†…ˆŸ
	set "fileName=%infile_7%"
	set "fileDirectory=%out%\apache_tomcat\conf"
	set "oldText=%Connector_old%"
	set "newText=%ConnectorNew%"
	set "nextPoint=startweb"
goto :rename_data

:startweb
REM 3.15 ‡€“‘Š€…Œ ’ŽŒŠ€’ „‹Ÿ €‘€ŠŽ‚Šˆ azk.war
echo -----------------------------------------------------------------------
echo.
echo ‡ ¯ãáª ¥¬ â®¬ª â ¤«ï à á¯ ª®¢ª¨ azk.war
@echo.>>%logfile%
@echo %DATE% %time:~0,8% : ‡ ¯ãáª ¥¬ â®¬ª â ¤«ï à á¯ ª®¢ª¨ azk.war>>%logfile%
cd /d "%out%"\apache_tomcat\bin\
REM ˆá¯®«ì§ãî call, ¨§-§  â®£®, çâ® ¯®á«¥ ¢ë¯®«­¥­¨ï á ª®¬ ­¤®© start, â¥ªãé ï à ¡®â  bat-­¨ª  ¯à¥ªà é ¥âáï.
call startup.bat

:ask_web_rmi
REM 3.16 Œ…Ÿ…Œ RMI-Ž’ ‚ €‘’ŽŠ€• ’ŽŒŠ€’€
echo -----------------------------------------------------------------------
echo.
echo Œ…Ÿ…Œ RMI-Ž’ ‚ €‘’ŽŠ€• ’ŽŒŠ€’€
@echo %DATE% %time:~0,8% : Œ¥­ï¥¬ rmi-¯®àâ ¢ ­ áâà®ª å â®¬ª â >>%logfile%
	set question="ˆ§¬¥­¨âì ¯®àâ ¢ ä ©«¥ "%infile_5%?" [y/n]: "
	set answer=web_rmi
goto :askexit

:web_rmi
echo -----------------------------------------------------------------------
echo.
cd /d "%out%\apache_tomcat\webapps\azk\WEB-INF\"
If exist %infile_5% (
		set "textBlock=” ©« ­ áâà®¥ª ­ ©¤¥­. ¥à¥¨¬¥­®¢ë¢ ¥¬ ¯®àâë ¢"
		set "fileName=%infile_5%"
		set "fileDirectory=%out%\apache_tomcat\webapps\azk\WEB-INF\"
		set "oldText=%RMI_PORT%"
		set "newText=%renRMI%"
		set "nextPoint=ask_drop_war"
	goto :rename_data
) else (
	echo ” ©« ­ áâà®¥ª ­¥ ­ ©¤¥­.
		set question="®¢â®à¨âì ¯®¨áª ä ©«  %infile_5%? [y/n]: "
		set answer=web_rmi
	goto :askexit)

:ask_drop_war
REM 3.17 “„€‹ˆ’œ ”€‰‹ AZK.WAR ˆ‡ ‘ŽŠˆ ’ŽŒŠ€’€
echo -----------------------------------------------------------------------
echo.
set question="“¤ «¨âì ä ©« azk.war ¨§ á¡®àª¨ â®¬ª â ? [y/n]: "
set answer=drop_war
set answer2=ask_start
goto :askexit

:drop_war
cd /d "%out%"\apache_tomcat\bin\
call shutdown.bat
TIMEOUT /T 5 /NOBREAK
cd /d "%out%"\apache_tomcat\webapps
DEL /Q azk.war
If %errorlevel%==0 (call :writer 2 "“¤ «¥­¨¥ ä ©«  azk.war... “á¯¥è­®"
					) else (call :writer 4 "“¤ «¥­¨¥ ä ©«  azk.war... Žè¨¡ª ")
goto :ask_start

REM 3.18 Ž‚…Š€ € ‡€“‘Š ‘ €–Š-”ˆ€‘›
:ask_start
echo -----------------------------------------------------------------------
echo.
set question="‡ ¯ãáâ¨âì ‘ %SYS%? [y/n]: "
set answer=startbat
set answer2=1
goto :askexit

REM ‡ ¯ãáª ‘ €–Š
:startbat
cd /d "%out%"
echo ----------------------------------------------------------------------->>%logfile%
@echo %DATE% %time:~0,8% : ‘¡®àª  ¢ë¯®«­¥­  “‘…˜Ž. ‚ë¯®«­¥­ § ¯ãáª ‘ %SYS%>>%logfile%
call :copyright
call StartServer.bat

REM „…‹€…Œ Ž‘’€Ž‚Š“ ……„ ‚›•Ž„ŽŒ. Ž‘‹… —…ƒŽ ‚›•Ž„ˆŒ ˆ‡ Žƒ€ŒŒ›
:exit_bat
pause
echo ----------------------------------------------------------------------->>%logfile%
if %success%==0 (
	@echo %DATE% %time:~0,8% : ‘¡®àª  ¢ë¯®«­¥­  “‘…˜Ž. ‘ %SYS% ­¥ § ¯ãáª «áï >>%logfile%) else (
		@echo %DATE% %time:~0,8% : ‘¡®àª  ¢ë¯®«­¥­  á Ž˜ˆŠ€Œˆ >>%logfile%)

:copyright
@echo.>>%logfile%
@echo ===========================================================================>>%logfile%
@echo %titleName%>>%logfile%
@echo ‚ á«ãç ¥ ¯à®¡«¥¬ ¨ ¢®¯à®á®¢ ®¡à é âìáï ª albafoxx (abzaev.albert@gmail.com)>>%logfile%
@echo ===========================================================================>>%logfile%

exit
END