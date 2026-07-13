@echo off
:: 設定 CMD 編碼為 UTF-8，避免中文亂碼
chcp 65001 > nul

echo ==================================================
echo   啟動 Controller 後端服務...
echo ==================================================
echo.

:: 檢查並自動啟用虛擬環境（如果你有用的話）
if exist venv\Scripts\activate.bat (
    echo [系統] 偵測到 venv 虛擬環境，正在啟用...
    call venv\Scripts\activate.bat
) else if exist .venv\Scripts\activate.bat (
    echo [系統] 偵測到 .venv 虛擬環境，正在啟用...
    call .venv\Scripts\activate.bat
)

:: 執行 Controller 程式
echo [系統] 正在執行 Controller.py...
python Controller.py

:: 如果程式因為錯誤而崩潰，用 pause 把視窗留住，方便查看報錯
if %errorlevel% neq 0 (
    echo.
    echo [錯誤] 程式異常終止，請查看上方錯誤訊息！
    pause
)