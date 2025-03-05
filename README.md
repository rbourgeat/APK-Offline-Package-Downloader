# APK Package Downloader

This project provides a simple shell script to download APK packages using Docker and Alpine Linux. It verifies the presence of Docker, checks for a [./packages.txt](packages.txt) file listing the desired packages, and then fetches these packages, saving them in the local `./packages` directory.

## Prerequisites

Ensure you have the following installed on your system:

- [Docker](https://www.docker.com/)

- A [./packages.txt](packages.txt) file containing the list of packages to be downloaded, located in the same directory as the script.

## Usage

1. Clone the repository:

```bash
git clone git@github.com:rbourgeat/APK-Offline-Package-Downloader.git
cd APK-Offline-Package-Downloader
```

2. Create and populate the [./packages.txt](packages.txt) file with the APK packages you want to download. Each package should be on a new line.

3. Run the script:

```bash
bash download_apk.sh
```

4. (Optional) Generate the APKINDEX file for the downloaded packages:

```bash
bash generate_apkindex.sh
```

## Example `packages.txt` File

```txt
vim
curl
git
```
