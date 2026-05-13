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
- **Environment Driven**: Seamlessly integrates with `.env` files for secure credential management.
- **Tooling Validation**: Built-in dependency checking to ensure all required binaries are available.

## Tech Stack

- **Scripting**: Pure Bash
- **Data Processing**: `jq` for JSON manipulation
- **Network**: `curl` for API communication
- **Version Control**: `git` for repository synchronization
- **Automation**: `make` for workflow orchestration

## Project Structure

- `git-mirror-all`: The primary execution script for fetching and syncing repositories.
- `Makefile`: Provides high-level commands for setup, dependency checking, and execution.
- `.env.example`: Template for environment configuration.
- `LICENSE`: MIT License documentation.

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/unamatasanatarai/git-mirror-all.git
   cd git-mirror-all
   ```

2. **Initialize configuration**:
   ```bash
   make setup
   ```

3. **Configure credentials**:
   Edit the generated `.env` file and provide your GitHub Personal Access Token:
   ```bash
   GITHUB_TOKEN="your_personal_access_token"
   BACKUP_DIR="git-backup"
   ```

## Usage

### Generate a token

You can generate a token at: https://github.com/settings/tokens (requires 'repo' scope).

### Using Make (Recommended)

Run the full backup process with a single command:
```bash
make backup
```

### Direct Execution

You can also run the script directly with optional positional arguments:
```bash
./git-mirror-all [BACKUP_DIR] [GITHUB_TOKEN]
```

## Configuration

The utility looks for a `.env` file in the root directory. The following variables are supported:

| Variable | Description | Default |
| :--- | :--- | :--- |
| `GITHUB_TOKEN` | Your GitHub Personal Access Token (Required) | None |
| `BACKUP_DIR` | Local directory where repositories will be mirrored | `.` |

## Tests

Verify that your environment has all necessary dependencies installed:
```bash
make check
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
