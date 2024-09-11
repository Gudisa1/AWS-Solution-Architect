### Introduction to Load Balancers

**Load Balancers** are a critical component of modern application architectures, providing a means to distribute incoming network traffic across multiple servers or resources. They ensure that your application can handle varying levels of traffic and maintain high availability, reliability, and performance.

#### Overview

A **Load Balancer** acts as an intermediary between users and your application servers. It manages and distributes incoming traffic to multiple servers based on predefined rules, health checks, and load balancing algorithms. By efficiently distributing traffic, load balancers help prevent any single server from becoming a bottleneck, thereby enhancing application performance and reliability.

#### Key Functions of Load Balancers

1. **Traffic Distribution**:

   - **Balancing Load**: Distributes incoming traffic across multiple servers or resources to prevent any single server from being overwhelmed.
   - **Even Distribution**: Ensures that each server handles a roughly equal share of the traffic.

2. **High Availability**:

   - **Redundancy**: Provides redundancy by routing traffic to healthy servers, even if some servers fail.
   - **Failover**: Automatically redirects traffic from failed or unhealthy servers to healthy ones, ensuring continuous availability.

3. **Scalability**:

   - **Dynamic Scaling**: Supports scaling applications horizontally by adding or removing servers based on traffic demands.
   - **Automatic Adjustment**: Adjusts the distribution of traffic as the number of servers changes.

4. **Health Monitoring**:

   - **Health Checks**: Continuously monitors the health of servers and ensures traffic is only routed to healthy servers.
   - **Automatic Detection**: Detects server failures and reroutes traffic accordingly to maintain application availability.

5. **Performance Optimization**:

   - **Session Persistence**: Maintains user session state by routing requests from a specific user to the same server.
   - **SSL Termination**: Offloads SSL encryption and decryption from application servers to improve performance.

6. **Security**:
   - **Traffic Filtering**: Provides protection against DDoS attacks and malicious traffic by filtering and managing incoming requests.
   - **Access Control**: Enforces security policies and controls access based on IP addresses or request parameters.

#### Types of Load Balancers

1. **Classic Load Balancer (CLB)**:

   - **Legacy Option**: The original AWS load balancer offering, suitable for basic use cases.
   - **Layer 4 and Layer 7**: Operates at both the transport layer (Layer 4) and the application layer (Layer 7) of the OSI model.

2. **Application Load Balancer (ALB)**:

   - **Advanced Features**: Supports advanced routing features such as path-based routing and host-based routing.
   - **Layer 7**: Operates at the application layer (Layer 7) of the OSI model, making it suitable for HTTP and HTTPS traffic.

3. **Network Load Balancer (NLB)**:

   - **High Performance**: Designed for handling high-throughput and low-latency applications.
   - **Layer 4**: Operates at the transport layer (Layer 4) of the OSI model, suitable for TCP and UDP traffic.

4. **Gateway Load Balancer (GLB)**:
   - **Traffic Management**: Simplifies the deployment, scaling, and management of third-party virtual appliances.
   - **Layer 3**: Operates at the network layer (Layer 3) of the OSI model, integrating with third-party network appliances.

#### Use Cases

- **Web Applications**: Distributing web traffic across multiple web servers to handle high traffic volumes and provide redundancy.
- **Microservices Architectures**: Routing requests to various microservices based on URL paths or domains.
- **API Services**: Load balancing API requests to ensure consistent performance and availability.
- **High-Traffic Websites**: Handling high traffic loads for e-commerce sites, media streaming, and other high-traffic applications.

#### Diagram: Load Balancer Architecture

```
+-----------------+
|    Clients      |
+-----------------+
         |
         v
+-------------------------+
|      Load Balancer      |
| (Classic, Application,  |
|  Network, Gateway)      |
+-------------------------+
         |
         v
+-----------------+    +-----------------+
|   Web Server 1  |    |   Web Server 2  |
+-----------------+    +-----------------+
         |
         v
+-----------------+    +-----------------+
|   Web Server 3  |    |   Web Server 4  |
+-----------------+    +-----------------+
```

### Types of Load Balancers

AWS offers several types of load balancers to address different use cases and traffic patterns. Each type is optimized for specific requirements and provides unique features. Understanding the different types of load balancers can help you choose the right one for your application’s needs.

#### 1. Classic Load Balancer (CLB)

**Classic Load Balancer** is the original load balancing option provided by AWS. It supports both Layer 4 (TCP) and Layer 7 (HTTP/HTTPS) load balancing. Although it is still available, it is considered a legacy option, and AWS recommends using the newer Application Load Balancer or Network Load Balancer for most use cases.

- **Features**:

  - **Layer 4 Load Balancing**: Distributes traffic based on IP address and TCP port.
  - **Layer 7 Load Balancing**: Supports routing based on HTTP headers, methods, and paths.
  - **Sticky Sessions**: Provides session persistence by using cookies.
  - **SSL Termination**: Offloads SSL encryption from your application servers.
  - **Health Checks**: Monitors the health of EC2 instances and routes traffic only to healthy instances.

- **Use Cases**:
  - Basic web applications and simple use cases where advanced features of newer load balancers are not required.

#### 2. Application Load Balancer (ALB)

**Application Load Balancer** is designed to handle advanced HTTP and HTTPS traffic. It operates at Layer 7 of the OSI model and is ideal for modern web applications that require complex routing, high flexibility, and advanced features.

- **Features**:

  - **Layer 7 Load Balancing**: Routes traffic based on URL paths, HTTP headers, and hostnames.
  - **Path-Based Routing**: Directs requests to different targets based on URL paths.
  - **Host-Based Routing**: Routes requests based on domain names (host headers).
  - **WebSocket Support**: Supports WebSocket connections for real-time applications.
  - **HTTP/2 Support**: Provides improved performance with HTTP/2.
  - **Lambda Functions Integration**: Allows routing to AWS Lambda functions.
  - **Advanced Health Checks**: Performs health checks based on custom HTTP paths.

- **Use Cases**:
  - Web applications with microservices architectures.
  - Applications requiring URL-based routing and advanced request handling.
  - Applications needing integration with Lambda functions or real-time communication.

#### 3. Network Load Balancer (NLB)

**Network Load Balancer** is designed for high-performance, low-latency applications. It operates at Layer 4 of the OSI model and is optimized for TCP and UDP traffic. It is ideal for applications requiring high throughput and low network latency.

- **Features**:

  - **Layer 4 Load Balancing**: Distributes TCP and UDP traffic based on IP address and port.
  - **High Performance**: Handles millions of requests per second with ultra-low latency.
  - **Static IP Addresses**: Provides a single static IP address for the load balancer.
  - **Preserve Source IP**: Preserves the original source IP address of clients.
  - **Health Checks**: Performs health checks at the network level.

- **Use Cases**:
  - Applications requiring high throughput and low latency.
  - TCP and UDP traffic distribution for applications such as gaming, streaming, or financial trading.
  - Scenarios where preserving the client’s source IP address is important.

#### 4. Gateway Load Balancer (GLB)

**Gateway Load Balancer** simplifies the deployment, scaling, and management of third-party virtual appliances such as firewalls, intrusion detection systems, and deep packet inspection systems. It operates at Layer 3 of the OSI model.

- **Features**:

  - **Layer 3 Load Balancing**: Operates at the network layer for traffic distribution.
  - **Virtual Appliance Integration**: Integrates with third-party virtual appliances using the Gateway Load Balancer Endpoint.
  - **Automated Scaling**: Automatically scales the virtual appliances based on traffic.
  - **Health Checks**: Monitors the health of virtual appliances and ensures traffic is only routed to healthy ones.

- **Use Cases**:
  - Deploying and managing third-party virtual appliances in a scalable manner.
  - Providing network security and traffic inspection services.
  - Simplifying the integration and scaling of network appliances.

#### Diagram: Load Balancer Types

```
+---------------------------+
|    Classic Load Balancer  |
|  (Layer 4 and Layer 7)    |
| - Basic routing           |
| - Sticky sessions         |
| - SSL termination         |
+---------------------------+

         |
         v

+---------------------------+
|   Application Load Balancer|
|           (ALB)           |
| - Advanced routing        |
| - Path-based and host-based|
|   routing                  |
| - HTTP/2 and WebSocket     |
|   support                  |
| - Lambda integration       |
+---------------------------+

         |
         v

+---------------------------+
|   Network Load Balancer   |
|           (NLB)           |
| - High performance        |
| - Layer 4 (TCP/UDP)       |
| - Static IP addresses     |
| - Preserved source IP     |
+---------------------------+

         |
         v

+---------------------------+
|   Gateway Load Balancer   |
|           (GLB)           |
| - Layer 3 (Network Layer) |
| - Third-party appliance   |
|   integration             |
| - Automated scaling       |
| - Health checks           |
+---------------------------+
```

### Summary

AWS provides a variety of load balancers, each tailored to different application needs and traffic patterns:

- **Classic Load Balancer (CLB)**: Basic load balancing for both Layer 4 and Layer 7 use cases.
- **Application Load Balancer (ALB)**: Advanced HTTP/HTTPS traffic management with features like path-based routing and Lambda integration.
- **Network Load Balancer (NLB)**: High-performance, low-latency load balancing for TCP/UDP traffic.
- **Gateway Load Balancer (GLB)**: Simplifies the management and scaling of third-party virtual appliances.

Choosing the right load balancer depends on your specific application requirements and the type of traffic you need to handle.

### Detailed Overview of Elastic Load Balancer (ELB)

Elastic Load Balancer (ELB) distributes incoming traffic across multiple targets, such as EC2 instances, in one or more Availability Zones. It helps ensure high availability and fault tolerance of your application by balancing traffic based on various criteria and health checks.

#### Key Components of ELB

1. **Listeners**

   **Listeners** are processes that check for connection requests. Each load balancer supports multiple listeners, and each listener is configured to listen on a specific port and protocol.

   - **Protocol**: Determines how the load balancer communicates with the clients. Common protocols include HTTP, HTTPS, TCP, and TLS.
   - **Port**: Specifies the port on which the load balancer listens for incoming requests (e.g., port 80 for HTTP, port 443 for HTTPS).

   **Example**: A listener configuration for an Application Load Balancer might listen for HTTP traffic on port 80 and HTTPS traffic on port 443.

2. **Target Groups**

   **Target Groups** are used to route requests to one or more registered targets. Targets can be EC2 instances, IP addresses, or Lambda functions.

   - **Health Checks**: Each target group has a set of health check parameters to determine the health status of the registered targets. Health checks are performed at regular intervals.
   - **Routing**: Requests are routed to the targets in a target group based on the listener rules and load balancing algorithm.

   **Example**: An ALB can route traffic to different target groups based on URL paths, such as routing `/images` requests to one target group and `/api` requests to another.

3. **Rules and Routing**

   **Rules** determine how requests are routed to the target groups. Different load balancer types support various rule configurations:

   - **Path-Based Routing**: Routes requests based on the URL path.
   - **Host-Based Routing**: Routes requests based on the hostname in the request.
   - **Query String and Header-Based Routing**: Routes requests based on query string parameters or HTTP headers.

   **Example**: An ALB rule might route requests with the URL path `/api` to one target group and requests with `/images` to another.

4. **Health Checks**

   **Health Checks** are used to determine the health of the registered targets. A target is considered healthy if it passes the health checks; otherwise, traffic is routed away from it.

   - **Protocol**: The protocol used for health checks (HTTP, HTTPS, TCP).
   - **Path**: The path to be requested (for HTTP/HTTPS health checks).
   - **Interval**: The frequency at which health checks are performed.
   - **Timeout**: The time to wait for a health check response.
   - **Unhealthy Threshold**: The number of consecutive failed health checks before a target is considered unhealthy.
   - **Healthy Threshold**: The number of consecutive successful health checks before a target is considered healthy.

   **Example**: An ALB health check might request `/health` every 30 seconds and wait 5 seconds for a response.

5. **Security Groups**

   **Security Groups** act as virtual firewalls for your load balancer, controlling inbound and outbound traffic. Security groups are associated with the load balancer and control the types of traffic that can reach it.

   - **Inbound Rules**: Define which incoming traffic is allowed (e.g., HTTP on port 80, HTTPS on port 443).
   - **Outbound Rules**: Define which outbound traffic is allowed.

   **Example**: For an ALB, you might configure inbound rules to allow HTTP and HTTPS traffic and outbound rules to allow responses to clients.

6. **SSL/TLS Termination**

   **SSL/TLS Termination** offloads the encryption and decryption of SSL/TLS traffic from the backend instances to the load balancer.

   - **SSL Certificates**: Manage and associate SSL certificates with the load balancer to enable HTTPS traffic.
   - **Secure Listener**: Listens for HTTPS traffic and handles SSL/TLS decryption.

   **Example**: An ALB with an HTTPS listener decrypts incoming traffic and forwards unencrypted traffic to the target instances.

7. **Sticky Sessions**

   **Sticky Sessions** (or session affinity) ensure that requests from the same client are always routed to the same target.

   - **Cookies**: Load balancers use cookies to maintain session stickiness.
   - **Duration**: Define the duration for which the cookie remains valid.

   **Example**: For a web application that requires session persistence, you can enable sticky sessions to ensure that a user is always routed to the same instance.

8. **Cross-Zone Load Balancing**

   **Cross-Zone Load Balancing** distributes incoming traffic evenly across all instances in all registered Availability Zones.

   - **Enabled/Disabled**: Cross-zone load balancing can be enabled or disabled based on your needs.
   - **Impact**: Enabling cross-zone load balancing helps ensure even traffic distribution and improved fault tolerance.

   **Example**: When enabled, an ALB balances traffic across all instances in multiple Availability Zones, even if some zones have fewer instances.

#### Diagram: ELB Components

```
+---------------------------+
|       Elastic Load        |
|        Balancer (ELB)     |
|                           |
|  +---------------------+  |
|  |     Listeners       |  |
|  | - Protocol: HTTP    |  |
|  | - Port: 80, 443     |  |
|  +---------------------+  |
|                           |
|  +---------------------+  |
|  |   Target Groups     |  |
|  | - Health Checks     |  |
|  | - Targets: EC2,     |  |
|  |   IP, Lambda        |  |
|  +---------------------+  |
|                           |
|  +---------------------+  |
|  |   Rules & Routing   |  |
|  | - Path-Based        |  |
|  | - Host-Based        |  |
|  +---------------------+  |
|                           |
|  +---------------------+  |
|  |  Security Groups    |  |
|  | - Inbound/Outbound  |  |
|  |   Rules             |  |
|  +---------------------+  |
|                           |
|  +---------------------+  |
|  | SSL/TLS Termination |  |
|  | - SSL Certificates  |  |
|  | - Secure Listeners  |  |
|  +---------------------+  |
|                           |
|  +---------------------+  |
|  |  Sticky Sessions    |  |
|  | - Cookies           |  |
|  | - Duration          |  |
|  +---------------------+  |
|                           |
|  +---------------------+  |
|  | Cross-Zone Load     |  |
|  | Balancing           |  |
|  | - Enabled/Disabled  |  |
|  +---------------------+  |
+---------------------------+
```

### Summary

Elastic Load Balancers (ELBs) are vital for distributing incoming application traffic across multiple targets. Key components include:

- **Listeners**: Define how the load balancer listens for incoming traffic.
- **Target Groups**: Route traffic to registered targets and perform health checks.
- **Rules and Routing**: Determine how requests are routed based on criteria like URL paths and hostnames.
- **Health Checks**: Monitor the health of targets and ensure traffic is only routed to healthy instances.
- **Security Groups**: Control inbound and outbound traffic to the load balancer.
- **SSL/TLS Termination**: Offloads encryption and decryption tasks from backend instances.
- **Sticky Sessions**: Maintain session persistence using cookies.
- **Cross-Zone Load Balancing**: Distributes traffic evenly across all registered Availability Zones.

Choosing the right load balancer and configuring these components effectively can help ensure your application remains available, responsive, and secure.

### Application Load Balancer (ALB) Detailed Overview

The **Application Load Balancer (ALB)** is a type of Elastic Load Balancer designed for HTTP and HTTPS traffic. It operates at the application layer (Layer 7) of the OSI model and provides advanced routing capabilities, making it ideal for modern, microservices-based architectures.

#### Key Features of ALB

1. **Advanced Request Routing**

   ALB supports advanced routing rules that direct incoming traffic to different target groups based on the content of the request.

   - **Path-Based Routing**: Routes requests to different target groups based on URL paths. For example, requests to `/api` can be directed to one target group, while requests to `/images` go to another.

     **Example**:

     - URL Path `/api/*` → Target Group A
     - URL Path `/images/*` → Target Group B

   - **Host-Based Routing**: Routes requests based on the hostname in the request URL. This allows multiple domain names to be served by the same ALB.

     **Example**:

     - Hostname `api.example.com` → Target Group C
     - Hostname `images.example.com` → Target Group D

   - **Query String and Header-Based Routing**: Routes requests based on query string parameters or HTTP headers. This can be useful for directing traffic to different services based on specific request attributes.

     **Example**:

     - Query String `?version=1` → Target Group E
     - Header `X-Region: us-east` → Target Group F

2. **SSL/TLS Termination**

   ALB can handle SSL/TLS termination, offloading the decryption of HTTPS traffic from your backend instances. This simplifies certificate management and reduces the computational load on backend servers.

   - **SSL Certificates**: Manage and associate SSL/TLS certificates with your ALB using AWS Certificate Manager (ACM) or import your own certificates.

   - **Secure Listeners**: Configure listeners to handle HTTPS traffic and perform SSL/TLS decryption.

   **Example**:

   - HTTPS Listener on port 443 → Decrypts SSL/TLS traffic and forwards requests as HTTP to backend instances.

3. **Health Checks**

   ALB performs health checks on the registered targets in a target group to ensure they are healthy and able to handle traffic.

   - **Protocol and Path**: Define the protocol (HTTP, HTTPS) and path used for health checks.

   - **Health Check Parameters**: Configure interval, timeout, healthy threshold, and unhealthy threshold to determine target health status.

   **Example**:

   - Health Check Protocol: HTTP
   - Health Check Path: `/health`
   - Interval: 30 seconds
   - Timeout: 5 seconds
   - Healthy Threshold: 3
   - Unhealthy Threshold: 2

4. **Target Groups**

   Targets can be EC2 instances, IP addresses, or Lambda functions. Each target group has its own set of health checks and routing rules.

   - **Registration**: Register targets with a target group and configure health checks specific to the needs of those targets.

   - **Deregistration**: Remove targets from a group when they are no longer needed or are unhealthy.

   **Example**:

   - Target Group A: EC2 Instances (app-server-1, app-server-2)
   - Target Group B: Lambda Function (image-processing-function)

5. **Sticky Sessions**

   ALB supports sticky sessions (session affinity) to ensure that requests from the same client are consistently routed to the same target.

   - **Cookies**: ALB uses cookies to maintain session stickiness. You can configure the duration for which the cookie remains valid.

   **Example**:

   - Sticky Session Duration: 1 hour

6. **Cross-Zone Load Balancing**

   ALB provides cross-zone load balancing to distribute incoming traffic evenly across all instances in all registered Availability Zones.

   - **Enabled/Disabled**: This feature can be enabled or disabled based on your needs.

   **Example**:

   - Traffic is distributed evenly across instances in multiple Availability Zones.

7. **WebSocket Support**

   ALB supports WebSocket connections, allowing real-time, full-duplex communication between clients and servers.

   - **Connection Management**: Handles WebSocket upgrade requests and maintains the connection as long as needed.

   **Example**:

   - WebSocket Connection: `ws://chat.example.com`

8. **Logging and Monitoring**

   ALB integrates with AWS CloudWatch for logging and monitoring. It provides access logs that capture detailed information about requests and responses.

   - **Access Logs**: Log details of incoming requests, including source IP, request path, and response time.

   **Example**:

   - Log Destination: S3 bucket
   - Log Format: JSON

#### Diagram: ALB Request Routing

```
+-------------------------------+
|      Application Load         |
|        Balancer (ALB)         |
|                               |
|  +-------------------------+  |
|  |    Listeners            |  |
|  |  - HTTP (port 80)       |  |
|  |  - HTTPS (port 443)     |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  |   Request Routing       |  |
|  |  - Path-Based           |  |
|  |  - Host-Based           |  |
|  |  - Query String         |  |
|  |    and Header-Based     |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  |   Target Groups         |  |
|  |  - EC2 Instances        |  |
|  |  - IP Addresses         |  |
|  |  - Lambda Functions     |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  |    Health Checks        |  |
|  |  - Protocol & Path      |  |
|  |  - Parameters           |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  |  Sticky Sessions        |  |
|  |  - Cookies              |  |
|  |  - Duration             |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  | Cross-Zone Load         |  |
|  |    Balancing            |  |
|  |  - Enabled/Disabled     |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  |  WebSocket Support      |  |
|  |  - Connection Management |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  |  Logging and Monitoring |  |
|  |  - Access Logs          |  |
|  |  - CloudWatch Integration |  |
|  +-------------------------+  |
+-------------------------------+
```

### Summary

The Application Load Balancer (ALB) provides advanced routing capabilities and supports modern application architectures. Key features include:

- **Advanced Request Routing**: Path-based, host-based, query string, and header-based routing.
- **SSL/TLS Termination**: Offloads encryption/decryption tasks.
- **Health Checks**: Monitors target health with configurable parameters.
- **Target Groups**: Manages EC2 instances, IP addresses, and Lambda functions.
- **Sticky Sessions**: Maintains session persistence using cookies.
- **Cross-Zone Load Balancing**: Distributes traffic across multiple Availability Zones.
- **WebSocket Support**: Enables real-time communication.
- **Logging and Monitoring**: Provides detailed access logs and integrates with CloudWatch.

By leveraging ALB's features, you can ensure efficient and reliable routing of application traffic, improve fault tolerance, and optimize performance.

### Network Load Balancer (NLB) and Classic Load Balancer (CLB) Detailed Overview

Both **Network Load Balancer (NLB)** and **Classic Load Balancer (CLB)** are types of Elastic Load Balancers offered by AWS. They serve different use cases and have distinct features suitable for various scenarios.

---

## Network Load Balancer (NLB)

### Introduction

The **Network Load Balancer (NLB)** operates at Layer 4 (Transport Layer) of the OSI model and is designed to handle high-throughput, low-latency traffic. It is optimized for TCP, UDP, and TLS traffic and provides ultra-low latency while maintaining high performance.

### Key Features

1. **High Performance and Low Latency**

   - **Connection Handling**: NLB is designed to handle millions of requests per second with minimal latency.
   - **Static IP Addresses**: Supports static IP addresses for the load balancer, providing stable IPs for applications.

2. **Protocol Support**

   - **TCP/UDP**: Supports TCP and UDP traffic, making it suitable for applications requiring fast and reliable communication.
   - **TLS Termination**: Offloads TLS decryption and encryption from backend instances.

3. **Target Types**

   - **EC2 Instances**: Routes traffic to EC2 instances across multiple Availability Zones.
   - **IP Addresses**: Can route traffic to targets specified by IP addresses, including targets outside of AWS.

4. **Health Checks**

   - **Protocol and Port**: Allows health checks over TCP, HTTP, or HTTPS protocols.
   - **Customizable**: Configure health check parameters such as interval, timeout, and thresholds.

5. **Cross-Zone Load Balancing**

   - **Enabled by Default**: Distributes incoming traffic evenly across all registered targets in all Availability Zones.

6. **Zonal Isolation**

   - **Fault Isolation**: NLB is designed to handle failures in individual Availability Zones without impacting overall availability.

7. **Logging and Monitoring**

   - **Access Logs**: Provides detailed access logs that capture information about incoming traffic.
   - **CloudWatch Integration**: Monitors performance metrics and generates alarms based on predefined thresholds.

### Diagram: Network Load Balancer Architecture

```
+-------------------------------+
|       Network Load Balancer    |
|                               |
|  +-------------------------+  |
|  |       Listeners         |  |
|  |  - TCP (port 80)        |  |
|  |  - UDP (port 53)        |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  |      Target Groups      |  |
|  |  - EC2 Instances        |  |
|  |  - IP Addresses         |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  |      Health Checks      |  |
|  |  - Protocol & Port      |  |
|  |  - Customizable         |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  | Cross-Zone Load Balancing|  |
|  |  - Enabled by Default   |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  | Logging and Monitoring  |  |
|  |  - Access Logs          |  |
|  |  - CloudWatch Integration |  |
|  +-------------------------+  |
+-------------------------------+
```

### Summary

The Network Load Balancer (NLB) is suited for high-performance applications requiring low latency and high throughput. Key features include support for TCP/UDP traffic, static IP addresses, health checks, and cross-zone load balancing.

---

## Classic Load Balancer (CLB)

### Introduction

The **Classic Load Balancer (CLB)** is the original Elastic Load Balancer service and operates at both Layer 4 (Transport Layer) and Layer 7 (Application Layer) of the OSI model. It is designed for older AWS applications and provides basic load balancing functionality.

### Key Features

1. **Basic Load Balancing**

   - **Layer 4 and Layer 7 Support**: CLB supports both TCP and HTTP/HTTPS traffic, offering basic load balancing features.
   - **Single Point of Contact**: Provides a single DNS name for applications.

2. **Health Checks**

   - **Protocol Support**: Supports health checks over TCP, HTTP, and HTTPS protocols.
   - **Basic Parameters**: Configure basic health check parameters such as interval, timeout, and thresholds.

3. **Sticky Sessions**

   - **Session Persistence**: Supports sticky sessions (session affinity) by using cookies to direct client requests to the same instance.

4. **Zonal Failures**

   - **Cross-Zone Load Balancing**: Distributes traffic across all instances in registered Availability Zones.

5. **Limited Protocol Support**

   - **TCP and HTTP/HTTPS**: Basic support for TCP and HTTP/HTTPS, with limited advanced routing capabilities.

6. **Logging and Monitoring**

   - **Basic Access Logs**: Provides basic access logs with information about incoming requests.
   - **CloudWatch Integration**: Limited CloudWatch monitoring capabilities compared to ALB and NLB.

### Diagram: Classic Load Balancer Architecture

```
+-------------------------------+
|        Classic Load Balancer   |
|                               |
|  +-------------------------+  |
|  |       Listeners         |  |
|  |  - TCP (port 80)        |  |
|  |  - HTTP (port 80)       |  |
|  |  - HTTPS (port 443)     |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  |      Target Groups      |  |
|  |  - EC2 Instances        |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  |      Health Checks      |  |
|  |  - Protocol & Port      |  |
|  |  - Basic Parameters     |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  | Sticky Sessions         |  |
|  |  - Cookies              |  |
|  +-------------------------+  |
|                               |
|  +-------------------------+  |
|  | Logging and Monitoring  |  |
|  |  - Basic Access Logs    |  |
|  |  - Limited CloudWatch   |  |
|  +-------------------------+  |
+-------------------------------+
```

### Summary

The Classic Load Balancer (CLB) offers basic load balancing features and is suitable for legacy applications. Key features include support for TCP and HTTP/HTTPS traffic, basic health checks, sticky sessions, and cross-zone load balancing.

---

By understanding the capabilities and features of NLB and CLB, you can select the most appropriate load balancer type for your application's needs. NLB is ideal for high-performance and low-latency requirements, while CLB is suitable for simpler and legacy load balancing needs.
