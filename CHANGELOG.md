# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## Unreleased
### Added
- Rubocop pre-commit hook
- Refactored hooks to meet Rubocop standards
- .rubocop file
- Jenkinsfile for CI builds

## [v1.0.0-RC2] - 2017-05-17
### Added
- prepare-commit-msg hook to read in hook statuses
- rake task for prepare-commit-msg hooks
- hooks file for prepare-commit-msg execution
- maven pre-commit hook
- validateCFT pre-commit hook
- validateCFT check for changes before execution

### Modified
- existing pre-commit hooks to write exit status to file
- document full untar command in README for installation
- gradle check for changes before execution
- gradle take directory to execute in
- renamed version to tagVersion

## [v1.0.0-RC1] - 2017-05-10
### Added
- commit-msg file to trigger commitmsg Rake task
- commit message format validator using commit-msg hook

### Modified
- README with updated documentation
- Rakefile with additional commitmsg task

## [v0.1.0-beta] - 2017-05-1
### Added
- README
- Rakefile to execute only chosen hooks
- setup.rb used to select and configure hooks
- pre-commit file to trigger precommit Rake task
- gradle pre-commit hook
- version pre-commit hook
