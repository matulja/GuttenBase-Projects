@echo off
setlocal ENABLEDELAYEDEXPANSION

set CLASSPATH=.

FOR /R .\lib %%G IN (*.jar) DO set CLASSPATH=!CLASSPATH!;%%G

echo The Classpath is %CLASSPATH%

java -cp "%CLASSPATH%" de.akquinet.jbosscc.guttenbase.projects.MeyleExportDeva
