# pathsize

[![Actions Status](https://github.com/pavloveone/pathsize-go/actions/workflows/ci.yml/badge.svg)](https://github.com/pavloveone/pathsize-go/actions)

**Demo:** [asciinema recording](https://asciinema.org/a/OzJ6nbBzAELX3F4Qntoy8eJ1y)

A CLI tool that reports the size of a file or directory - recursive traversal, human-readable output, and an option to include hidden files - a small, from-scratch reimplementation of what `du` does.

Built as a project for Hexlet's Go developer course. This repo is that project with the module renamed and detached from Hexlet's course infrastructure for standalone use.

## Stack

Go 1.23, urfave/cli/v3, testify, GitHub Actions

## How it's structured

```
cmd/pathsize     CLI entrypoint (urfave/cli/v3), flag parsing
(root package)   GetPathSize() walks the path with os.Lstat/os.ReadDir,
                 sums file sizes (recursing into subdirectories only
                 with -r), then formats the total in bytes or, with
                 -H, the largest fitting unit up to EB
```

Hidden files and directories (dot-prefixed, plus OS junk files like `.DS_Store` and `Thumbs.db`) are skipped unless `-a` is passed.

## Usage

```
pathsize [-r] [-H] [-a] <path>
```

```
$ pathsize -H testdata/bigFile.txt
9.5KB	testdata/bigFile.txt

$ pathsize -r -H testdata/
344.9KB	testdata/

$ pathsize -r -H -a testdata/
611.5KB	testdata/
```

## Running it locally

```bash
git clone git@github.com:pavloveone/pathsize-go.git
cd pathsize-go
make build          # -> bin/pathsize
./bin/pathsize -H testdata/bigFile.txt
```

## Tests

```bash
make test            # go test -v ./...
```

Table-driven tests cover plain files, directories, nested files, hidden-file exclusion and inclusion, human-readable formatting, and recursive traversal with and without hidden files.

## Author

Aleksandr Pavlov
[LinkedIn](https://linkedin.com/in/pavloveone)
