package com.example.myapp;

import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.CreateBucketRequest;
import software.amazon.awssdk.services.s3.model.CreateBucketResponse;
import software.amazon.awssdk.services.s3.model.ListBucketsRequest;
import software.amazon.awssdk.services.s3.model.ListBucketsResponse;
import software.amazon.awssdk.services.s3.model.S3Exception;

public class App {
    public static void main(String[] args) {
        String bucketName = "my-new-bucket"; // Replace with your desired bucket name

        // Initialize the S3 client
        S3Client s3 = S3Client.builder()
                .region(Region.US_EAST_1) // Set your preferred region
                .credentialsProvider(ProfileCredentialsProvider.create())
                .build();

        try {
            // Create a new bucket
            CreateBucketRequest createBucketRequest = CreateBucketRequest.builder()
                    .bucket(bucketName)
                    .build();

            CreateBucketResponse createBucketResponse = s3.createBucket(createBucketRequest);
            System.out.println("Bucket created successfully: " + createBucketResponse.location());

            // List all buckets
            ListBucketsRequest listBucketsRequest = ListBucketsRequest.builder().build();
            ListBucketsResponse listBucketsResponse = s3.listBuckets(listBucketsRequest);
            System.out.println("Listing buckets:");
            listBucketsResponse.buckets().forEach(bucket -> System.out.println(bucket.name()));

        } catch (S3Exception e) {
            e.printStackTrace();
        } finally {
            // Close the S3 client
            s3.close();
        }
    }
}
