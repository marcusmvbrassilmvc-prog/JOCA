@echo off
:: SUPER TRAVA DE LOCALIZACAO V5
pushd "%~dp0"
cd /d "%~dp0"

echo ==========================================
echo    JOCA ELITE - SISTEMA DE BUILD V5
echo ==========================================
echo.
echo Local do Projeto: %CD%
echo.

:: 1. Verificacao de Arquivos
if not exist "package.json" (
    echo [ERRO FATAL] Arquivo package.json nao encontrado!
    pause
    exit /b
)

:: 2. Instalacao de Dependencias
echo [1/4] Verificando dependencias...
if not exist "node_modules" (
    echo Instalando node_modules...
    call npm install --legacy-peer-deps
)

:: 3. Gerando Codigo Nativo
echo [2/4] Gerando estrutura nativa...
if exist android rmdir /s /q android
call npx expo prebuild --platform android --no-install

:: 4. Configuracao do SDK e Correcao Hermes
echo [3/4] Aplicando correcoes de elite no Gradle...
set SDK_PATH=%LOCALAPPDATA%\Android\Sdk
set SDK_PATH_FIXED=%SDK_PATH:\=\\%

if exist android (
    echo sdk.dir=%SDK_PATH_FIXED% > android\local.properties
    
    :: INJECAO DE PROPRIEDADES PARA RESOLVER O ERRO HERMES
    echo org.gradle.jvmargs=-Xmx2048m > android\gradle.properties
    echo android.useAndroidX=true >> android\gradle.properties
    echo android.enableJetifier=true >> android\gradle.properties
    echo hermesEnabled=true >> android\gradle.properties
    echo newArchEnabled=true >> android\gradle.properties
    echo expo.jsEngine=hermes >> android\gradle.properties
) else (
    echo [ERRO] Pasta 'android' nao foi criada.
    pause
    exit /b
)

:: 5. Compilacao Final
echo [4/4] Compilando APK...
cd android
call gradlew.bat assembleRelease

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ==========================================
    echo    SUCESSO! APK GERADO COM NIVEL ELITE
    echo ==========================================
    echo O arquivo esta em: android\app\build\outputs\apk\release\app-release.apk
    explorer.exe /select,"app\build\outputs\apk\release\app-release.apk"
) else (
    echo.
    echo ##########################################
    echo    ERRO NA COMPILACAO
    echo ##########################################
    echo O Gradle falhou. Verifique os logs acima.
)

echo.
pause
popd
