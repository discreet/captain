[![CircleCI](https://circle-poc.cloud.capitalone.com/gh/phantomoftheops/captain.svg?style=svg&circle-token=73a085435d172923367cdacddc52c23d9a8e5daf)](https://circle-poc.cloud.capitalone.com/gh/phantomoftheops/captain)

# Captain

#### Table of Contents

<img align="right" src="https://github.kdc.capitalone.com/mya561/captain/blob/master/images/captainhook.png" alt="Captain Hook...from Peter Pan" />

1. [Description](#description)
1. [Setup](#setup)
    * [What Captain affects](#what-scollector-affects)
    * [Installation](#installation)
    * [Setup requirements](#setup-requirements)
    * [Usage](#setup-usage)
1. [References](#references)
1. [Limitations](#limitations)
1. [Development](#development)

## Description

Captain is a tool that helps manage git hooks. It contains a library of
available hooks that can be chosen and configured to run with your project.

## Setup

### What Captain affects

Captain manages two things; the first being select files in the `.git/hooks`
directory and the second being the `hooks` directory it creates in the root of
the project. Captain will create `pre-commit`, `post-commit`, etc files in the
`.git/hooks` directory based on the chosen selections. In the `hooks` directory
created at the root of the project Captain will manage a `Rakefile` and a
directory structure for the selected hook scripts.

### Installation

Captain is really nothing more than a file structure and some fancy pants
scripts. Installation is fairly easy. Download the latest stable release tarball
from GitHub. Untar the package into the project root.

The below command will create a `captain` directory in the project root and
untar the downloaded Captain tarball to that directory path.  
`mkdir <path to project root>/captain && tar -C <path to project root/captain>
-xvf <captain tarball> --strip-components 1`

### Setup Requirements

Captain is mostly a Ruby app, however hooks can be written in any language the
machine can interpret. The `Rakefile` will execute any file in the specified
directory.

The only external dependency is the Rake gem. This must be installed in order
for Captain to function; `gem install rake`.

### Usage

Once Captain is cloned into the root of the project and the Rake gem is
installed run the `setup` file in the `configure` directory to begin setup.
Remember to add the `captain` and `hooks` directory to the `.gitignore` file.

Setup prompts:

__Hook Prompt:__
```
Plese select the hooks you would like to configure.
All selections should be comma separated.
The available hooks are:
pre-commit
commit-msg
Enter selection:
```

__Script Prompt for pre-commit:__
```
Please select the hook scripts to configure.
All hook scripts should be comma separated.
The available hook scripts for pre-commit are:
gradle
maven
validateCFT
tagVersion
Enter selection:
```

__Hooks Directory Structure Based on pre-commit__:
```
├── hooks
│   ├── Rakefile
│   └── pre-commit
│       ├── gradle
│       └── tagVersion
```

## References

__Configuration:__
* [setup](/configure/setup)
* [Rakefile](/configure/Rakefile)
* [pre-commit](/configure/hooks/pre-commit)
* [commit-msg](/configure/hooks/commit-msg)
* [prepare-commit-msg](/configure/hooks/prepare-commit-msg)

__Scripts:__
* [gradle](/pre-commit/gradle)
* [maven](/pre-commit/maven)
* [validateCFT](/pre-commit/validateCFT)
* [tagVersion](/pre-commit/tagVersion)
* [validateCommit](/commit-msg/validateCommit)
* [hookStatus](/prepare-commit-msg/hookStatus)
* [rubocop](/pre-commit/rubocop)

## Limitations

Captain is currently only supporting pre-commit and commit-msg hooks however
further development is in the road map. It is also an OSX/Unix focused project
so running Captain on Windows might prove challenging; there has been no testing
or thought into how this might work.

## Development

Contributions are more than welcome to Captain, please bring your hooks to ship.
Contributing guidelines are loose right now since the project is in the early
stages. A rough outline is detailed below.

* Fork the project
* Create a branch for your work
* Write your hook (please make sure to write for everyone)
* Test your hook
* Squash your commits
* Open a Pull Request

For information on what your commit should look like please visit:
[Commit Expectations](https://chris.beams.io/posts/git-commit/)

