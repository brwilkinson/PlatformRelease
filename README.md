# PlatformRelease (Pipeline/Workflow Release Tools)
Tools for releasing artifacts via Build, Release Pipelines for a Platform of Components

####  DevOps / GitHub Actions Scripts and workflows for App Stagin

[This works in conjunction with this DSC Resource (brwilkinson/AppReleaseDSC)](https://github.com/brwilkinson/AppReleaseDSC)

#### Overview of the Release process

- The YAML file .github\workflows\build-release-AOA.yml builds your App
    - The App Build
    - Copy the build artifacts to a Global Storage Account
    - Updates a manifest file that contains the Build version that is mapped to an Environment
        - This is automatically updated during this release
        - Assuming if the workflow is authorized to run then that release should be updated in the associated Environment

The scripts in this Project
- Can be tested locally
- Can be executed in Azure DevOps Pipelines
- Can be executed in GitHub Actions



<!-- > [!NOTE]
> Information the user should notice even if skimming.

> [!TIP]
> Optional information to help a user be more successful.

> [!IMPORTANT]
> Essential information required for user success.

> [!CAUTION]
> Negative potential consequences of an action.

> [!WARNING]
> Dangerous certain consequences of an action.

> This is a blockquote. It is usually rendered indented and with a different background color.

This text is **bold**.

This text is *italic*.

This text is both ***bold and italic***.



# This is a first level heading (H1)

## This is a second level heading (H2)


###### This is a sixth level heading (H6) -->
