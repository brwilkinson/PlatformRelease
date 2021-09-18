# PlatformRelease (Pipeline/Workflow Release Tools)
Tools for releasing artifacts via Build, Release Pipelines for App Platform Components

####  DevOps / GitHub Actions Scripts and workflows for App Stagin

This works in conjunction with: [brwilkinson/AppReleaseDSC](https://github.com/brwilkinson/AppReleaseDSC)

#### Overview of the Release process

- The YAML file .github\workflows\build-release-AOA.yml builds your App:
    - Essentially the Build component (Part 1.)
    - Copy the build artifacts to a Global Storage Account
    - Publish artifacts in GitHub
    - Updates a manifest file that contains the Build version that is mapped to an Environment
        - This is automatically updated during this release
        - Assuming if the workflow is authorized to run then that release should be updated in the associated Environment

The scripts in this Project:
- Can be tested locally
- Can be executed in Azure DevOps Pipelines
- Can be executed in GitHub Actions

- The associated DSC resource runs on VM or VMSS in your Environment in a Pull Mode
    - Reads the manifest files for the environment that it is in
    - Pulls the correct build down to the machine
    - Essentially the Release component (Part 2.)

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
