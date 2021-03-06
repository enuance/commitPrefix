# commitPrefix

## A command line utility that easily prefixes your commit messages.

___

### -- About --

CommitPrefix is a simple command line tool that helps you to easily prefix your commit messages. The common use case for this is tagging your commit messages with a Jira (or other issue tracking software) ticket number. The desired prefix is stored within the .git folder and picked up by a generated commit-message hook. This allows you to write your ticket number (or any other prefix) once. From then on all commit messages will be prepended with the saved prefix.

There's also a branch parse mode that allows commitPrefix to parse the current branch you're on for a valid issue numbers and use them as prefixes for your next commit. The modes can be switched back and forth arbitrarily and used along with any self defined prefixes.

Prefixes can be re-assigned or deleted at any time. Additionally, this is a git repository specific tool, meaning that stored prefixes are specific to the repository you're in.

CommitPrefix has been verified to work both from the command line as well as with GUI based Git Clients like Tower.

The actions that can be done are:

* Store an arbitrary number of commit prefixes
* Generate prefixes based on your current branch
* Delete the currently stored prefixes
* View the current mode and stored prefixes

___
### -- Requirements --

This package uses `swift-tools-version:5.1` as a minimum requirement to build and install.

Check to see that you have Swift 5.1 or greater to meet the requirements
```zsh
% swift --version
```

Supported OS:
- macOS Catalina v10.15.1 or greater

___
### -- Installation --

1. Clone the repo and move to the root of the directory

```zsh
% git clone https://github.com/enuance/commitPrefix.git
% cd commitPrefix
```

2. *Optional* Run the installer

```zsh
% ./Installer
```

As a good practice, please make sure to read the source code of the installer script before running it. If you do not feel comfortable running the installer, you could manually build and install it instead. If you would like to do so, follow these steps:

2. Build the executable

```zsh
% swift build -c release
```

3. Install it into the local bin folder

```zsh
% mv .build/release/commitPrefix /usr/local/bin 
```

On your next Terminal session you should be able to see auto-completion and use commitPrefix.

___
### -- Usage --


To use commitPrefix you need to have your working directory set to one that has a git repository in it.
```zsh
% cd SomeGitRepository
```

To **store** a prefix
```zsh
% commitPrefix SamplePrefix-001,SamplePrefix-002

# Output
CommitPrefix STORED [SamplePrefix-001][SamplePrefix-002]
```

To change mode to **branchParse**
```zsh
% git checkout ENG-342-SomeFeatureBranchLinkedToENG-101
% commitPrefix -b eng

# Output
CommitPrefix MODE BRANCH_PARSE eng
```

To **view** the current prefixes and mode
```zsh
% commitPrefix

# Output
CommitPrefix MODE BRANCH_PARSE
- branch prefixes: [SamplePrefix-001][SamplePrefix-002]
- stored prefixes: [ENG-342][ENG-101]
```

To change back to **normal** mode
```zsh
% commitPrefix -n

# Output
CommitPrefix MODE NORMAL
```

To **delete** a prefix
```zsh
% commitPrefix -d

# Output
CommitPrefix DELETED
```

You can also view these command along with shortend version by using the `--help` tag.
