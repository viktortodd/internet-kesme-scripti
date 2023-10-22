@echo off
REM      
REM  
cls
net session >nul 2>&1
    if %errorLevel% == 0 (
        echo.
    ) else (
        GOTO :NOPERM
    )
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
@cd /d "%~dp0"
for %%* in (.) do set RULENAME=%%~nx*
ECHO|set /p ="- Klas”rdeki "
call :ColorText 0a "Gelen & Giden "
ECHO  btn internet akŸn engelleyen Gvenlik Duvar dzenleyicisi.
ECHO.
ECHO|set /p = "- Klas”rn bulundu§u konum '"
  call :ColorText 0b "%CD%'" 
ECHO  (Klas”rn i‡inde bulunan di§er klas”rlerin de internet eriŸimi kesilecektir.)
ECHO.
ECHO|set /p = "- Gvenlik Duvar ilkesi "
  call :ColorText 1b "%RULENAME%"
ECHO  adyla eklensin mi? ?
ECHO.
ECHO.
ECHO.
ECHO - Devam etmek i‡in herhangi bir tuŸa basn.
pause >nul
cls
Echo.
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
Echo.
  call :ColorText 0a "Bitti"
ECHO|set /p =" , pencereyi kapatabilirsiniz...."
ECHO.
ECHO.
ECHO €kmak i‡in herhangi bir tuŸa basn...
pause >nul
goto :eof

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof

:Finish
Echo.
Echo.
Echo Satr sonu...
Goto :SON

:NOPERM
ECHO.
ECHO - Ltfen dosyay y”netici olarak yeniden baŸlatn...
ECHO.
ECHO.
ECHO.
ECHO|SET /p ="- €kmak i‡in herhangi bir tuŸa basn..."
Pause >NUL
ECHO   G”rŸrz!
ECHO.
ECHO.
:END