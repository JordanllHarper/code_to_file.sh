# Code -> To -> File (.sh)

A Bash Script for copying files from a project into a markdown file.

## Getting started

You can either *yoink* the script code straight from this repository and make your own script file, or clone the repository and use the script from where you cloned to.

## Usage

Using the script is the same as invoking any other shell script:

`./code_files.sh [OPTIONS] [ARGUMENTS]`

OPTIONS:

-f - [f]iletype to include. At least 1 of these is *required*.

-p - [p]attern to exclude. Optional.

ARGUMENTS:

/path/to/start - where to start parsing files from

/path/to/save - where to save the contents to.

> [!NOTE]
> This also implicitly includes how you will save your files. Recommended filetypes are `.txt` and `.md`.

## Examples

For a Swift project with a path at `~/MySwiftProjects/ThisIsAGoodIdea/` and a save path of `~/CodeFilesInMarkdown.md`:

`./code_files.sh -f swift ~/MySwiftProjects/ThisIsAGoodOne ~/CodeFilesInMarkdown.md`

Multiple file types:

`./code_files.sh -f kt -f java ~/MyAndroidProjects/ThisIsAGREATIdea ~/CodeFilesInMarkdown.md`

Ignoring build files:

`./code_files.sh -f rs -f md -f toml -p target/ -p lock ~/MyRustProjectsBTW/BestIdeaEver ~/code_files.md`

## Motivation 

If you're a student and need to copy your code into a document, then you'll know how painful (and stressful!) needing to copy all your code into documents is.

This script solves that problem. You don't need to worry about if you've missed files, or have changed something and now need to redo the whole copying process all over again.
