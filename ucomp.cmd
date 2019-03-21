@ECHO OFF
IF DEFINED UNITY_DEV_PATH (
    PUSHD %UNITY_DEV_PATH%
    build.pl --target=WindowsEditor --platform=win64
    POPD
    TITLE %UNITY_DISPLAY_BRANCH_NAME%
) ELSE (
    ECHO UNITY_DEV_PATH is not set
)
