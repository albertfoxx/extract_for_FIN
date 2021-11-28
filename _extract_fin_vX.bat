@echo off
REM Название программы. Версия и дата релиза
title Extract v4.0(2021.10.11) - автоматический сборщик стенда АЦК-Финансы
REM author : albafoxx (abzaev.albert@gmail.com)

REM Указываем кодировку. Необходимо для компьютерах, где по-умолчанию используется другая кодировка
chcp 866
echo.

REM ОПРЕДЕЛЯЕМ СТАНДАРТНЫЕ ПЕРЕМЕННЫЕ/ПУТИ
Set "SYS=АЦК-Финансы"
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

REM Прописываем xml-файлы, в которых меняем "action"
Set "operkind=operkind.xml"
Set "unidoctype=unidoctype.xml"
Set "serverprocessor=serverprocessor.xml"

REM Выносим в начало bat, так как в 4 пункте проверки вопрос будет меняться
set question="Продолжить выполнение? [y/n]: "
REM Задаем значение "по-умолчанию"
set answer2=0

REM ВЫТАСКИВАЕМ ПЕРЕМЕННЫЕ/ПУТИ ИЗ ФАЙЛА НАСТРОЕК
SetLocal EnableDelayedExpansion
set /a c=0
for /f "UseBackQ Delims=" %%A IN (%ini%) do (
  set /a c+=1
  If !c!==1  set "in=%%A"			rem 1. директория откуда берем файл
  If !c!==2  set "out=%%A"			rem 2. директория где собираем стенд
  If !c!==3  set "EIS=%%A"			rem 3. директория EIS
  If !c!==4  set "REPORT=%%A"		rem 4. директория ОТЧЕТЫ
  If !c!==5  set "SOFIT=%%A"		rem 5. директория СОФИТ
  If !c!==6  set "DelphiXE=%%A"		rem 6. директория Delphi_XE4_Runtime_BPLs_
  If !c!==7  set "schplanstop=%%A"	rem 7. директория с дополнительными файлами для сборки
  If !c!==8  set "azka=%%A"			rem 8. директория с дополнительными файлами для сборки
  If !c!==9  set "tomcat=%%A"		rem 9. директория ТОМКАТом
  If !c!==10 set "renSP=%%A"		rem 10. Порт СП
  If !c!==11 set "renRMI=%%A"		rem 11. Порт Томката
  If !c!==12 set "winRar=%%A"		rem 12. директория до архиватора
  If !c!==13 set "fbNew=%%A"		rem 13. Путь до БД Firebird
  If !c!==14 set "oraNew=%%A"		rem 14. Путь до БД Oracle
  If !c!==15 set "javaNew=%%A"		rem 15. Размер Java-памяти
)

REM ИНФОРМАТИВНЫЙ БЛОК ДЛЯ ВЫВОДА В КОНСОЛЬ
echo Директории:
echo берем эталонку из %in%
echo собираем здесь    %out%
echo -----------------------------------------------------------------------
echo ЕИС      %EIS%
echo Отчеты   %REPORT%
echo СОФИТ    %SOFIT%
echo ТОМКАТ   %tomcat%
echo DelphiXE %DelphiXE%
echo -----------------------------------------------------------------------
echo.

REM ========== 1.БЛОК С ПРОВЕРКАМИ (начало) ==========
REM 1.1.ПРОВЕРКА ОСНОВНЫХ ДИРЕКТОРИЙ
:check_dir
set check_stop=0
If Exist "%in%" ( echo + Директория "%in%" найдена.
) else (echo - Директория "%in%" не найдена.
		set check_stop=1)
If Exist "%EIS%" ( echo + Директория "%EIS%" найдена.
) else (echo - Директория "%EIS%" не найдена.
		set check_stop=1)
If Exist "%REPORT%" ( echo + Директория "%REPORT%" найдена.
) else (echo - Директория "%REPORT%" не найдена.
		set check_stop=1)
If Exist "%SOFIT%" ( echo + Директория "%SOFIT%" найдена.
) else (echo - Директория "%SOFIT%" не найдена.
		set check_stop=1)
If Exist "%tomcat%" ( echo + Директория "%tomcat%" найдена.
) else (echo - Директория "%tomcat%" не найдена.
		set check_stop=1)
If Exist "%DelphiXE%" ( echo + Директория "%DelphiXE%" найдена.
) else (echo - Директория "%DelphiXE%" не найдена. 
		set check_stop=1)
echo.
REM ЕСЛИ ХОТЬ ОДИН ПУТЬ УКАЗАН НЕКОРРЕКТНО - ОСТАНАВЛИВАЕМ СБОРКУ. ВЫДАЕМ СООБЩЕНИЕ.
If %check_stop%==0 (echo Все указанные директории найдены. Продолжаем сборку стенда %SYS% 
	goto :check_out
	) else (echo Некорретно указаны директории, необходимо проверить пути в ini-файле [подробности выше]. Сборка стенда %SYS% остановлена.
pause
goto :exit_bat)

REM 1.2.ПРОВЕРКА НАЛИЧИЯ ДИРЕКТОРИИ, В КОТОРОЙ БУДЕТ СОБИРАТЬСЯ СБОРКА
:check_out
If Not Exist "%out%" (
echo.
echo Директория "%out%" не найдена. Она будет создана.
goto :extract
) else (
	echo.
	echo Директория "%out%" уже создана.
	goto :ask)

REM 1.3.ПРОВЕРКА НА ПЕРЕЗАПИСЬ ФАЙЛОВ В ПАПКЕ %OUT%, ЕСЛИ ОНА УЖЕ ЕСТЬ (СОЗДАНА)
:ask
set /p ask="Подтвердите перезапись файлов в директории "%out%"? [y/n]: "
If %ask%==y (RD /S /Q %out%
			goto :extract
) else (If %ask%==n (
		echo Сборка стенда %SYS% остановлена.
		goto :exit_bat
		) else (echo Команда не распознана. Попробуйте ещё раз.
				echo.
				goto :ask))

REM 1.4.ВОПРОС НА ПРОДОЛЖЕНИЕ СБОРКИ СТЕНДА, ЕСЛИ ВОЗНИКНЕТ ОШИБКА НА ОПРЕДЕЛЕННОМ ЭТАПЕ
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
		echo Команда не распознана. Попробуйте ещё раз.
		pause
		goto :askexit))
REM ========== 1.БЛОК С ПРОВЕРКАМИ (конец) ==========

REM ========== 2.ОБЩИЕ КОМАНДЫ (начало) ==========
REM 2.1 ОБЩИЙ ПОРЯДОК КОМАНД ПРИ РАСПАКОВКЕ АРХИВОВ (начало)
:unzip_data
echo %textblock%
%winRar% x "%zipFile%" -o "%outputFile%" -r -y -ibck
If %errorlevel%==0 (Echo "- - - Операция успешно завершена. - - -"
					goto :%nextPoint%) else (Echo "- - - Возникли проблемы при выполнении. - - -" 
										 set answer=%nextPoint%
										 goto :askexit)
echo -----------------------------------------------------------------------

REM 2.2.ОБЩИЙ ПОРЯДОК КОМАНД ПРИ КОПИРОВАНИИ ФАЙЛОВ (начало)
:copy_data
echo %textblock%
xcopy "%inputFolder%" "%outputFolder%" /i /e /h /y
If %errorlevel%==0 (Echo "- - - Операция успешно завершена. - - -"
					goto :%nextPoint%) else (Echo "- - - Возникли проблемы при выполнении. - - -" 
										 set answer=%nextPoint%
										 goto :askexit)
echo -----------------------------------------------------------------------

REM 2.3.ОБЩИЙ ПОРЯДОК КОМАНД ПРИ ЗАМЕНЕ ДАННЫХ (начало)
:rename_data
setlocal enabledelayedexpansion
REM Предварительно удаляем строки с пустыми значениями (фикс от записи текста "Режим вывода команд на экран (ECHO) отключен.")
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
If %errorlevel%==0 (Echo "- - - Операция успешно завершена. - - -"
					goto :%nextPoint%) else (Echo "- - - Возникли проблемы при выполнении. - - -" 
										set answer=%nextPoint%
										goto :askexit)
echo -----------------------------------------------------------------------
REM ========== 2.ОБЩИЕ КОМАНДЫ (конец) ==========

REM ========== 3.СБОРКА СТЕНДА (начало) =========
:extract
REM 3.1.РАСПАКОВЫВАЕМ АРХИВ SERVER.ZIP
If not exist "%winRar%" (
    echo ERROR: Архиватор WinRAR по пути "%winRar%" не найден. Проверьте путь, указанный в файле "%ini%"
	pause
	goto :exit_bat
)
	set "textBlock=Распаковываем архив server.zip ..."
	set "zipFile=%in%\server.zip"
	set "outputFile=%out%\"
	set "nextPoint=extract_client"
goto :unzip_data

:extract_client
REM 3.2.РАСПАКОВЫВАЕМ АРХИВ CLIENT.ZIP
	set "textBlock=Распаковываем архив client.zip ..."
	set "zipFile=%in%\client.zip"
	set "outputFile=%out%\client"
	set "nextPoint=extract_delphi"
echo Проверяем наличие директории client ...
If not exist "%out%"\client (
		echo Директория client не обнаружена. Создаем директорию client...
		MD "%out%"\client
		goto :unzip_data) else (goto :unzip_data)

:extract_delphi
REM 3.3.ДОБАВЛЯЕМ DELPHI-КОМПОНЕНТЫ В директорию CLIENT
	set "textBlock=Добавляем Delphi-компоненты в директорию client ..."
	set "inputFolder=%DelphiXE%"
	set "outputFolder=%out%\client"
	set "nextPoint=extract_eis"
goto :copy_data

:extract_eis
REM 3.4.КОПИРУЕМ EIS.JAR
	set "textBlock=Копируем EIS.jar ..."
	set "inputFolder=%EIS%"
	set "outputFolder=%out%\server"
	set "nextPoint=extract_report"
goto :copy_data

:extract_report
REM 3.5.РАСПАКОВЫВАЕМ АРХИВ ОТЧЕТЫ
	set "textBlock=Распаковываем архив ОТЧЕТЫ ..."
	set "inputFolder=%REPORT%"
	REM Делаем проверку директории/архива
	if exist %SOFIT%\ (
		set "zipFile=%REPORT%\*.zip"
	) else (
		set zipFile=%REPORT%
	)
	set "outputFile=%out%\"
	set "nextPoint=extract_sofit"
goto :unzip_data

:extract_sofit
REM 3.6.РАСПАКОВЫВАЕМ АРХИВ СОФИТ
	set "textBlock=Распаковываем архив СОФИТ ..."
	set "inputFolder=%SOFIT%"
	REM Делаем проверку директории/архива
	if exist %SOFIT%\ (
		set "zipFile=%SOFIT%\*.zip"
	) else (
		set zipFile=%SOFIT%
	)
	set "outputFile=%out%\"
	set "nextPoint=extract_shplan"
goto :unzip_data

:extract_shplan
REM 3.7.ДОБАВЛЯЕМ ФАЙЛЫ SCHPLANSTOP
	set "textBlock=Добавляем файлы schplanstop..."
	set "inputFolder=%schplanstop%"
	set "outputFolder=%out%\SQL"
	set "nextPoint=extract_azkabat"
goto :copy_data

:extract_azkabat
REM 3.8.ДОБАВЛЯЕМ ФАЙЛЫ AZKA.BAT
	set "textBlock=Добавляем файлы azka.bat ..."
	set "inputFolder=%azka%"
	set "outputFolder=%out%"
	set "nextPoint=extract_port"
goto :copy_data

:extract_port
REM 3.9. ПЕРЕИМЕНОВЫВАЕМ ПОРТЫ
	set "textBlock=Переименовываем порты в "
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
REM 3.10.МЕНЯЕМ ПУТЬ ДО БД FIREBIRD В AZK2SERVER.PROPERTIES
	set "textBlock=Меняем путь до БД Firebird в"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%fb_old%"
	set "newText=%fbNew%"
	set "nextPoint=extract_db2"
goto :rename_data

:extract_db2
REM 3.11.МЕНЯЕМ ПУТЬ ДО БД ORACLE В AZK2SERVER.PROPERTIES
	set "textBlock=Меняем путь до БД Oracle в"
	set "fileName=%infile_4%"
	set "fileDirectory=%out%"
	set "oldText=%ora_old%"
	set "newText=%oraNew%"
	set "nextPoint=extract_xm1"
goto :rename_data

:extract_xm1
REM 3.12.1.МЕНЯЕМ ACTION="PERFORM" НА ACTION="SYNCHRONIZE"
	set "textBlock=Меняем action в"
	set "fileName=%operkind%"
	set "fileDirectory=%out%\XML"
	set "oldText=perform"
	set "newText=synchronize"
	set "nextPoint=extract_xm2"
goto :rename_data

:extract_xm2
REM 3.12.2.МЕНЯЕМ ACTION="PERFORM" НА ACTION="SYNCHRONIZE"
	set "fileName=%unidoctype%"
	set "fileDirectory=%out%\XML"
	set "oldText=perform"
	set "newText=synchronize"
	set "nextPoint=extract_xm3"
goto :rename_data

:extract_xm3
REM 3.12.2.МЕНЯЕМ ACTION="PERFORM" НА ACTION="SYNCHRONIZE"
	set "fileName=%serverprocessor%"
	set "fileDirectory=%out%\XML"
	set "oldText=perform"
	set "newText=synchronize"
	set "nextPoint=extract_Xmx"
goto :rename_data

:extract_Xmx
REM 3.13.МЕНЯЕМ РАЗМЕР ВЫДЕЛЕНОЙ ПАМЯТИ ДЛЯ JAVA
	set "textBlock=Меняем размер выделеной памяти для JAVA в файле"
	set "fileName=%infile_6%"
	set "fileDirectory=%out%\server\bin"
	set "oldText=%Jram_old%"
	set "newText=%javaNew%"
	set "nextPoint=extract_tomcat"
goto :rename_data

:extract_tomcat
REM 3.14.ДОБАВЛЯЕМ СБОРКУ ТОМКАТА, ПОДКЛАДЫВАЕМ AZK.WAR
echo Копируем сборку TOMCAT
xcopy "%tomcat%" "%out%"\apache_tomcat /i /e /h /y
echo Копируем файл azk.war
xcopy "%in%"\azk.war "%out%"\apache_tomcat\webapps /i /e /h /y
If %errorlevel%==0 (Echo "- - - Операция успешно завершена. - - -") else (Echo "- - - Возникли проблемы при выполнении. - - -" 
																	set answer=startweb
																	goto :askexit)

:startweb
REM 3.15.ЗАПУСКАЕМ ТОМКАТ ДЛЯ РАСПАКОВКИ azk.war
echo -----------------------------------------------------------------------
echo.
echo ЗАПУСКАЕМ ТОМКАТ ДЛЯ РАСПАКОВКИ azk.war
cd /d "%out%"\apache_tomcat\bin\
REM Использую call, из-за того, что после выполнения с командой start, текущая работа bat-ника прекращается.
call startup.bat

:ask_web_rmi
REM 3.16.МЕНЯЕМ RMI-ПОРТ В НАСТРОКАХ ТОМКАТА
echo -----------------------------------------------------------------------
echo.
echo МЕНЯЕМ RMI-ПОРТ В НАСТРОКАХ ТОМКАТА
	set question="Изменить порт в файле "%infile_5%?" [y/n]: "
	set answer=web_rmi
goto :askexit

:web_rmi
echo -----------------------------------------------------------------------
echo.
cd /d "%out%\apache_tomcat\webapps\azk\WEB-INF\"
If exist %infile_5% (
		set "textBlock=Файл настроек найден. Переименовываем порты в"
		set "fileName=%infile_5%"
		set "fileDirectory=%out%\apache_tomcat\webapps\azk\WEB-INF\"
		set "oldText=%RMI_PORT%"
		set "newText=%renRMI%"
		set "nextPoint=ask_drop_war"
	goto :rename_data
) else (
	echo Файл настроек не найден.
		set question="Повторить поиск файла %infile_5%? [y/n]: "
		set answer=web_rmi
	goto :askexit)

:ask_drop_war
REM 3.17.УДАЛИТЬ ФАЙЛ AZK.WAR ИЗ СБОРКИ ТОМКАТА
echo -----------------------------------------------------------------------
echo.
set question="Удалить файл azk.war из сборки томката? [y/n]: "
set answer=drop_war
set answer2=ask_start
goto :askexit

:drop_war
cd /d "%out%"\apache_tomcat\bin\
call shutdown.bat
TIMEOUT /T 5 /NOBREAK
cd /d "%out%"\apache_tomcat\webapps
DEL /Q azk.war
If %errorlevel%==0 (Echo "- - - Операция успешно завершена. - - -") else (Echo "- - - Возникли проблемы при выполнении. - - -" )
goto :ask_start

REM 3.18.Проверка на запуск СП АЦК-Финансы
:ask_start
echo -----------------------------------------------------------------------
echo.
set answer2=1
set question="Запустить СП %SYS%? [y/n]: "
set answer=startbat
goto :askexit

REM Запуск СП АЦК
:startbat
cd /d "%out%"
call StartServer.bat

REM Делаем остановку перед выходом. После чего выходим из программы
pause
:exit_bat
exit

END