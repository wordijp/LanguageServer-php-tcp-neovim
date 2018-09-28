@echo off

set NAME=availableport

rem -----------
rem windows ---
set TARGET=%NAME%.exe
set GOOS=windows
set GOARCH=amd64
call :do_zip
set GOARCH=386
call :do_zip

rem ----------
rem darwin ---
set TARGET=%NAME%
set GOOS=darwin
set GOARCH=amd64
call :do_zip
set GOARCH=386
call :do_zip

rem ----------
rem linux ---
set TARGET=%NAME%
set GOOS=linux
set GOARCH=amd64
call :do_gz
set GOARCH=386
call :do_gz

exit /b
rem end -----------------------------------------

:do_zip
  go build -ldflags "-w -s" -o %TARGET%
  echo %GOOS%_%GOARCH%.zip ...
  zip -r %NAME%_%GOOS%_%GOARCH%.zip %TARGET%
  rm -f %TARGET%
exit /b

:do_gz
  go build -ldflags "-w -s" -o %TARGET%
  echo %GOOS%_%GOARCH%.tar.gz ...
  tar -zcvf %NAME%_%GOOS%_%GOARCH%.tar.gz %TARGET%
  rm -f %TARGET%
exit /b
