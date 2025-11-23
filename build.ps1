# Build script for generating release package

Write-Output "Cleaning output folders..."

if (Test-Path -Path "AvaloniaVS.VS2022\bin")
{
  Remove-Item AvaloniaVS.VS2022\bin\* -Recurse -Force
}

if (Test-Path -Path "output\")
{
  Remove-Item output\* -Recurse -Force
}

# Clean both debug and release
dotnet clean AvaloniaVSExt.slnx --configuration Release

$VCToolsInstallDir = . "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe" -Latest -requires Microsoft.Component.MSBuild -property InstallationPath
Write-Host "VCToolsInstallDir: $VCToolsInstallDir"

$msBuildPath = "$VCToolsInstallDir\MSBuild\Current\Bin\msbuild.exe"
Write-Host "msBuildPath: $msBuildPath"

Write-Host "Cleaning..."
& $msBuildPath -t:Clean AvaloniaVSExt.slnx

Write-Host "Building..."
& $msBuildPath /restore `
               AvaloniaVSExt.slnx `
               /p:Configuration=Release

# Publish
Write-Output "Cleaning Publish folder.."

if (Test-Path -Path "publish\")
{
  Remove-Item publish\* -Recurse -Force
}
else
{
  New-Item -Path '.\publish' -ItemType Directory
}

Move-Item -Path .\output\Release\AvaloniaVS.VS2022.vsix -Destination .\publish\AvaloniaVS.VS2022.vsix
