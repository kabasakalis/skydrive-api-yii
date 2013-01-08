@echo off

rem -------------------------------------------------------------
rem  BackUp 
rem -------------------------------------------------------------
rem Prepare Timestamp
set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%

set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%

set secs=%time:~6,2%
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%

set year=20%date:~-2%

set month=%date:~3,3%
if "%month:~0,1%" == " " set month=0%month:~1,1%

set day=%date:~0,2%
if "%day:~0,1%" == " " set day=0%day:~1,1%

@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

set backuptimestamp=%year%%month%%day%_%hour%%min%%secs%   Time %time:~0,8%
echo Backing Up   %DATE% %hour%:%min%:%secs%

SET /P msg=Enter Commit Message,will be attached to backup timestamp : 

git add . &
git commit -am "Backup %backuptimestamp% %msg%"  & 
git  push --all backup

echo Done.
pause