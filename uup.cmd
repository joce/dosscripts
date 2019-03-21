@ECHO OFF

IF DEFINED UNITY_DEV_PATH (
    hg up %*
    CALL ugetbranch
) ELSE (
    ECHO UNITY_DEV_PATH is not set
)
