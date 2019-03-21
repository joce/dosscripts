@ECHO OFF
IF DEFINED UNITY_DEV_PATH (
    PUSHD %UNITY_DEV_PATH%
    jam NativeProjectFiles ManagedProjectFiles
    POPD
    CALL mkcsharpsln.cmd
    TITLE %UNITY_DISPLAY_BRANCH_NAME%
) ELSE (
    ECHO UNITY_DEV_PATH is not set
)
