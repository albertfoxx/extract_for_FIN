@echo off

REM ą®įā ¢«ļ„¬ Ŗ®¤Øą®¢Ŗć. ®¦„ā ”ėāģ, ēā® ÆąØ § ÆćįŖ„ Æą®£ą ¬¬ė ”ć¤ćā ®čØ”ŖØ, į¢ļ§ ­­ė„ į ­„¢®§¬®¦­®įāģī ®Æą„¤„«Øāģ ÆćāØ
chcp 866
REM  §¢ ­Ø„ Æą®£ą ¬¬ė. „ąįØļ Ø ¤ ā  ą„«Ø§ 
title Extract v4.X(2021.08.30) -  ¢ā®¬ āØē„įŖØ© į”®ąéØŖ įā„­¤  -Ø­ ­įė
REM author: albafoxx (abzaev.albert@gmail.com)

REM   /
Set "SYS=-Ø­ ­įė"
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

REM ą®ÆØįė¢ „¬ xml-ä ©«ė, ¢ Ŗ®ā®ąėå ¬„­ļ„¬ "action"
Set "operkind=operkind.xml"
Set "unidoctype=unidoctype.xml"
Set "serverprocessor=serverprocessor.xml"

REM ė­®įØ¬ ¢ ­ ē «® bat, ā Ŗ Ŗ Ŗ ¢ 4 Æć­Ŗā„ Æą®¢„ąŖØ ¢®Æą®į ”ć¤„ā ¬„­ļāģįļ
set question="ą®¤®«¦Øāģ ¢ėÆ®«­„­Ø„? [y/n]: "
REM  ¤ „¬ §­ ē„­Ø„ "Æ®-ć¬®«ē ­Øī"
set answer2=0

REM  /   
SetLocal EnableDelayedExpansion
set /a c=0
for /f "UseBackQ Delims=" %%A IN (%ini%) do (
  set /a c+=1
  If !c!==1  set "in=%%A"			rem 1. ¤Øą„Ŗā®ąØļ ®āŖć¤  ”„ą„¬ ä ©«
  If !c!==2  set "out=%%A"			rem 2. ¤Øą„Ŗā®ąØļ £¤„ į®”Øą „¬ įā„­¤
  If !c!==3  set "EIS=%%A"			rem 3. ¤Øą„Ŗā®ąØļ EIS
  If !c!==4  set "REPORT=%%A"		rem 4. ¤Øą„Ŗā®ąØļ 
  If !c!==5  set "SOFIT=%%A"		rem 5. ¤Øą„Ŗā®ąØļ 
  If !c!==6  set "DelphiXE=%%A"		rem 6. ¤Øą„Ŗā®ąØļ Delphi_XE4_Runtime_BPLs_
  If !c!==7  set "schplanstop=%%A"	rem 7. ¤Øą„Ŗā®ąØļ į ¤®Æ®«­Øā„«ģ­ė¬Ø ä ©« ¬Ø ¤«ļ į”®ąŖØ
  If !c!==8  set "azka=%%A"			rem 8. ¤Øą„Ŗā®ąØļ į ¤®Æ®«­Øā„«ģ­ė¬Ø ä ©« ¬Ø ¤«ļ į”®ąŖØ
  If !c!==9  set "tomcat=%%A"		rem 9. ¤Øą„Ŗā®ąØļ ®¬
  If !c!==10 set "renSP=%%A"		rem 10. ®ąā 
  If !c!==11 set "renRMI=%%A"		rem 11. ®ąā ®¬Ŗ ā 
  If !c!==12 set "winRar=%%A"		rem 12. ¤Øą„Ŗā®ąØļ ¤®  ąåØ¢ ā®ą 
  If !c!==13 set "fbNew=%%A"		rem 13. ćāģ ¤®  Firebird
  If !c!==14 set "oraNew=%%A"		rem 14. ćāģ ¤®  Oracle
  If !c!==15 set "javaNew=%%A"		rem 15.  §¬„ą Java-Æ ¬ļāØ
)

REM      
echo Øą„Ŗā®ąØØ:
echo ”„ą„¬ ķā «®­Ŗć Ø§ %in%
echo į®”Øą „¬ §¤„įģ    %out%
echo -----------------------------------------------------------------------
echo       %EIS%
echo āē„āė   %REPORT%
echo     %SOFIT%
echo    %tomcat%
echo DelphiXE %DelphiXE%
echo -----------------------------------------------------------------------
echo.

REM ========== 1.   (­ ē «®) ==========
REM 1.1.  
:check_dir
set check_stop=0
If Exist "%in%" ( echo + Øą„Ŗā®ąØļ "%in:~37%" ­ ©¤„­ .
) else (echo - Øą„Ŗā®ąØļ "%in:~37%" ­„ ­ ©¤„­ .
		set check_stop=1)
If Exist "%EIS%" ( echo + Øą„Ŗā®ąØļ "%EIS:~37%" ­ ©¤„­ .
) else (echo - Øą„Ŗā®ąØļ "%EIS:~37%" ­„ ­ ©¤„­ .
		set check_stop=1)
If Exist "%REPORT%" ( echo + Øą„Ŗā®ąØļ "%REPORT:~37%" ­ ©¤„­ .
) else (echo - Øą„Ŗā®ąØļ "%REPORT:~37%" ­„ ­ ©¤„­ .
		set check_stop=1)
If Exist "%SOFIT%" ( echo + Øą„Ŗā®ąØļ "%SOFIT:~37%" ­ ©¤„­ .
) else (echo - Øą„Ŗā®ąØļ "%SOFIT:~37%" ­„ ­ ©¤„­ .
		set check_stop=1)
If Exist "%tomcat%" ( echo + Øą„Ŗā®ąØļ "%tomcat:~43%" ­ ©¤„­ .
) else (echo - Øą„Ŗā®ąØļ "%tomcat:~43%" ­„ ­ ©¤„­ .
		set check_stop=1)
If Exist "%DelphiXE%" ( echo + Øą„Ŗā®ąØļ "%DelphiXE:~43%" ­ ©¤„­ .
) else (echo - Øą„Ŗā®ąØļ "%DelphiXE:~43%" ­„ ­ ©¤„­ . 
		set check_stop=1)
echo.
REM       -  .  .
If %check_stop%==0 (echo į„ ćŖ § ­­ė„ ¤Øą„Ŗā®ąØØ ­ ©¤„­ė. ą®¤®«¦ „¬ į”®ąŖć įā„­¤  %SYS% 
	goto :check_out
	) else (echo „Ŗ®ąą„ā­® ćŖ § ­ė ¤Øą„Ŗā®ąØØ, ­„®”å®¤Ø¬® Æą®¢„ąØāģ ÆćāØ ¢ ini-ä ©«„ [Æ®¤ą®”­®įāØ ¢ėč„]. ”®ąŖ  įā„­¤  %SYS% ®įā ­®¢«„­ .
pause
goto :exit_bat)

REM 1.2.  ,     
:check_out
If Not Exist "%out%" (
echo.
echo Øą„Ŗā®ąØļ "%out%" ­„ ­ ©¤„­ . ­  ”ć¤„ā į®§¤ ­ .
goto :extract
) else (
	echo.
	echo Øą„Ŗā®ąØļ "%out%" ć¦„ į®§¤ ­ .
	goto :ask)

REM 1.3.      %OUT%,     ()
:ask
set /p ask="®¤ā¢„ą¤Øā„ Æ„ą„§ ÆØįģ ä ©«®¢ ¢ ¤Øą„Ŗā®ąØØ "%out%"? [y/n]: "
If %ask%==y (RD /S /Q %out%
			goto :extract
) else (If %ask%==n (
		echo ”®ąŖ  įā„­¤  %SYS% ®įā ­®¢«„­ .
		goto :exit_bat
		) else (echo ®¬ ­¤  ­„ ą įÆ®§­ ­ . ®Æą®”ć©ā„ „éń ą §.
				echo.
				goto :ask))

REM 1.4.    ,      
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
		echo ®¬ ­¤  ­„ ą įÆ®§­ ­ . ®Æą®”ć©ā„ „éń ą §.
		pause
		goto :askexit))
REM ========== 1.   (Ŗ®­„ę) ==========

REM ========== 2.  (­ ē «®) ==========
REM 2.1       (­ ē «®)
:unzip_data
echo %textblock%
%winRar% x "%zipFile%" -o "%outputFile%" -r -y -ibck
If %errorlevel%==0 (Echo "- - - Æ„ą ęØļ ćįÆ„č­® § ¢„ąč„­ . - - -"
					goto :%nextPoint%) else (Echo "- - - ®§­ØŖ«Ø Æą®”«„¬ė ÆąØ ¢ėÆ®«­„­ØØ. - - -" 
										 set answer=%nextPoint%
										 goto :askexit)
echo -----------------------------------------------------------------------

REM 2.2.      (­ ē «®)
:copy_data
echo %textblock%
xcopy "%inputFolder%" "%outputFolder%" /i /e /h /y
If %errorlevel%==0 (Echo "- - - Æ„ą ęØļ ćįÆ„č­® § ¢„ąč„­ . - - -"
					goto :%nextPoint%) else (Echo "- - - ®§­ØŖ«Ø Æą®”«„¬ė ÆąØ ¢ėÆ®«­„­ØØ. - - -" 
										 set answer=%nextPoint%
										 goto :askexit)
echo -----------------------------------------------------------------------

REM 2.3.      (­ ē «®)
:rename_data
setlocal enabledelayedexpansion
REM ą„¤¢ ąØā„«ģ­® ć¤ «ļ„¬ įāą®ŖØ į Æćįāė¬Ø §­ ē„­Øļ¬Ø (äØŖį ®ā § ÆØįØ ā„Ŗįā  "„¦Ø¬ ¢ė¢®¤  Ŗ®¬ ­¤ ­  ķŖą ­ (ECHO) ®āŖ«īē„­.")
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
del %tempFile%
If %errorlevel%==0 (Echo "- - - Æ„ą ęØļ ćįÆ„č­® § ¢„ąč„­ . - - -"
					goto :%nextPoint%) else (Echo "- - - ®§­ØŖ«Ø Æą®”«„¬ė ÆąØ ¢ėÆ®«­„­ØØ. - - -" 
										set answer=%nextPoint%
										goto :askexit)
echo -----------------------------------------------------------------------
REM ========== 2.  (Ŗ®­„ę) ==========

REM ========== 3.  (­ ē «®) =========
:extract
REM 3.1.  SERVER.ZIP
If not exist "%winRar%" (
    echo ERROR: ąåØ¢ ā®ą WinRAR Æ® ÆćāØ "%winRar%" ­„ ­ ©¤„­. ą®¢„ąģā„ Æćāģ, ćŖ § ­­ė© ¢ ä ©«„ "%ini%"
	pause
	goto :exit_bat
)
	set "textBlock= įÆ Ŗ®¢ė¢ „¬  ąåØ¢ server.zip ..."
	set "zipFile=%in%\server.zip"
	set "outputFile=%out%\"
	set "nextPoint=extract_client"
goto :unzip_data

:extract_client
REM 3.2.  CLIENT.ZIP
	set "textBlock= įÆ Ŗ®¢ė¢ „¬  ąåØ¢ client.zip ..."
	set "zipFile=%in%\client.zip"
	set "outputFile=%out%\client"
	set "nextPoint=extract_delphi"
echo ą®¢„ąļ„¬ ­ «ØēØ„ ¤Øą„Ŗā®ąØØ client ...
If not exist "%out%"\client (
		echo Øą„Ŗā®ąØļ client ­„ ®”­ ąć¦„­ . ®§¤ „¬ ¤Øą„Ŗā®ąØī client...
		MD "%out%"\client
		goto :unzip_data) else (goto :unzip_data)

:extract_delphi
REM 3.3. DELPHI-  ¤Øą„Ŗā®ąØī CLIENT
	set "textBlock=®” ¢«ļ„¬ Delphi-Ŗ®¬Æ®­„­āė ¢ ¤Øą„Ŗā®ąØī client ..."
	set "inputFolder=%DelphiXE%"
	set "outputFolder=%out%\client"
	set "nextPoint=extract_eis"
goto :copy_data

:extract_eis
REM 3.4. EIS.JAR
	set "textBlock=®ÆØąć„¬ EIS.jar ..."
	set "inputFolder=%EIS%"
	set "outputFolder=%out%\server"
	set "nextPoint=extract_report"
goto :copy_data

:extract_report
REM 3.5.  
	set "textBlock= įÆ Ŗ®¢ė¢ „¬  ąåØ¢  ..."
	set "inputFolder=%REPORT%"
	REM „« „¬ Æą®¢„ąŖć ¤Øą„Ŗā®ąØØ/ ąåØ¢ 
	if exist %SOFIT%\ (
		set "zipFile=%REPORT%\*.zip"
	) else (
		set zipFile=%REPORT%
	)
	set "outputFile=%out%\"
	set "nextPoint=extract_sofit"
goto :unzip_data

:extract_sofit
REM 3.6.  
	set "textBlock= įÆ Ŗ®¢ė¢ „¬  ąåØ¢  ..."
	set "inputFolder=%SOFIT%"
	REM „« „¬ Æą®¢„ąŖć ¤Øą„Ŗā®ąØØ/ ąåØ¢ 
	if exist %SOFIT%\ (
		set "zipFile=%SOFIT%\*.zip"
	) else (
		set zipFile=%SOFIT%
	)
	set "outputFile=%out%\"
	set "nextPoint=extract_shplan"
goto :unzip_data

:extract_shplan
REM 3.7.  SCHPLANSTOP
	set "textBlock=®” ¢«ļ„¬ ä ©«ė schplanstop..."
	set "inputFolder=%schplanstop%"
	set "outputFolder=%out%\SQL"
	set "nextPoint=extract_azkabat"
goto :copy_data

:extract_azkabat
REM 3.8.  AZKA.BAT
	set "textBlock=®” ¢«ļ„¬ ä ©«ė azka.bat ..."
	set "inputFolder=%azka%"
	set "outputFolder=%out%"
	set "nextPoint=extract_port"
goto :copy_data

:extract_port
REM 3.9.  
	set "textBlock=„ą„Ø¬„­®¢ė¢ „¬ Æ®ąāė ¢ "
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
REM 3.10.    FIREBIRD  AZK2SERVER.PROPERTIES
	set "textBlock=„­ļ„¬ Æćāģ ¤®  Firebird ¢"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%fb_old%"
	set "newText=%fbNew%"
	set "nextPoint=extract_db2"
goto :rename_data

:extract_db2
REM 3.11.    ORACLE  AZK2SERVER.PROPERTIES
	set "textBlock=„­ļ„¬ Æćāģ ¤®  Oracle ¢"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%ora_old%"
	set "newText=%oraNew%"
	set "nextPoint=extract_xm1"
goto :rename_data

:extract_xm1
REM 3.12.1. ACTION="PERFORM"  ACTION="SYNCHRONIZE"
	set "textBlock=„­ļ„¬ action ¢"
	set "fileName=%operkind%"
	set "fileDirectory=%out%\XML"
	set "oldText=perform"
	set "newText=synchronize"
	set "nextPoint=extract_xm2"
goto :rename_data

:extract_xm2
REM 3.12.2. ACTION="PERFORM"  ACTION="SYNCHRONIZE"
	set "fileName=%unidoctype%"
	set "fileDirectory=%out%\XML"
	set "oldText=perform"
	set "newText=synchronize"
	set "nextPoint=extract_xm3"
goto :rename_data

:extract_xm3
REM 3.12.2. ACTION="PERFORM"  ACTION="SYNCHRONIZE"
	REM set "fileName=%serverprocessor%"
	REM set "fileDirectory=%out%\XML"
	REM set "oldText=perform"
	REM set "newText=synchronize"
	REM set "nextPoint=extract_Xmx"
REM goto :rename_data

:extract_Xmx
REM 3.13.     JAVA
	set "textBlock=„­ļ„¬ ą §¬„ą ¢ė¤„«„­®© Æ ¬ļāØ ¤«ļ JAVA ¢ ä ©«„"
	set "fileName=%infile_6%"
	set "fileDirectory=%out%\server\bin"
	set "oldText=%Jram_old%"
	set "newText=%javaNew%"
	set "nextPoint=extract_tomcat"
goto :rename_data

:extract_tomcat
REM 3.14.  ,  AZK.WAR
echo ®ÆØąć„¬ į”®ąŖć TOMCAT
xcopy "%tomcat%" "%out%"\apache_tomcat /i /e /h /y
echo ®ÆØąć„¬ ä ©« azk.war
xcopy "%in%"\azk.war "%out%"\apache_tomcat\webapps /i /e /h /y
If %errorlevel%==0 (Echo "- - - Æ„ą ęØļ ćįÆ„č­® § ¢„ąč„­ . - - -") else (Echo "- - - ®§­ØŖ«Ø Æą®”«„¬ė ÆąØ ¢ėÆ®«­„­ØØ. - - -" 
																	set answer=startweb
																	goto :askexit)

:startweb
REM 3.15.    azk.war
echo -----------------------------------------------------------------------
echo.
echo     azk.war
cd /d "%out%"\apache_tomcat\bin\
REM įÆ®«ģ§ćī call, Ø§-§  ā®£®, ēā® Æ®į«„ ¢ėÆ®«­„­Øļ į Ŗ®¬ ­¤®© start, ā„Ŗćé ļ ą ”®ā  bat-­ØŖ  Æą„Ŗą é „āįļ.
call startup.bat

:ask_web_rmi
REM 3.16. RMI-   
echo -----------------------------------------------------------------------
echo.
echo  RMI-   
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
REM 3.17.  AZK.WAR   
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
If %errorlevel%==0 (Echo "- - - Æ„ą ęØļ ćįÆ„č­® § ¢„ąč„­ . - - -") else (Echo "- - - ®§­ØŖ«Ø Æą®”«„¬ė ÆąØ ¢ėÆ®«­„­ØØ. - - -" )
goto :ask_start

REM 3.18.ą®¢„ąŖ  ­  § ÆćįŖ  -Ø­ ­įė
:ask_start
echo -----------------------------------------------------------------------
echo.
set answer2=1
set question=" ÆćįāØāģ  %SYS%? [y/n]: "
set answer=startbat
goto :askexit

REM  ÆćįŖ  
:startbat
cd /d "%out%"
call StartServer.bat

REM „« „¬ ®įā ­®¢Ŗć Æ„ą„¤ ¢ėå®¤®¬. ®į«„ ē„£® ¢ėå®¤Ø¬ Ø§ Æą®£ą ¬¬ė
pause
:exit_bat
exit

END