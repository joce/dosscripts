@ECHO OFF
IF DEFINED UNITY_DEV_PATH (
    START -cur_console:n uustartcallhack.cmd
    REM %UNITY_DEV_PATH%\build\WindowsEditor\Unity
) ELSE (
    ECHO UNITY_DEV_PATH is not set
)
