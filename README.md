# Captain

#### Table of Contents

1. [Description](#description)
1. [Setup](#setup)
    * [What Captain affects](#what-scollector-affects)
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

### Setup Requirements

Captain is mostly a Ruby app, however hooks can be written in any language the
machine can interpret. The `Rakefile` will execute any file in the specified
directory.

The only external dependency is the Rake gem. This must be installed in order
for Captain to function; `gem install rake`.

### Usage

Once Captain is cloned into the root of the project and the Rake gem is
installed run the `setup.rb` file in the `configure` directory to begin setup.

setup.rb prompts:

__Hook Prompt:__
```
Plese select the hooks you would like to configure.
All selections should be comma separated.
The available hooks are:
pre-commit
Enter selection:
```

__Script Prompt:__
```
Please select the hook scripts to configure.
All hook scripts should be comma separated.
The available hook scripts for pre-commit are:
gradle
maven
version
Enter selection:
```

__Hooks Directory Structure__:
```
├── hooks
│   ├── Rakefile
│   └── pre-commit
│       ├── gradle
│       └── version
```

## References

__Configuration:__
* [setup.rb](https://github.kdc.capitalone.com/mya561/captain/blob/master/configure/setup.rb)
* [Rakefile](https://github.kdc.capitalone.com/mya561/captain/blob/master/configure/Rakefile)
* [pre-commit](https://github.kdc.capitalone.com/mya561/captain/blob/master/configure/hooks/pre-commit)

__Scripts:__
* [gradle](https://github.kdc.capitalone.com/mya561/captain/blob/master/pre-commit/gradle)
* [version](https://github.kdc.capitalone.com/mya561/captain/blob/master/pre-commit/version)

## Limitations

Captain is currently only supporting pre-commit hooks however further
development is in the road map. It is also an OSX/Unix focused project so
running Captain on Windows might prove challenging; there has been no testing or
thought into how this might work.

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

