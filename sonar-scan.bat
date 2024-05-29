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

@goto end

:others
@echo "Branch sem projeto"
@goto end

:error
@echo "Erro na obtencao da branch corrente"
@pause

:end
echo "fim..."
