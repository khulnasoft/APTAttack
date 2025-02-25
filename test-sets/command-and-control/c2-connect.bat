@ECHO OFF

ECHO ===========================================================================
ECHO C2 Access
ECHO Using curl to access well-known C2 addresses

ECHO C2: msupdater.com
"%CURL%" -s -o /dev/null -I -w "Result: %%{http_code}\n" -m3 msupdater.com
ECHO C2: twitterdocs.com
"%CURL%" -s -o /dev/null -I -w "Result: %%{http_code}\n" -m3 twitterdocs.com
ECHO C2: freenow.chickenkiller.com
"%CURL%" -s -o /dev/null -I -w "Result: %%{http_code}\n" -m3 freenow.chickenkiller.com
ECHO C2: www.googleaccountsservices.com
"%CURL%" -s -o /dev/null -I -w "Result: %%{http_code}\n" -m3 www.googleaccountsservices.com
ECHO C2: examplec2.com
"%CURL%" -s -o /dev/null -I -w "Result: %%{http_code}\n" -m3 examplec2.com
ECHO C2: anotherc2.com
"%CURL%" -s -o /dev/null -I -w "Result: %%{http_code}\n" -m3 anotherc2.com
