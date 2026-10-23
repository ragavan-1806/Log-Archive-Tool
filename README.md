# Log Archive Tool

A simple Bash CLI tool to compress and archive Linux server logs with a timestamp.

## Project URL

https://roadmap.sh/projects/log-archive-tool

## Features

- Accepts a log directory as a command-line argument
- Compresses logs into `.tar.gz` files
- Generates timestamped archive filenames
- Stores archives in a separate directory
- Records successful archive operations
- Supports automated scheduling with cron

## Usage

```bash
chmod +x log-archive.sh
./log-archive.sh /path/to/logs
```

## Example

```bash
./log-archive.sh ~/test-logs
```

## Technologies

Bash, Linux, tar, gzip, cron

## Reference

[Roadmap.sh Log Archive Tool](https://roadmap.sh/projects/log-archive-tool)
