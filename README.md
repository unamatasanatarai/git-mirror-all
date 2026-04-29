# git-backup

![GitHub](https://img.shields.io/badge/GitHub-API-blue?logo=github)
![Bash](https://img.shields.io/badge/Script-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![Git](https://img.shields.io/badge/Tool-Git-F05032?logo=git&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

An automated GitHub repository backup tool that mirrors all repositories from a user account to a local filesystem. It ensures complete off-site backups by maintaining full git mirrors, including all branches, tags, and commit history.

## Features

- **Automated Mirroring**: Uses `git clone --mirror` to capture all repository data and references.
- **Incremental Updates**: Updates existing backups using `git remote update --prune` to synchronize changes and remove deleted remote branches.
- **API Pagination**: Handles large accounts by iterating through paginated GitHub API results (100 repos per page).
- **Flexible Configuration**: Supports credentials via `.env` files, environment variables, or command-line arguments.
- **Cross-Platform**: Works on any Unix-like system (macOS, Linux) with bash and git.

## Tech Stack

- **Scripting**: Bash
- **Data Processing**: jq
- **Network**: Curl
- **Version Control**: Git
- **Task Runner**: Make (Optional)
- **API**: GitHub REST API


## Project Structure

- `make.sh`: The core shell script containing logic for API interaction and repository synchronization.
- `Makefile`: A professional wrapper for managing dependencies, configuration, and execution.
- `.env.example`: Template for environment configuration.
- `.gitignore`: Configured to exclude system files, local backups, and sensitive credentials.
- `LICENSE`: MIT License.

## Installation

### Prerequisites

Ensure the following tools are installed on your system:
- `git`
- `curl`
- `jq`

### Setup

You can set up the project using the provided `Makefile` or manually.

#### Option A: Using Make (Quickest)
```bash
make setup
```

#### Option B: Manual Setup
```bash
cp .env.example .env
# Edit .env and provide your GITHUB_TOKEN and BACKUP_DIR
```

## Usage

The project is designed to be flexible. You can use `make` for convenience or call the script directly.

### 1. Using Make
Run the backup process with settings from `.env`:
```bash
make backup
```
Override configuration:
```bash
make backup DIR="./custom_dir" TOKEN="ghp_alternative_token"
```

### 2. Direct Execution (Make-free)
Pass variables via positional arguments:
```bash
./make.sh [BACKUP_DIR] [GITHUB_TOKEN]
```
Example:
```bash
./make.sh "./backups" "ghp_your_token_here"
```


## Configuration

| Variable | Description |
| :--- | :--- |
| `GITHUB_TOKEN` | GitHub Personal Access Token (requires `repo` scope for private repositories). |
| `BACKUP_DIR` | Local directory where mirror repositories will be stored. |

## License

Distributed under the MIT License. See `LICENSE` for more information.
