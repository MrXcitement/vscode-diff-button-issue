# VS Code Diff Buttons Issue

## Summary

I use the diff editor to bring a series of files to be up to date with their
equivalent file in a 'template' repository.  I have a shell script that will
open a diff editor on the files in the current repository and the template
repository.  This has been working without issue with VS Code up to July 2024
(version 1.92).  When I use the diff editor in later versions (v1.93+) the diff
editor works fine when editing the first few files, however it appears to lose
it's place in the file and either causes the wrong chunk of code to be replaced
or it just stops working.  I have created this repository as a working example
of the problem.

I tested using macOS and Windows Visual Studio Code
- v1.92.x - Diff revert button works.
- v1.93.x - Diff revert button fails after editing a few files.
- v1.94.x - Diff revert button works.

## Usage

- Clone this repository
- Change into the repository
- Open the `racket` folder in code
- `code --diable-extensions racket`
- Run the campare-to script
- `../template/compare-to.sh`
- Use the '>' button to revert the changes in the right hand pane with the left hand pane, if you save the file, you can always revert from git.
- Eventually, for me it seems to be after two files are edited, the '>' gutter button will stop working.
