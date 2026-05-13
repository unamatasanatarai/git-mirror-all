# Git Mirror All

[![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Git](https://img.shields.io/badge/Version%20Control-Git-F05032?logo=git&logoColor=white)](https://git-scm.com/)
[![GitHub API](https://img.shields.io/badge/API-GitHub-181717?logo=github&logoColor=white)](https://docs.github.com/en/rest)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![cURL](https://img.shields.io/badge/Tools-cURL-073551?logo=curl&logoColor=white)](https://curl.se/)
[![jq](https://img.shields.io/badge/Tools-jq-ace?logo=json&logoColor=white)](https://stedolan.github.io/jq/)

A robust Bash utility designed to automate the mirroring and backup of all GitHub repositories associated with a user account. It ensures local copies are synchronized with remote changes using high-performance Git mirror protocols.

## Features

- **Automated Discovery**: Fetches all user repositories via the GitHub REST API with full pagination support.
- **Incremental Updates**: Uses `git remote update --prune` for existing mirrors to minimize bandwidth and time.
- **Mirror Cloning**: Creates full Git mirrors using `--mirror` to preserve all branches, tags, and refs.
- **XDG Compliance**: Securely stores configuration in standard XDG locations.
- **Interactive Setup**: Automatically prompts for and saves your GitHub token if not configured.
- **Tooling Validation**: Built-in dependency checking to ensure all required binaries are available.

## Tech Stack

- **Scripting**: Pure Bash
- **Data Processing**: `jq` for JSON manipulation
- **Network**: `curl` for API communication
- **Version Control**: `git` for repository synchronization
- **Automation**: `make` for workflow orchestration

## Project Structure

- `git-mirror-all`: The primary execution script for fetching and syncing repositories.
- `Makefile`: Provides high-level commands for backup, dependency checking, and help.
- `LICENSE`: MIT License documentation.

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/unamatasanatarai/git-mirror-all.git
   cd git-mirror-all
   ```

2. **Verify dependencies**:
   ```bash
   make check
   ```

## Usage

### Using Make (Recommended)

Run the full backup process by specifying a target directory:
```bash
make backup DIR=my-backups
```
*If `DIR` is omitted, it defaults to `git-backup`.*

### Direct Execution

Run the script directly with the mandatory `BACKUP_DIR` argument:
```bash
./git-mirror-all <BACKUP_DIR> [GITHUB_TOKEN]
```

### Interactive Token Setup

On the first run, if a token is not found in the environment or config file, the script will:
1. Display information on how to generate a token at [GitHub Settings](https://github.com/settings/tokens).
2. Prompt you to enter your token.
3. Save it securely to `~/.config/git-backup/config`.

## Configuration

The utility uses the standard XDG config location: `~/.config/git-backup/config` (or `$XDG_CONFIG_HOME/git-backup/config`).

| Variable | Description |
| :--- | :--- |
| `GITHUB_TOKEN` | Your GitHub Personal Access Token (Required) |

## Tests

Verify that your environment has all necessary dependencies installed:
```bash
make check
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

