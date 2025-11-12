# Legacy Avalonia AXAML Viewer Visual Studio Extension

Yes, the same Avalonia GUI Previewer and syntax highlighter that you've grown to love under the MIT license.

<center><img width="495" height="523" alt="image" src="https://github.com/user-attachments/assets/ad3d429d-8d64-4d75-894c-f7487b830ca5" /></center>

The fork preserves the legacy Avalonia Visual Studio Extension at git hash, `7bf4941`, providing only basic features.

> For the latest ground-breaking features, use the official [AvaloniaVS extension](https://marketplace.visualstudio.com/items?itemName=AvaloniaTeam.AvaloniaVS).
>
> This fork is intended for those who need a simple visual designer for Avalonia. For instance, those creating simple apps or sandboxing Avalonia. _**We encourage you to support the official tooling.**_
> 
> _This project is an independent derivative of Avalonia technology and is not endorsed by AvaloniaUI OÜ._

[![2022 marketplace](https://img.shields.io/visual-studio-marketplace/v/SuessLabs.Avalonia-Lite-VS.svg?label=2022-Marketplace)](https://marketplace.visualstudio.com/items?itemName=SuessLabs.Avalonia-Lite-VS)

## Extension Upgrading

If you run into the following error message, this is normal. It is caused by your project's `.SUO` file still referencing the other extension, and we're using a new UUID to stay separate.

> ```txt
> An error occurred in 'MyProject' while attempting to open 'ShellWindow.axaml'
> System.ArgumentException: Failed to get the editor factory manager for 6d5344a2-2fcd-49de-a09d-6a14fd1b1224.
> ```

1. Uninstall the other Avalonia extension, keeping this one.
2. **Clean** your project and **close the open tabs**
3. **Relaunch** Visual Studio
4. **Rebuild** your project

## Avalonia for Visual Studio

This repository is used to generate Avalonia Visual Studio extensions.
Avalonia Visual Studio extension adds such capabilities to your Visual Studio:

- XAML code completion.
- XAML previewer.
- It bundles Avalonia templates in your Visual Studio.
- Icons for axaml files.

### VSIX packages for Visual Studio

[Avalonia for Visual Studio 2022](https://marketplace.visualstudio.com/items?itemName=AvaloniaTeam.AvaloniaVS)

For VS2017 and VS2019 you need to download another plugin [Avalonia for Visual Studio 2019](https://marketplace.visualstudio.com/items?itemName=AvaloniaTeam.AvaloniaforVisualStudio)

- Latest Release supporting VS2019 is **11.5**
- Latest Release supporting VS2017 is **11.2**

If you are interested in VSCode extension, visit https://github.com/AvaloniaUI/AvaloniaVSCode.

## Debugging

If you want to debug Avalonia previewer extension the *easiest* way to do that is [VS Experimental instance](https://docs.microsoft.com/en-us/visualstudio/extensibility/the-experimental-instance?view=vs-2019).
To run it you simply need to set **AvaloniaVS.csproj** as startup project and run it,it will open VS Experimental instance,you can run here your repro and put the breakpoints in the original VS in AvaloniaVS project.

**Note:**

This way to debug application will only help you if your issue is directly in AvaloniaVS project,if your issue is somewhere in Avalonia code,but it is reproducible only with Avalonia Previewer please consider this article - [https://docs.avaloniaui.net/docs/0.10.x/guides/developer-guides/debugging-previewer](https://docs.avaloniaui.net/docs/0.10.x/guides/developer-guides/debugging-previewer)
