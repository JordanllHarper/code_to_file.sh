# Code -> To -> File (.sh)

A Bash Script for copying files from a project into a markdown file.

## Getting started

You can either *yoink* the script code straight from this repository and make your own script file, or clone the repository and use the script from where you cloned to.

## Usage

Using the script is the same as invoking any other shell script:

`./code_files.sh ...`

where ... are the required arguments:

- the path to the root of your project.
- a path where you want to save. This implicitly also includes how you want to save (recommended: `.txt` or `.md`).
- a list of file types you want to **include**.


## Examples

For a Swift project with a path at `~/MySwiftProjects/ThisIsAGoodOne/` and a save path of `~/CodeFilesInMarkdown.md`:

`./code_files.sh ~/MySwiftProjects/ThisIsAGoodOne ~/CodeFilesInMarkdown.md swift`


Multiple file types:

`./code_files.sh ~/MyAndroidProjects/ThisIsAGREATOne ~/CodeFilesInMarkdown.md kt java`

> [!NOTE]
> Projects may contain contents you would like to ignore. This script doesn't currently support ignoring directories (but is a planned feature!). For now, best to do is remove those files and copy just the source files. 
> Then add them back in to keep functionality.

## Motivation 

If you're a student and need to copy your code into a word document (like I have done), then you'll know how painful (and stressful!) needing to copy all your code into documents is.

This script solves that problem. You don't need to worry about if you've missed files, or have changed something and now need to redo the whole copying process all over again.
