# Build script for generating release package

if (Test-Path -Path "AvaloniaVS.VS2022\bin")
{
  Remove-Item AvaloniaVS.VS2022\bin\* -Recurse -Force
}

$VCToolsInstallDir = . "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe" -Latest -requires Microsoft.Component.MSBuild -property InstallationPath
Write-Host "VCToolsInstallDir: $VCToolsInstallDir"

$msBuildPath = "$VCToolsInstallDir\MSBuild\Current\Bin\msbuild.exe"
Write-Host "msBuildPath: $msBuildPath"

Write-Host "Cleaning..."
& $msBuildPath -t:Clean Legacy-AvaloniaVSExt.sln

Write-Host "Building..."
& $msBuildPath /restore `
               Legacy-AvaloniaVSExt.sln `
               /p:Configuration=Release
