# AWS EC2 Step-by-Step Guide

## Introduction to AWS EC2

Amazon Elastic Compute Cloud (Amazon EC2) is a foundational web service provided by AWS that delivers scalable and flexible compute capacity in the cloud. Whether you're running applications for personal projects or enterprise-level services, EC2 enables you to deploy virtual servers, known as instances, quickly and efficiently. With a wide variety of configurations and pricing models, EC2 is designed to meet the diverse needs of developers, system administrators, and businesses across different industries.

One of the key advantages of Amazon EC2 is its flexibility. Users can select from a broad range of instance types, each optimized for different use cases, from memory-intensive applications to general-purpose workloads. Furthermore, you can customize your virtual machines by choosing the operating system, storage options, and networking configurations, ensuring that the environment matches your exact requirements.

EC2 also supports auto-scaling, allowing you to adjust capacity automatically based on traffic or demand fluctuations. This ensures that you only pay for the resources you use, making it cost-effective for both short-term and long-term needs. Amazon EC2's diverse pricing models, such as On-Demand Instances, Reserved Instances, and Spot Instances, give users the flexibility to optimize costs based on their usage patterns.

In this guide, we will walk through the process of setting up and managing EC2 instances, covering everything from selecting the right instance type to configuring security settings, networking, and storage. By the end, you’ll have the foundational knowledge needed to launch and manage virtual servers in the AWS cloud.

Here's a section that explains **Cloud-Init** and its relevance to AWS EC2:

---

## Cloud-Init in AWS EC2

**Cloud-Init** is an industry-standard tool used for cloud instance initialization. It allows you to customize the configuration of EC2 instances at boot time. With Cloud-Init, you can automate tasks such as installing software, running scripts, and setting configuration files when launching an instance.

In the context of AWS EC2, you can use Cloud-Init by passing user data (a script or a configuration) to your EC2 instance during the launch process. This user data is executed on the instance’s first boot.

### Benefits of Cloud-Init in EC2

- **Automation**: Automatically install packages, configure services, and customize your instance without manual intervention.
- **Customization**: Apply instance-specific configurations such as hostname, networking, and security settings.
- **Script Execution**: Run shell scripts, cloud-init directives, or other executable commands at instance startup.

### Using Cloud-Init with EC2

To leverage Cloud-Init, you need to pass a user data script during the EC2 instance launch. Here's a simple example of a user data script that updates the system and installs Apache web server:

```bash
#!/bin/bash
# Update the system
sudo yum update -y

# Install Apache
sudo yum install httpd -y

# Start Apache and enable it to run at boot
sudo systemctl start httpd
sudo systemctl enable httpd

# Print success message
echo "Apache Web Server installed and started successfully"
```

This script will:

1. Update the package manager.
2. Install Apache (httpd).
3. Start Apache and configure it to run on boot.
4. Print a success message.

When launching the instance, you can paste this script in the **User data** field under the **Advanced Details** section in the EC2 launch wizard.

### Cloud-Init Example: Passing User Data in EC2 Console

1. **Launch EC2 Instance**: Navigate to the EC2 console and click **Launch Instance**.
2. **Configure Instance Details**: Choose an Amazon Machine Image (AMI), instance type, and other required configurations.
3. **Add User Data**:
   - Scroll down to **Advanced Details**.
   - Find the **User data** field and paste the script.
4. **Launch the Instance**: Complete the remaining configurations and launch the instance. The Cloud-Init script will be executed automatically upon boot.

## EC2 Instance Types

Amazon EC2 provides a wide variety of instance types designed to meet different use cases. Each instance type offers a specific combination of CPU, memory, storage, and networking capacity, allowing users to choose the right mix of resources for their applications.

### Categories of EC2 Instance Types

1. **General Purpose**

   - Balanced resources for compute, memory, and networking.
   - Suitable for web servers, application servers, small to medium-sized databases, and development environments.
   - **Example Instance Types**: `t2`, `t3`, `t3a`, `m5`, `m6g`.

2. **Compute Optimized**

   - Ideal for compute-bound applications that require high-performance processors.
   - Use cases include high-performance computing (HPC), batch processing, and gaming servers.
   - **Example Instance Types**: `c5`, `c6g`.

3. **Memory Optimized**

   - Designed for memory-intensive applications that process large datasets in memory.
   - Suitable for real-time big data analytics, in-memory databases like Redis, and high-performance databases.
   - **Example Instance Types**: `r5`, `r6g`, `x1`, `x2idn`.

4. **Storage Optimized**

   - Optimized for high, sequential read and write access to large datasets on local storage.
   - Best for large-scale, data-heavy applications such as NoSQL databases (e.g., Cassandra), data warehousing, and distributed file systems.
   - **Example Instance Types**: `i3`, `i4i`, `d2`, `h1`.

5. **Accelerated Computing**
   - Uses hardware accelerators or co-processors, such as GPUs or FPGAs, to perform functions more efficiently than software running on CPUs.
   - Best for machine learning, AI training and inference, high-performance computing (HPC), and video processing.
   - **Example Instance Types**: `p3`, `p4`, `g4ad`, `g5`.

### Choosing the Right EC2 Instance Type

When selecting an EC2 instance type, consider the following factors:

- **Application Requirements**: Determine the required balance of compute, memory, storage, and networking.
- **Performance**: Match the performance requirements of your workload (e.g., low-latency, high throughput, high CPU usage).
- **Cost Efficiency**: Choose an instance type that meets performance needs while minimizing costs. Consider Reserved Instances or Spot Instances for cost savings.
- **Scalability**: Ensure that your instance type can scale as your workload grows.

### Example of Choosing an Instance Type

- **Web Servers**: General-purpose instances like `t3.micro` are a good starting point for low-traffic websites.
- **High-Performance Computing (HPC)**: Use compute-optimized instances such as `c5` for CPU-intensive tasks.
- **In-Memory Databases**: Memory-optimized instances like `r5` are ideal for large-scale databases that need fast access to memory.

### Instance Size

Each instance type comes in different sizes, allowing you to scale the instance’s resources to match your workload. For example, the `t3` instance family offers sizes ranging from `t3.nano` to `t3.2xlarge`, providing flexibility in balancing cost and performance.

---

## EC2 Instance Families

Amazon EC2 instance families group instance types based on their common characteristics, such as compute power, memory, storage, and networking. Each family is optimized for specific types of workloads, making it easier to select instances based on the nature of your application. Instance families include various sizes that provide flexibility in resource allocation.

### Common EC2 Instance Families

1. **T Instance Family (Burstable Performance)**

   - Designed for applications with variable CPU demands.
   - These instances provide a baseline level of CPU performance with the ability to burst when additional compute power is needed.
   - Suitable for workloads like microservices, small databases, and web servers.
   - **Example Types**: `t2`, `t3`, `t3a`.
   - **Use Case**: Websites with inconsistent traffic or development environments.

2. **M Instance Family (General Purpose)**

   - Offers a balance of compute, memory, and network resources.
   - Ideal for a wide variety of workloads, including small to medium-sized databases, web servers, and enterprise applications.
   - **Example Types**: `m5`, `m5a`, `m6g`.
   - **Use Case**: Application servers and backend servers.

3. **C Instance Family (Compute Optimized)**

   - Designed for compute-intensive applications that benefit from high CPU performance.
   - Suitable for tasks such as batch processing, media encoding, and gaming.
   - **Example Types**: `c5`, `c6g`, `c7g`.
   - **Use Case**: High-performance computing (HPC), scientific modeling, and machine learning inference.

4. **R Instance Family (Memory Optimized)**

   - Optimized for memory-intensive applications.
   - Best suited for large-scale in-memory applications such as real-time big data analytics, in-memory caching, and large relational databases.
   - **Example Types**: `r5`, `r6g`, `r5b`.
   - **Use Case**: High-performance databases like Redis and large enterprise applications.

5. **X Instance Family (High Memory)**

   - Provides the highest RAM per vCPU, optimized for in-memory databases and memory-bound applications.
   - Ideal for workloads that require high memory-to-CPU ratios.
   - **Example Types**: `x1`, `x1e`, `x2idn`.
   - **Use Case**: SAP HANA, in-memory databases, and real-time analytics.

6. **I Instance Family (Storage Optimized)**

   - Optimized for workloads requiring low latency and high-speed local storage.
   - These instances use Non-Volatile Memory Express (NVMe) SSD storage.
   - **Example Types**: `i3`, `i4i`.
   - **Use Case**: NoSQL databases, data warehousing, and distributed file systems.

7. **P Instance Family (Accelerated Computing - GPU)**

   - Equipped with powerful GPUs for high-performance computing tasks like machine learning training, AI inference, and deep learning.
   - **Example Types**: `p3`, `p4d`.
   - **Use Case**: Machine learning model training, AI, and graphic rendering.

8. **G Instance Family (GPU Graphics and Gaming)**

   - Designed for workloads requiring hardware acceleration for graphics and gaming.
   - These instances provide powerful GPUs for tasks like video rendering, gaming, and virtual desktops.
   - **Example Types**: `g4ad`, `g5`.
   - **Use Case**: 3D rendering, virtual desktop infrastructure (VDI), and gaming.

9. **D Instance Family (Dense Storage)**

   - Designed for applications that require high, sequential read and write access to very large datasets.
   - **Example Types**: `d2`, `d3`.
   - **Use Case**: Data warehousing and Hadoop clusters.

10. **H Instance Family (High Disk Throughput)**
    - Optimized for large data storage needs, providing high disk throughput and dense storage capacity.
    - **Example Types**: `h1`.
    - **Use Case**: Distributed file systems and big data analytics.

### Key Considerations for Selecting an Instance Family

- **Workload Type**: Match your application needs (e.g., compute, memory, or storage intensive) with the instance family's strengths.
- **Cost Efficiency**: Select the instance family that offers the best balance of performance and cost for your use case.
- **Scalability**: Ensure that your instance family can scale up or down as workload requirements change.

### Instance Family Sizes

Each instance family supports multiple instance sizes, allowing for fine-tuned scaling based on your specific resource needs. For example, the `m5` family offers sizes from `m5.large` to `m5.24xlarge`, with increasing amounts of CPU, memory, and network bandwidth.

## EC2 Processors

Amazon EC2 instances offer a variety of processors optimized for different workloads. Depending on your performance needs, EC2 provides access to processors that can deliver the required compute power for diverse applications, from general-purpose workloads to compute-intensive tasks like machine learning or high-performance computing.

### Types of Processors Available in EC2

1. **Intel Xeon Scalable Processors**

   - Intel-based EC2 instances are powered by Intel Xeon Scalable processors, which deliver a combination of performance, flexibility, and security for cloud workloads.
   - **Features**: Advanced Vector Extensions (AVX-512), Secure Guard Extensions (SGX), and Turbo Boost for higher performance during peak loads.
   - **Use Cases**: High-performance computing (HPC), enterprise applications, analytics, and database workloads.
   - **Example Instances**: `m5`, `c5`, `r5`.

2. **AMD EPYC Processors**
   - AMD-based EC2 instances are powered by AMD EPYC processors, which offer cost-efficient computing power with a balanced ratio of compute and memory.
   - These instances provide a similar level of performance to Intel-based instances but are typically priced 10% lower.
   - **Use Cases**: General-purpose, memory-optimized, and compute-intensive workloads.
   - **Example Instances**: `m5a`, `r5a`, `c5a`.
3. **AWS Graviton Processors (Arm-based)**

   - AWS Graviton processors are custom-built by AWS based on 64-bit Arm architecture, offering significant price-performance advantages over x86-based processors.
   - **Graviton2** processors deliver up to 40% better price-performance than comparable x86 instances.
   - **Graviton3** processors, the latest generation, provide improved compute performance, memory bandwidth, and 60% lower energy consumption.
   - **Use Cases**: General-purpose, compute-optimized, and memory-optimized workloads, including web servers, microservices, containerized applications, and databases.
   - **Example Instances**: `t4g`, `m6g`, `r6g`, `c7g`.

4. **NVIDIA GPUs**

   - EC2 instances equipped with NVIDIA GPUs (Graphics Processing Units) are designed for workloads that require hardware acceleration, such as machine learning (ML), artificial intelligence (AI), and graphic-intensive applications.
   - **NVIDIA V100** and **A100 Tensor Core** GPUs offer specialized acceleration for ML training, inference, high-performance computing (HPC), and video rendering.
   - **Use Cases**: Deep learning model training, scientific simulations, and high-end graphics rendering.
   - **Example Instances**: `p4d`, `g5`.

5. **Xilinx FPGAs (Field-Programmable Gate Arrays)**
   - EC2 instances with Xilinx FPGAs offer hardware acceleration for specific compute tasks that require high-performance and low-latency processing.
   - FPGAs are reconfigurable chips that can be programmed to optimize specific workloads such as real-time video processing, genomics, and financial simulations.
   - **Use Cases**: Real-time data analytics, algorithmic trading, and image processing.
   - **Example Instances**: `f1`.

### Choosing the Right Processor for Your EC2 Instance

Selecting the appropriate processor depends on the nature of your workload:

- **Intel Xeon**: Best for high-performance, secure workloads requiring broad compatibility and advanced processing features.
- **AMD EPYC**: Ideal for cost-conscious users who need similar performance to Intel but at a lower price point.
- **AWS Graviton**: Perfect for optimizing cost and performance for cloud-native workloads, particularly if you're using containerized environments or microservices.
- **NVIDIA GPUs**: Best for AI, machine learning, and GPU-intensive workloads such as video processing and 3D rendering.
- **Xilinx FPGAs**: Suitable for workloads requiring custom hardware acceleration and extremely low latency.

## EC2 Instance Sizes, Instance Profiles, and Lifecycle

### EC2 Instance Sizes

Each EC2 instance type comes in various sizes to match different levels of compute, memory, and networking resources. The size determines the number of virtual CPUs (vCPUs), memory, storage, and networking performance you get. This flexibility allows you to right-size your instances based on your application's needs.

### Example of EC2 Instance Sizes:

| Instance Type | Size          | vCPUs | Memory (GiB) | Network Performance |
| ------------- | ------------- | ----- | ------------ | ------------------- |
| **t3**        | t3.nano       | 2     | 0.5          | Up to 5 Gigabit     |
| **m5**        | m5.large      | 2     | 8            | Up to 10 Gigabit    |
| **c5**        | c5.xlarge     | 4     | 8            | Up to 10 Gigabit    |
| **r5**        | r5.2xlarge    | 8     | 64           | 10 Gigabit          |
| **g4ad**      | g4ad.16xlarge | 64    | 256          | 25 Gigabit          |

### Choosing the Right Size

- **Small (e.g., t3.nano, t3.micro)**: Ideal for low-traffic websites, small databases, or lightweight applications.
- **Medium (e.g., m5.large, c5.large)**: Suitable for web applications, moderate databases, or backend services.
- **Large (e.g., r5.2xlarge, g4ad.16xlarge)**: Best for high-memory or compute-intensive workloads, such as large databases, machine learning, and analytics.

### EC2 Instance Profiles

An **EC2 Instance Profile** is an AWS identity that allows an EC2 instance to access AWS resources, such as S3 buckets, DynamoDB tables, and more. It is tied to an **IAM role**, and when an instance is launched with an instance profile, it inherits the permissions associated with that IAM role.

**Why Use an Instance Profile?**

- **Security**: Instead of embedding sensitive credentials into your application, instance profiles manage access via IAM roles.
- **Automation**: Automatically grant access to AWS resources without needing to configure keys manually.

### Steps to Attach an Instance Profile to an EC2 Instance

1. **Create an IAM Role**:

   - In the IAM console, create a new role with appropriate policies (e.g., S3FullAccess).
   - Attach this role to the EC2 service.

2. **Create an Instance Profile**:

   - The instance profile is automatically created with the role, which can then be attached to EC2 instances.

3. **Attach Instance Profile**:
   - When launching a new instance, go to the **IAM role** section and select the instance profile (role) you just created.
   - This grants the instance permission to perform actions on AWS resources.

### EC2 Instance Lifecycle

The lifecycle of an EC2 instance consists of several key states:

1. **Launch**: An instance is created based on your selected AMI (Amazon Machine Image), instance type, key pair, and security settings. User data and Cloud-Init scripts are executed at this point.
2. **Pending**: Once launched, the instance enters a **pending** state while AWS prepares it. This phase includes allocating resources, setting up networking, and booting the OS.
3. **Running**: The instance is fully initialized and operational. You can connect via SSH or RDP and start using your instance for your application.
4. **Stopped**: You can stop the instance to save costs. When stopped, the instance releases its underlying host hardware, but the EBS-backed root volume remains, preserving your data. You can restart the instance later.
5. **Terminated**: A terminated instance is permanently deleted. All attached volumes are deleted unless you've specified to keep them. This state is irreversible, and the instance cannot be restarted.

### EC2 Instance Lifecycle Diagram

Here’s how the lifecycle of an EC2 instance looks visually:

```
+------------------+     +-----------+    +-----------+     +------------+
| Instance Launch  +---->+  Pending  +--->+  Running  +----> + Terminated |
+------------------+     +-----------+    +-----------+     +------------+
                                     |          |
                                     |          V
                                     |      +----------+
                                     |      | Stopped  |
                                     |      +----------+
                                     V
                                +-----------+
                                | Terminated|
                                +-----------+
```

### Key Operations in the Lifecycle:

- **Start/Stop**: You can start and stop instances at any time. Stopping will halt billing for the compute resources, but storage charges for EBS volumes continue.
- **Reboot**: Instances can be rebooted without losing any data or configurations. This is useful for applying patches or updates that require a restart.
- **Terminate**: When you no longer need the instance, terminating it will permanently delete it.

## EC2 Instance Console, Hostnames, Default Username, and Burstable Instances

### EC2 Instance Console

The **EC2 Instance Console** provides a way to manage your instances directly from the AWS Management Console. It allows you to:

- Monitor the instance’s state and health.
- Access logs and the system console output.
- Manage networking, storage, and security settings.
- Use CloudWatch for performance metrics.

Here’s a sample screenshot showing the EC2 instance management page:

![EC2 Instance Console Screenshot](#)  
_(Replace this placeholder with your own screenshot of the EC2 console.)_

### EC2 Hostnames

When an EC2 instance is launched, AWS automatically assigns it two hostnames:

1. **Private DNS (Hostname)**: This is used within the same VPC (Virtual Private Cloud) for internal communication between instances.
2. **Public DNS (Hostname)**: This is used to connect to your instance over the internet when it has a public IP or Elastic IP.

For example, an instance might have:

- **Private DNS**: `ip-172-31-0-23.ec2.internal`
- **Public DNS**: `ec2-203-0-113-25.compute-1.amazonaws.com`

Hostnames are dynamically assigned and will change if the instance is stopped and started unless you assign an **Elastic IP** to maintain a persistent public IP.

### EC2 Default Username

When you launch an EC2 instance, AWS provides a default user for SSH access based on the AMI (Amazon Machine Image) you're using. Here are some common default usernames:

- **Amazon Linux, Amazon Linux 2**: `ec2-user`
- **Ubuntu**: `ubuntu`
- **CentOS**: `centos`
- **RHEL (Red Hat Enterprise Linux)**: `ec2-user`
- **Debian**: `admin` or `root`
- **SUSE Linux**: `ec2-user`
- **Fedora**: `fedora`

To connect to your instance via SSH, you can use the following command:

```bash
ssh -i /path/to/your-key.pem ec2-user@your-instance-public-dns
```

Make sure to replace `ec2-user` with the correct default username for your instance's operating system and `your-instance-public-dns` with your instance's public DNS or IP.

### Burstable Instances

**Burstable Performance Instances** (T3, T2) are ideal for workloads that have low-to-moderate CPU usage most of the time but need occasional bursts of higher CPU performance. These instances accumulate **CPU credits** during periods of low usage, which can then be used to burst CPU performance when needed.

#### How Burstable Instances Work:

- **CPU Credits**: Each instance earns CPU credits while operating at a baseline level. When the instance exceeds the baseline, it uses these credits to burst.
- **Baseline Performance**: Each instance size (e.g., `t3.micro`, `t3.large`) has a specific baseline performance, which dictates how much CPU it can use before needing to dip into CPU credits.
- **Unlimited vs Standard**:
  - **Standard instances** stop bursting when CPU credits run out, and performance drops back to the baseline.
  - **Unlimited instances** can burst beyond their credit limits but incur additional charges for the extra CPU usage.

#### Example Use Cases for Burstable Instances:

- Web servers with occasional traffic spikes.
- Development and testing environments.
- Low-latency microservices.

#### Burstable Instance Sizes:

| Instance Type | Size      | vCPUs | Baseline CPU | Memory (GiB) | Max CPU Performance (with credits) |
| ------------- | --------- | ----- | ------------ | ------------ | ---------------------------------- |
| **t3.nano**   | t3.nano   | 2     | 5%           | 0.5          | 100%                               |
| **t3.micro**  | t3.micro  | 2     | 10%          | 1            | 100%                               |
| **t3.medium** | t3.medium | 2     | 20%          | 4            | 100%                               |
| **t3.large**  | t3.large  | 2     | 30%          | 8            | 100%                               |

These burstable instances are a cost-effective solution for workloads that experience intermittent or unpredictable demand.

---

## EC2 Source/Destination Checks, System Logs, Placement Groups, and EC2 Connect

### Source/Destination Checks

**Source/Destination Checks** are enabled by default on every EC2 instance. These checks ensure that the instance can only handle network traffic intended for or originating from itself. This feature is designed to ensure security and prevent the instance from being misused as a network forwarding device.

#### When Should Source/Destination Checks Be Disabled?

In scenarios where an EC2 instance is being used as a **NAT gateway**, **VPN server**, or **network router**, it will need to forward traffic on behalf of other devices. In these cases, disabling Source/Destination Checks is necessary so that the instance can forward traffic.

#### Diagram: Source/Destination Check Behavior

```
+-------------------+                               +-------------------+
|                   |         Allowed Traffic       |                   |
|   EC2 Instance A  +------------------------------>+   EC2 Instance B  |
|                   |                               |                   |
+-------------------+                               +-------------------+

With Source/Destination Check Enabled:
- Traffic originating from and destined for Instance A is allowed.
- Traffic forwarding for other instances is blocked.

When Disabled:
- Traffic forwarding for other instances is allowed (e.g., for NAT).
```

#### Steps to Disable Source/Destination Checks:

1. Open the **EC2 Console**.
2. Select the instance you want to modify.
3. Choose **Actions > Networking > Change Source/Destination Check**.
4. Set it to **Disabled**.

---

### EC2 System Logs

**EC2 System Logs** provide insight into system events, especially during boot time, by logging boot messages, kernel output, and other system-level events. These logs can be helpful for debugging and identifying configuration issues, especially if an instance fails to start or run as expected.

#### Key Information Available in System Logs:

- **Boot messages**: Information about the boot process, such as kernel initialization.
- **User data execution logs**: Output from any user data scripts executed at boot.
- **OS-level errors**: Any kernel panics, missing drivers, or system service failures.

#### Diagram: EC2 System Log Lifecycle

```
+-------------------+       +---------------------+       +---------------------+
| Launch EC2        |------>| Instance Boots      |------>| System Logs Captured |
| Instance          |       | with User Data      |       |   (Boot, Errors)     |
+-------------------+       +---------------------+       +---------------------+
                                                                |
                                                                V
                                               +-------------------------------------+
                                               |    View System Logs via EC2 Console |
                                               +-------------------------------------+
```

#### Accessing System Logs:

1. Open the **EC2 Console**.
2. Select the instance, then go to **Actions > Monitor and Troubleshoot > Get System Log**.
3. View the log output in the provided window.

---

### Placement Groups

**Placement Groups** in AWS EC2 are used to control how instances are physically placed within the AWS infrastructure. This can influence performance and fault tolerance. There are three types of placement groups, each optimized for different use cases.

1. **Cluster Placement Group**:
   - Instances are placed close together in a single Availability Zone.
   - This placement type is optimized for low-latency, high-bandwidth workloads such as **HPC (High-Performance Computing)** or **distributed computing**.
2. **Spread Placement Group**:
   - Instances are placed on distinct hardware racks, which reduces the risk of simultaneous hardware failure.
   - Ideal for workloads that require **high availability** and **fault tolerance**.
3. **Partition Placement Group**:
   - Instances are grouped into partitions, and each partition is isolated from hardware failures in other partitions.
   - This placement strategy is suitable for **large distributed and replicated workloads**, such as HDFS, HBase, or Cassandra.

#### Diagram: Placement Group Types

```
1. Cluster Placement Group
+-----------+     +-----------+
| Instance 1|<--->| Instance 2|
+-----------+     +-----------+
(High-speed communication, low-latency)

2. Spread Placement Group
+-----------+     +-----------+
| Instance 1|     | Instance 2|
+-----------+     +-----------+
(Isolated on different racks, increased fault tolerance)

3. Partition Placement Group
+------------------+       +------------------+
| Partition 1      |       | Partition 2      |
| +-----------+    |       | +-----------+    |
| | Instance 1|    |       | | Instance 2|    |
| +-----------+    |       | +-----------+    |
+------------------+       +------------------+
(Isolated instances, partition-level isolation)
```

#### Choosing the Right Placement Group:

- **Cluster**: For low-latency and HPC.
- **Spread**: For critical applications needing high fault tolerance.
- **Partition**: For large-scale, distributed applications with a need for high availability.

---

### EC2 Instance Connect

**EC2 Instance Connect** is a service that simplifies connecting to your EC2 instance via SSH directly from the AWS Management Console. It eliminates the need to store, manage, or configure SSH key pairs manually, as AWS handles key generation and deployment securely.

#### Key Benefits of EC2 Instance Connect:

- **No Key Pair Management**: No need to upload, store, or manage SSH keys on the instance.
- **Browser-Based Access**: Connect to instances directly through the console without needing an SSH client.
- **Temporary Access**: EC2 Instance Connect provides temporary SSH access via generated keys, which enhances security.

#### How EC2 Instance Connect Works:

1. **Select an Instance**: Navigate to the EC2 console and select the instance you wish to connect to.
2. **Click “Connect”**: Choose the **EC2 Instance Connect** option for SSH access.
3. **AWS Generates and Injects Keys**: AWS securely injects a temporary key pair into the instance for your session.
4. **Access the Instance**: The session launches directly from your browser with SSH access.

#### Diagram: EC2 Instance Connect Flow

```
+------------------+       +----------------------+       +------------------+
| EC2 Console      |------>| AWS Injects Temporary |------>| Access Instance  |
| (Click Connect)  |       | SSH Key to Instance   |       | via Browser SSH  |
+------------------+       +----------------------+       +------------------+
   (Browser-based)                  (Secure)                     (SSH Session)
```

#### Requirements for EC2 Instance Connect:

- **AMI Compatibility**: Works with specific Amazon Linux 2 and Ubuntu AMIs.
- **Inbound SSH Access**: Ensure the instance’s security group allows inbound traffic on port 22.
- **Network Access**: The instance should be in a public subnet or reachable via a VPN connection.

---

### Summary

- **Source/Destination Checks**: Control traffic routing behavior. Disable for NAT and VPN instances.
- **EC2 System Logs**: Useful for diagnosing instance boot and configuration issues.
- **Placement Groups**: Optimize instance placement for performance or fault tolerance (Cluster, Spread, Partition).
- **EC2 Instance Connect**: Simplifies SSH access without manual key management, directly via the AWS console.

## Amazon Machine Images (AMIs), Choosing AMIs, Boot Modes, and Elastic Network Adapters (ENA)

### Amazon Machine Images (AMIs)

An **Amazon Machine Image (AMI)** provides the necessary information to launch an instance, including the operating system, application server, applications, and related configurations. AMIs are crucial for setting up instances with predefined configurations and software stacks.

#### Key Components of an AMI:

- **Operating System**: The OS that the instance will run.
- **Application Server**: Includes any pre-installed application servers (e.g., Apache, Tomcat).
- **Applications**: Software and configurations pre-installed.
- **Permissions**: Controls who can use the AMI.

#### Types of AMIs:

1. **Amazon-provided AMIs**: Pre-configured and maintained by AWS, including popular operating systems and application stacks.
2. **AWS Marketplace AMIs**: Third-party AMIs available for purchase or free, offering specialized configurations and software.
3. **Custom AMIs**: Created by users to include specific configurations, software, and settings tailored to their needs.

### Choosing an AMI

When selecting an AMI, consider the following factors to ensure it meets your requirements:

1. **Operating System Compatibility**:

   - Ensure the AMI supports the operating system required for your application.
   - Example: Amazon Linux 2, Ubuntu, Windows Server.

2. **Software Requirements**:

   - Choose an AMI that includes or allows easy installation of the necessary software.
   - Example: For a web server, you might choose an AMI with Apache or Nginx pre-installed.

3. **Security and Compliance**:

   - Verify that the AMI adheres to your security policies and compliance standards.
   - Regularly update and patch AMIs to avoid vulnerabilities.

4. **Performance Needs**:

   - Ensure the AMI is optimized for the expected workload and performance requirements.
   - Example: High-performance computing tasks may require AMIs optimized for compute-intensive operations.

5. **Region Availability**:
   - Confirm that the AMI is available in the region where you plan to deploy your instance.

#### Diagram: Choosing an AMI

```
+----------------+     +----------------+     +----------------+
| OS Compatibility|--> | Software Needs |--> | Security &     |
|                 |     |                |     | Compliance     |
+----------------+     +----------------+     +----------------+
                                       \                /
                                        \              /
                                         \            /
                                          \          /
                                           \        /
                                            \      /
                                             \    /
                                              \  /
                                               \/
                                    +--------------------+
                                    | Performance &      |
                                    | Region Availability|
                                    +--------------------+
```

### AMI Boot Modes

AMIs support different boot modes, which dictate how instances are launched and configured. The two primary boot modes are:

1. **BIOS Boot Mode**:

   - Used for instances that require traditional BIOS-based boot methods.
   - Common in older operating systems and legacy applications.

2. **UEFI Boot Mode**:
   - Stands for Unified Extensible Firmware Interface.
   - Supports newer operating systems and provides faster boot times and enhanced security features like Secure Boot.
   - Preferred for modern operating systems and configurations.

#### Diagram: AMI Boot Modes

```
+-------------------+                 +-------------------+
|      BIOS Boot    |                 |      UEFI Boot    |
|       Mode        |                 |       Mode        |
|                   |                 |                   |
| Traditional BIOS  |                 | Modern UEFI       |
| Compatibility     |                 | Features          |
|                   |                 | Secure Boot       |
+-------------------+                 +-------------------+
```

#### Switching Boot Modes:

- The boot mode of an AMI is set during the creation of the AMI. Ensure you select the appropriate boot mode when creating or choosing an AMI for your instance.

### Elastic Network Adapter (ENA)

**Elastic Network Adapter (ENA)** is a network interface that provides high-performance, low-latency networking capabilities for EC2 instances. ENA supports network speeds of up to 100 Gbps and is essential for applications requiring high throughput and low latency.

#### Features of ENA:

- **High Throughput**: Supports network speeds up to 100 Gbps.
- **Low Latency**: Reduces latency for network traffic, improving performance for real-time applications.
- **Enhanced Network Capabilities**: Provides features such as network virtualization, improved packet processing, and better network reliability.

#### ENA vs. Standard Network Interface:

- **ENA**: For high-performance, high-throughput applications. Suitable for instance types that support ENA.
- **Standard Network Interface**: For general use cases with lower throughput and performance needs.

#### Diagram: Elastic Network Adapter (ENA)

```
+-------------------+         +-------------------+
|   EC2 Instance    |         |   Elastic Network |
|    with ENA       |---------|    Adapter (ENA)  |
|                   |         |                   |
| High Throughput   |         | 100 Gbps Network  |
| Low Latency       |         | Low Latency       |
+-------------------+         +-------------------+
```

#### Enabling ENA:

- **Instance Types**: Ensure that the instance type you select supports ENA.
- **Operating System**: The AMI must be compatible with ENA; most recent AMIs are ENA-compatible.
- **Network Configuration**: Ensure that ENA is enabled in the instance's network settings.

---

### Summary

- **AMIs**: Provide a customizable setup for launching instances with pre-configured software and settings.
- **Choosing an AMI**: Consider OS compatibility, software requirements, security, performance, and region availability.
- **AMI Boot Modes**: BIOS and UEFI boot modes affect how instances are started and configured.
- **Elastic Network Adapter (ENA)**: Offers high-performance network capabilities for instances requiring high throughput and low latency.

## Amazon Machine Images (AMIs): Root Device Types, Creating and Copying, Storing and Restoring, Deprecating, Disabling, Deregistering, and Sharing

### Root Device Types

When you launch an EC2 instance, it uses a root device to store the operating system and application files. AMIs support two types of root devices:

1. **EBS (Elastic Block Store) Root Device**:

   - **Description**: The root volume is an EBS volume.
   - **Characteristics**:
     - **Persistent Storage**: Data persists independently of the instance's lifecycle.
     - **Snapshot Capabilities**: Easily back up and restore using snapshots.
     - **Resizing**: Can be resized or modified without stopping the instance.
   - **Example**: Amazon Linux 2 AMIs typically use EBS root volumes.

2. **Instance Store Root Device**:
   - **Description**: The root volume is located on the instance's local storage.
   - **Characteristics**:
     - **Ephemeral Storage**: Data is lost when the instance stops or terminates.
     - **High Performance**: Provides high IOPS and low latency.
     - **Non-Resilient**: Limited by instance lifecycle; not suitable for data persistence.
   - **Example**: Certain high-performance instance types use instance store volumes.

#### Diagram: Root Device Types

```
+------------------+                +------------------+
|   EBS Root Device|                | Instance Store   |
|                  |                | Root Device      |
| Persistent Data  |                | Ephemeral Data   |
| Resizable Volume  |                | High Performance |
+------------------+                +------------------+
| +--------------+ |                | +--------------+ |
| | EBS Volume   | |                | | Local Disk   | |
| +--------------+ |                | +--------------+ |
+------------------+                +------------------+
```

### Creating and Copying AMIs

**Creating an AMI** involves taking a snapshot of an EC2 instance's root volume and optionally additional volumes. This snapshot includes the operating system, application configurations, and data.

#### Steps to Create an AMI:

1. **Prepare the Instance**:

   - Ensure the instance is configured as desired.
   - Optionally, shut down the instance for a clean snapshot.

2. **Create the AMI**:

   - Open the **EC2 Console**.
   - Select the instance, then choose **Actions > Image and templates > Create Image**.
   - Provide a name and description for the AMI.
   - Choose the volumes to include in the AMI.
   - Click **Create Image**.

3. **Monitor the AMI Creation**:
   - The AMI status will initially be “Pending” and change to “Available” once ready.

#### Copying an AMI:

- You may need to copy an AMI to another region for redundancy or deployment.
- **Steps to Copy**:
  1. Go to the **EC2 Console**.
  2. Select the AMI, then choose **Actions > Copy AMI**.
  3. Specify the destination region and other options.
  4. Click **Copy AMI**.

#### Diagram: Creating and Copying AMIs

```
+------------------+       +-------------------+       +--------------------+
|   EC2 Instance   |       |   Create AMI      |       |   Copy AMI to      |
|                  |------>|   (Snapshot)      |------>|   Another Region   |
| OS + Configs +   |       |                   |       |                    |
| Data             |       |                   |       |                    |
+------------------+       +-------------------+       +--------------------+
```

### AMI Store and Restore

**Storing AMIs** involves saving the image and its associated snapshots in AWS.

**Restoring AMIs** means launching a new instance from an existing AMI.

#### Steps to Restore an AMI:

1. **Select the AMI**:

   - Open the **EC2 Console**.
   - Navigate to **AMIs** under **Images**.
   - Select the AMI you want to restore.

2. **Launch a New Instance**:
   - Choose **Actions > Launch Instance**.
   - Configure the instance settings as desired (instance type, network, storage).
   - Click **Launch** to start a new instance from the AMI.

#### Diagram: Store and Restore AMIs

```
+------------------+       +------------------+       +----------------------+
|   Create AMI     |------>| Store AMI in     |------>| Restore AMI (Launch  |
|   (Snapshot)     |       | AWS Storage      |       | New Instance)        |
+------------------+       +------------------+       +----------------------+
                                        |
                                        V
                               +----------------------+
                               |   New Instance       |
                               |   (Based on AMI)     |
                               +----------------------+
```

### AMI Deprecate, Disable, and Deregister

**Deprecating an AMI** means marking it as outdated or unsupported but not removing it.

**Disabling an AMI** prevents it from being used for new instance launches but doesn’t delete it.

**Deregistering an AMI** permanently removes the AMI from your account.

#### Steps to Deprecate, Disable, or Deregister an AMI:

1. **Deprecate/Disable**:

   - This is typically done by marking the AMI as deprecated in documentation or tagging it appropriately.

2. **Deregister**:

   - Open the **EC2 Console**.
   - Navigate to **AMIs** under **Images**.
   - Select the AMI you want to deregister.
   - Choose **Actions > Deregister**.
   - Confirm the action.

   Note: Deregistering an AMI does not delete the associated snapshots. You need to manually delete those if no longer needed.

#### Diagram: Deprecate, Disable, and Deregister

```
+------------------+       +------------------+       +-------------------+
|   AMI Deprecation|------>|   Disable AMI    |------>|   Deregister AMI  |
|   (Tag/Note)     |       |   (Stop Launch)  |       |   (Remove from    |
|                  |       |                  |       |   Account)        |
+------------------+       +------------------+       +-------------------+
                                        |
                                        V
                               +----------------------+
                               |   Delete Snapshots   |
                               +----------------------+
```

### AMI Sharing

**AMI Sharing** allows you to share your AMIs with other AWS accounts or make them public. This is useful for distributing AMIs with pre-configured setups or software.

#### Steps to Share an AMI:

1. **Open the EC2 Console**:

   - Navigate to **AMIs** under **Images**.

2. **Modify Permissions**:

   - Select the AMI you want to share.
   - Choose **Actions > Modify Image Permissions**.
   - Choose to either share the AMI with specific AWS account IDs or make it public.

3. **Confirm and Save**:
   - Click **Save** to apply the changes.

#### Diagram: AMI Sharing

```
+------------------+       +-------------------+       +--------------------+
|   Create AMI     |       |   Share AMI       |       |   AMI Accessible   |
|                  |------>|   (Modify         |------>|   by Other AWS     |
|                  |       |   Permissions)    |       |   Accounts/Public  |
+------------------+       +-------------------+       +--------------------+
```

### Summary

- **Root Device Types**: EBS (persistent, resizable) and Instance Store (ephemeral, high-performance).
- **Creating and Copying AMIs**: Capture instance configurations, create snapshots, and copy to other regions if needed.
- **Storing and Restoring AMIs**: Store images in AWS, and restore by launching new instances from the AMI.
- **Deprecating, Disabling, and Deregistering AMIs**: Manage AMI lifecycle, from marking as deprecated to full deregistration.
- **AMI Sharing**: Share AMIs with specific accounts or make them public for wider use.

## AMI Virtualization Types

When you create or use an Amazon Machine Image (AMI), it may support different virtualization types. Virtualization types determine how the virtual machines (instances) interact with the underlying hardware and software layers. AWS supports two primary virtualization types:

### 1. HVM (Hardware Virtual Machine)

**HVM** allows instances to leverage hardware-assisted virtualization, which provides better performance and supports more advanced features.

#### Characteristics:

- **Hardware Acceleration**: Uses hardware-assisted virtualization features from the host machine (such as Intel VT-x or AMD-V).
- **Enhanced Performance**: Offers improved performance for tasks requiring high computing power or high I/O operations.
- **Support for Advanced Features**: Enables features like GPU acceleration, enhanced networking, and NVMe SSDs.
- **Required for Certain Instance Types**: Needed for newer instance types and high-performance workloads (e.g., C5, M5, P3).

#### Use Cases:

- **High-Performance Computing (HPC)**: Workloads that require intensive computing power.
- **Machine Learning and AI**: Tasks that benefit from GPU acceleration.
- **High-Throughput Applications**: Applications needing high network and storage performance.

#### Diagram: HVM Virtualization

```
+--------------------------+
|   EC2 Instance (HVM)     |
|   +-------------------+  |
|   |   Hardware-Assisted| |
|   |   Virtualization   | |
|   +-------------------+  |
|   |   Enhanced I/O     | |
|   |   GPU Acceleration | |
|   |   NVMe SSD Support  | |
|   +-------------------+  |
+--------------------------+
```

### 2. PV (Paravirtualization)

**PV** is a virtualization technique where the guest OS is aware of the virtualization and communicates with the hypervisor to improve performance.

#### Characteristics:

- **Software Assistance**: Relies on software-based virtualization, meaning the guest OS must be modified to be aware of and cooperate with the hypervisor.
- **Lower Performance**: Generally has lower performance compared to HVM as it does not utilize hardware-assisted features.
- **Compatibility**: Useful for older instances and operating systems that do not support HVM.

#### Use Cases:

- **Legacy Systems**: Older applications and systems that do not support HVM.
- **Compatibility Needs**: Situations where specific legacy configurations are necessary.

#### Diagram: PV Virtualization

```
+--------------------------+
|   EC2 Instance (PV)      |
|   +-------------------+  |
|   |   Software-Assisted| |
|   |   Virtualization   | |
|   +-------------------+  |
|   |   Lower Performance | |
|   +-------------------+  |
+--------------------------+
```

### Choosing the Right Virtualization Type

**Choosing between HVM and PV depends on several factors**:

1. **Performance Needs**:

   - HVM is preferred for high-performance workloads due to its support for hardware acceleration.

2. **Compatibility**:

   - PV might be necessary for older operating systems or specific legacy configurations.

3. **Instance Types**:

   - Newer instance types and features generally require HVM.

4. **Features Required**:
   - For advanced features like GPU acceleration, enhanced networking, or NVMe SSDs, HVM is required.

#### Diagram: Choosing Virtualization Type

```
+--------------------------+                +---------------------------+
|   HVM (Hardware Virtualization) |        |   PV (Paravirtualization) |
|                              |        |                           |
|   +---------------------+    |        |   +---------------------+ |
|   | High Performance    |    |        |   | Compatibility        | |
|   | Advanced Features   |    |        |   | Lower Performance    | |
|   | GPU, Enhanced I/O   |    |        |   | Legacy Systems       | |
|   +---------------------+    |        |   +---------------------+ |
+--------------------------+    |        +---------------------------+
               |                        |
               |                        |
               V                        V
+---------------------------+     +---------------------------+
|   Use for New Instance Types | |   Use for Legacy or       |
|   High-Performance Workloads | |   Compatibility Needs     |
+---------------------------+     +---------------------------+
```

### Summary

- **HVM**: Utilizes hardware-assisted virtualization for enhanced performance and advanced features, ideal for high-performance and modern applications.
- **PV**: Relies on software-based virtualization, suitable for legacy systems and applications with specific compatibility needs.
