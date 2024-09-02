---

# S3 Static Website Hosting with Public Access

This repository contains a Bash script to create an Amazon S3 bucket, configure it for static website hosting, set the appropriate permissions, and upload your web files. This script simplifies the process of setting up a publicly accessible static website hosted on Amazon S3.

## Prerequisites

- AWS CLI must be installed and configured with appropriate permissions.
- Bash shell environment.
- Your AWS account should have the necessary permissions to create and modify S3 buckets.

## Script Overview

The Bash script performs the following steps:

1. **Bucket Creation**: Creates an S3 bucket with the specified name and region.
2. **Public Access Configuration**: Modifies the public access settings to allow the bucket to be used for static website hosting.
3. **Bucket Policy**: Applies a bucket policy to allow public read access to the files in the bucket.
4. **Static Website Hosting Configuration**: Enables static website hosting on the S3 bucket.
5. **File Upload**: Uploads the `index.html`, `styles.css`, and `scripts.js` files to the bucket.
6. **Website URL**: Outputs the URL of the hosted website.

## Usage

1. Clone this repository to your local machine.
2. Navigate to the directory where the script is located.
3. Make sure your web files (`index.html`, `styles.css`, `scripts.js`) are in the same directory as the script.
4. Run the script, passing the bucket name as an argument:

   ```bash
   ./hosting.sh <bucket-name>
   ```

   Replace `<bucket-name>` with your desired bucket name.

   Example:

   ```bash
   ./hosting.sh gudisa-web
   ```

## Script Output

- **Bucket Creation**: Confirms the bucket creation.
- **Public Access Configuration**: Confirms the public access settings.
- **Bucket Policy**: Confirms the application of the bucket policy.
- **Static Website Hosting Configuration**: Confirms that static website hosting is enabled.
- **File Upload**: Confirms the upload of each file.
- **Website URL**: Outputs the URL where the static website can be accessed.

## Example Script Output

```bash
Bucket 'gudisa-web' created successfully in region 'us-east-1'.
Public access settings adjusted for bucket 'gudisa-web'.
Bucket policy applied successfully to 'gudisa-web'.
Static website hosting enabled for 'gudisa-web'.
Uploading index.html to S3 bucket gudisa-web...
Uploading styles.css to S3 bucket gudisa-web...
Uploading scripts.js to S3 bucket gudisa-web...
Files uploaded successfully. You can access your website at: http://gudisa-web.s3-website.us-east-1.amazonaws.com
```

## Notes

- Ensure the bucket name you choose is globally unique.
- The script assumes that your region is `us-east-1`. Modify the `REGION` variable in the script if your bucket is in a different region.
- The script does not handle advanced error cases or logging. For production use, consider adding more robust error handling and logging mechanisms.
