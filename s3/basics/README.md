````markdown
# Bash Scripts for AWS S3 Operations

This repository contains various Bash scripts for managing AWS S3 buckets and objects. These scripts perform operations such as creating and deleting S3 buckets, managing S3 objects, and listing buckets and objects.

## Scripts

### 1. `create-bucket.sh`

Creates a new S3 bucket.

#### Usage

```bash
./create-bucket.sh <bucket-name>
```
````

#### Arguments

- `<bucket-name>`: The name of the S3 bucket to create.

### 2. `delete.sh`

Deletes an S3 bucket or optionally all objects inside it.

#### Usage

```bash
./delete.sh [-r] <bucket-name> [object-key]
```

#### Options

- `-r`: Recursively delete all objects in the bucket.

#### Arguments

- `<bucket-name>`: The name of the S3 bucket.
- `[object-key]`: The key of the object to delete (optional).

### 3. `list-objects.sh`

Lists all objects inside a specified S3 bucket.

#### Usage

```bash
./list-objects.sh <bucket-name>
```

#### Arguments

- `<bucket-name>`: The name of the S3 bucket.

### 4. `put-object.sh`

Uploads a file to an S3 bucket.

#### Usage

```bash
./put-object.sh <bucket-name> <file-path>
```

#### Arguments

- `<bucket-name>`: The name of the S3 bucket.
- `<file-path>`: The path to the file to upload.

### 5. `delete-objects.sh`

Deletes an object from a specified S3 bucket or all objects if the `-r` flag is used.

#### Usage

```bash
./delete-objects.sh [-r] <bucket-name> [object-key]
```

#### Options

- `-r`: Recursively delete all objects in the bucket.

#### Arguments

- `<bucket-name>`: The name of the S3 bucket.
- `[object-key]`: The key of the object to delete (optional).

### 6. `create-random-files.sh`

Generates a set of random text files.

#### Usage

```bash
./create-random-files.sh
```

This script does not require any arguments.

### 7. `sync.sh`

Synchronizes files in a local directory with an S3 bucket.

#### Usage

```bash
./sync.sh <bucket-name>
```

#### Arguments

- `<bucket-name>`: The name of the S3 bucket.

## Prerequisites

- AWS CLI installed and configured with appropriate permissions.
- Bash environment.

## Contributing

Feel free to open issues or pull requests for improvements.

```

```
