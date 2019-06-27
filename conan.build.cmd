if "%APPVEYOR_REPO_TAG%" == "true" (
    conan create %APPVEYOR_BUILD_FOLDER% "%APPVEYOR_PROJECT_NAME%/%APPVEYOR_REPO_TAG_NAME:v=%@barco/healthcare" -s build_type=%configuration% -s compiler="Visual Studio" -s compiler.version=%MSVC_VERSION%
    conan upload --remote barco --all %APPVEYOR_PROJECT_NAME%/%APPVEYOR_REPO_TAG_NAME:v=%@barco/healthcare
) else (
    if "%APPVEYOR_REPO_BRANCH%" == "barco_2.2.7" (
        conan create %APPVEYOR_BUILD_FOLDER% %APPVEYOR_PROJECT_NAME%/2.2.7.0@barco/healthcare -s build_type=%configuration% -s compiler="Visual Studio" -s compiler.version=%MSVC_VERSION%
        conan upload --remote barco --all --force %APPVEYOR_PROJECT_NAME%/2.2.7.0@barco/healthcare
    )
)
