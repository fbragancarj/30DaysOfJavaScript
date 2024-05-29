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
sonar-scanner.bat -D"sonar.projectKey=30DaysOfJavaScript" -D"sonar.sources=." -D"sonar.host.url=http://127.0.0.1:9000" -D"sonar.token=sqp_23150addfe86ee7e5c02ec2b5692abd86b6e82ad"
@goto end

:others
@echo "Branch sem projeto"
@goto end

:error
@echo "Erro na obtencao da branch corrente"
@pause

:end
echo "fim..."
