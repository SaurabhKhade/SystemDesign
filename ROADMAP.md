## #01 Networking

Understand what actually happens between a client and a backend.

#### #01.01 - HTTP

##### Concepts

- HTTP request/response model
- Methods, headers and status codes
- Cookies
- Keep-alive and connection reuse
- HTTP/1.1, HTTP/2 and HTTP/3
- TLS
- REST
- Idempotency

##### Lab

- Build a minimal HTTP server without ASP.NET.
- Support:
  - `GET /`
  - `GET /users/{id}`
  - `POST /users`
- Measure latency and concurrent connections.
- Compare keep-alive with creating a new connection.
- Document the complete path from entering an HTTPS URL to receiving the response.

#### #01.02 - TCP, DNS and Load Balancing

##### Concepts

- TCP handshake
- Retransmission
- Congestion control
- Connection termination
- DNS resolution and caching
- Reverse proxy
- L4 vs L7 load balancing
- Round-robin
- Least-connections
- Health checks

##### Lab

- Build a load balancer routing to three backend servers.
- Implement health checking.
- Remove unhealthy servers from rotation.
- Recover servers after failure.
- Introduce a slow backend and observe health detection.
- Kill one backend and verify that traffic continues.

---

## #02 Databases

Understand storage performance and transactional correctness.

#### #02.01 - SQL, Indexes and Query Plans

##### Concepts

- B-trees
- Composite indexes
- Covering indexes
- Clustered and non-clustered indexes
- Cardinality
- Selectivity
- Query planning

##### Lab

- Create users, orders and products tables.
- Generate a large dataset.
- Compare indexed and non-indexed queries.
- Compare:
  - `user_id`
  - `created_at`
  - `(user_id, created_at)`
  - `(created_at, user_id)`
- Inspect query plans.
- Explain why the optimizer chooses a particular plan.

#### #02.02 - Transactions and Isolation

##### Concepts

- ACID
- Locks
- MVCC
- Optimistic concurrency
- Pessimistic concurrency
- Isolation levels

##### Lab

- Implement concurrent bank-account transfers.
- Deliberately create a race condition.
- Experiment with:
  - Read Committed
  - Repeatable Read
  - Serializable
- Demonstrate:
  - Dirty reads
  - Non-repeatable reads
  - Phantom reads
  - Lost updates
- Document which isolation level prevents which anomaly and the associated cost.

#### #02.03 - Replication, Partitioning and Sharding

##### Concepts

- Primary/replica architecture
- Replication lag
- Vertical scaling
- Horizontal scaling
- Partitioning
- Sharding

##### Lab

- Build a toy partitioned key-value store.
- Start with `hash(userId) % N`.
- Implement a consistent-hash ring.
- Change the shard count.
- Measure how many keys move.
- Document when sharding is useful and what operational complexity it introduces.

---

## #03 Caching

Understand cache behavior and failure modes.

#### #03.01 - Cache Fundamentals

##### Concepts

- Cache-aside
- Read-through
- Write-through
- Write-behind
- TTL
- Eviction
- LRU
- LFU
- Cache invalidation
- Cache penetration
- Cache avalanche
- Cache stampede

##### Lab

- Implement an LRU cache from scratch.
- Build an API → Redis → PostgreSQL flow.
- Benchmark cache hits vs misses.
- Create a cache stampede by expiring many keys simultaneously.
- Mitigate the stampede using one or more of:
  - Jittered TTL
  - Request coalescing
  - Locking

---

## #04 Concurrency

Develop strong reasoning about concurrent execution.

#### #04.01 - Local Concurrency

##### Concepts

- Threads
- Tasks
- `async/await`
- `lock` / `Monitor`
- `SemaphoreSlim`
- `Mutex`
- `Interlocked`
- `ConcurrentDictionary`
- Race conditions
- Deadlocks
- Contention
- Memory visibility

##### Lab

- Implement a thread-safe counter.
- Implement a thread-safe cache.
- Implement a producer-consumer queue.
- Create a deliberate deadlock.
- Fix the deadlock.
- Benchmark different worker counts.
- Document the effect of contention.

#### #04.02 - Distributed Concurrency

##### Concepts

- Distributed locks
- Leases
- Fencing tokens
- Compare-and-set
- Optimistic concurrency

##### Lab

- Implement a Redis-backed distributed lock.
- Run multiple workers against the same critical section.
- Create the lock-expiry race:
  - Worker A acquires the lock.
  - A pauses until its lease expires.
  - Worker B acquires the lock.
  - A resumes and attempts to write.
- Implement fencing tokens.
- Demonstrate why a naive distributed lock is not sufficient for correctness.

---

## 05 Distributed Systems

Understand consistency, replication and coordination.

#### #05.01 - Consistency Models

##### Concepts

- CAP
- Network partitions
- CP and AP
- Eventual consistency
- Strong consistency
- Causal consistency
- Read-your-writes
- Linearizability
- Replication delay
- Conflict resolution

##### Lab

- Build a two-node replicated key-value store.
- Disconnect the nodes.
- Allow conflicting writes.
- Implement a simple conflict-resolution strategy such as:
  - Last-write-wins
  - Version numbers
- Introduce replication delay.
- Demonstrate stale reads.

#### #05.02 - Leader Election

##### Concepts

- Heartbeats
- Failure detection
- Leader election
- Quorum
- Network partitions
- Split-brain

##### Lab

- Build a three-node cluster.
- Implement heartbeats.
- Elect a leader.
- Kill the leader and elect a replacement.
- Simulate network partitions.
- Demonstrate split-brain risk in a naive election algorithm.

#### #05.03 - Consensus

##### Concepts

- Consensus
- Quorum
- Leader election
- Replicated state machines
- Log replication
- Raft

##### Lab

- First implement a simplified:
  - Leader
  - Log
  - Followers
  - Replication
- Study Raft after understanding the simpler model.
- Optionally implement a simplified Raft.
- Focus on understanding failure scenarios rather than maximizing implementation size.
- Document why consensus is difficult in the presence of failures and partitions.

---

## #06 Messaging

Understand asynchronous architecture and delivery guarantees.

#### #06.01 - Message Queues

##### Concepts

- Producer
- Consumer
- Acknowledgement
- Visibility timeout
- Retries
- Dead-letter queues
- Ordering
- Delivery semantics

##### Lab

- Build a queue with a producer and worker.
- Implement ACK.
- Implement retries.
- Implement exponential backoff.
- Implement a dead-letter queue.
- Test duplicate delivery.
- Test consumer failure.
- Reproduce the design using a production messaging system.

#### #06.02 - Kafka

##### Concepts

- Topics
- Partitions
- Offsets
- Consumer groups
- Brokers
- Replication
- Leaders
- ISR
- Rebalancing

##### Lab

- Build:
  - Order Service
  - Kafka
  - Payment Consumer
  - Notification Consumer
- Kill consumers and observe rebalancing.
- Increase partitions and observe parallelism and ordering.
- Study broker failure and replicated partitions.

---

## #07 Event-Driven Systems

Understand reliable asynchronous workflows across services.

#### #07.01 - Idempotency

##### Concepts

- Idempotent operations
- Duplicate requests
- Duplicate messages
- Idempotency keys
- Exactly-once business effects vs exactly-once delivery

##### Lab

- Implement `POST /payments` with an idempotency key.
- Send the same request concurrently.
- Guarantee one logical payment.
- Test retries and duplicate messages.

#### #07.02 - Transactional Outbox

##### Concepts

- Dual-write problem
- Transactional outbox
- Event publishing
- Eventual consistency

##### Lab

- Persist business data and an outbox event in one database transaction.
- Publish the event asynchronously.
- Handle publisher failure.
- Handle duplicate publication.
- Make consumers idempotent.

#### #07.03 Saga

##### Concepts

- Distributed transactions
- Saga
- Compensating actions
- Choreography
- Orchestration

##### Lab

- Build:
  - Order
  - Payment
  - Inventory
  - Notification
- Model `OrderCreated → Payment → Inventory → Notification`.
- Introduce downstream failures.
- Implement retries and DLQ.
- Implement compensating actions.
- Compare choreography with orchestration.

---

## #08 Reliability

Design systems that fail predictably.

#### #08.01 - Timeouts and Retries

- Implement timeouts.
- Implement retries.
- Implement exponential backoff.
- Add jitter.
- Create a slow downstream service.
- Observe retry storms and retry amplification.

#### #08.02 - Circuit Breaker

- Implement:
  - Closed
  - Open
  - Half-Open
- Create downstream failures.
- Observe how the circuit changes system behavior.
- Document when a circuit breaker helps and when it does not.

#### #08.03 - Rate Limiting

##### Concepts

- Fixed-window limiting
- Sliding-window limiting
- Token bucket
- Distributed rate limiting

##### Lab

- Implement fixed-window rate limiting.
- Implement sliding-window rate limiting.
- Implement token-bucket rate limiting.
- Build a distributed rate limiter using Redis.
- Compare their behavior under burst traffic.

#### #08.04 - Backpressure

##### Concepts

- Bounded queues
- Rejection
- Throttling
- Backpressure
- Cascading failure

##### Lab

- Create a producer running at 10,000 req/s.
- Create a consumer capable of 1,000 req/s.
- Observe queue growth.
- Implement bounded queues.
- Implement rejection/throttling.
- Document the resulting trade-offs.

---

## #09 Scalability

Compose scalable application architectures.

#### #09.01 - Stateless Services

- Build multiple stateless API instances behind a load balancer.
- Learn sticky sessions.
- Learn centralized/distributed session storage.
- Compare server-side sessions with JWT + refresh tokens.
- Document the scalability and consistency trade-offs.

#### #09.02 - Consistent Hashing

- Build a reusable `ConsistentHashRing<T>` library.
- Implement `AddNode`.
- Implement `RemoveNode`.
- Implement `GetNode`.
- Add virtual nodes.
- Benchmark key distribution.
- Measure key movement when nodes are added or removed.

#### #09.03 - Object Storage

##### Concepts

- Object storage
- Multipart uploads
- Presigned URLs
- Metadata storage

##### Lab

- Build a file-upload service.
- Store metadata in a database.
- Store file content in object storage.
- Implement multipart uploads.
- Implement presigned URLs.
- Document the consistency and scaling boundaries.

#### #09.04 - Search

##### Concepts

- Inverted indexes
- Search shards
- Search replicas
- Eventual consistency

##### Lab

- Build a small product-search service using Elasticsearch/OpenSearch.
- Index product data.
- Implement search queries.
- Introduce index lag.
- Observe stale search results.
- Document indexing and query scaling.

---

## 10 Observability

Make distributed behavior measurable and diagnosable.

#### #10.01 - Logging

- Implement structured logs.
- Include:
  - `traceId`
  - Service
  - Operation
  - Latency
  - Status
- Correlate logs across services.

#### #10.02 - Metrics

- Track throughput.
- Track latency.
- Track error rate.
- Track saturation.
- Understand p50, p95, p99 and p99.9.
- Avoid relying on averages alone.

#### #10.03 - Distributed Tracing

- Instrument a multi-service request using OpenTelemetry.
- Visualize traces with Jaeger or another compatible backend.
- Correlate a slow request across:
  - API
  - Order
  - Payment
  - Inventory
  - Notification

---

# Projects

The projects combine multiple concepts from the labs. They should not be treated as tutorial applications; each should demonstrate deliberate engineering decisions, failure handling and measurable behavior.

### 01 Distributed Job Processing Platform

#### Core capabilities

- Job creation and scheduling APIs.
- Queue-based job dispatch.
- Multiple workers.
- Retries and exponential backoff.
- Dead-letter queue.
- Idempotent job execution.
- Distributed locking where required.
- Worker heartbeat and failure detection.
- Job timeout.
- Job priority.
- Rate limiting.
- Metrics.
- Structured logging.
- Distributed tracing.
- Horizontal worker scaling.

### Failure experiments

- Kill workers.
- Kill Redis.
- Kill Kafka.
- Kill the database.
- Observe duplicate execution scenarios.
- Observe delayed or lost work.
- Document recovery behavior.

### Documentation

- Architecture diagram.
- Data flow.
- Failure modes.
- Consistency guarantees.
- Scaling strategy.
- Technology trade-offs.
- Performance observations.

### 02 — Collaborative Workspace

#### Core capabilities

- Users.
- Workspaces.
- Documents.
- Permissions.
- Document version history.
- Comments.
- Notifications.
- Search indexing.
- Optimistic concurrency/version checks.
- Event-driven processing.
- Redis caching where justified.
- Authorization boundaries.
- Audit logging.
- Observability.

#### Design exercises

- Document consistency requirements for each feature.
- Identify hot paths.
- Identify scaling bottlenecks.
- Introduce failure scenarios.
- Test recovery behavior.
- Document major technology choices and their trade-offs.

---
## Design Progression

### Level 1 — Core Components

- [ ] URL Shortener
- [ ] Rate Limiter
- [ ] Pastebin
- [ ] Distributed Cache
- [ ] File Storage

### Level 2 — Multi-Component Systems

- [ ] Notification System
- [ ] Chat System
- [ ] Job Scheduler
- [ ] Web Crawler
- [ ] News Feed

### Level 3 — Large Product Systems

- [ ] Ride-sharing platform
- [ ] Video streaming platform
- [ ] Video-on-demand platform
- [ ] Cloud file storage
- [ ] Collaborative document platform

### Level 4 — Distributed Infrastructure

- [ ] Distributed Search
- [ ] Kafka-like Messaging System
- [ ] Distributed Database
- [ ] Global Payment System
- [ ] Multi-region SaaS Platform
