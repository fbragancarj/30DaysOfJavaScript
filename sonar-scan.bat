@rem Script para coletar a branch e escolher o respetivo

@SET cmd="git branch --show-current"
@FOR /F "tokens=*" %%b IN (' %cmd% ') do set branch=%%b

@echo %ERRORLEVEL%
@if %ERRORLEVEL% NEQ 0 (goto error)

@echo %branch%
@pause

@if %branch%==developer (goto developer)
@if %branch%==main (goto main)
@goto others

:developer
@echo "Scanning branch developer"

@goto end

:main
@echo "Scanning branch main"
sonar-scanner.bat -D"sonar.projectKey=30DaysOfJavaScript" -D"sonar.sourceEncoding=UTF-8" -D"sonar.sources=." -D"sonar.host.url=http://127.0.0.1:9000" -D"sonar.token=sqp_2a4d767378ae4ae5212526a89ab97d72ed16d1a8"
@goto end

:others
@echo "Branch sem projeto"
@goto end

:error
@echo "Erro na obtencao da branch corrente"
@pause

:end
echo "fim..."
