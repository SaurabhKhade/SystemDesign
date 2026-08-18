### System Design + Distributed Systems Roadmap

##### <a href="./ROADMAP.md">Roadmap <i class="fas fa-external-link-alt"></i></a>


A practical, implementation-driven roadmap for learning system design and distributed systems.

This repository follows a simple principle:

> **Learn the mechanism → implement a simplified version → deliberately break it → observe and measure the failure → document trade-offs → apply it in a larger system.**

#### Design Process

For every design:

- Clarify requirements.
- Identify functional and non-functional requirements.
- Estimate capacity:
   - QPS
   - Peak QPS
   - Storage
   - Bandwidth
   - Cache size
- Define APIs.
- Model the data.
- Select storage.
- Draw the high-level architecture.
- Identify the main bottleneck.
- Deep-dive into the bottleneck.
- Analyze failure modes.
- Define consistency requirements.
- Define scaling strategy.
- State trade-offs.
- Explain what changes when the system grows.

Each topic should answer three questions:
- **How does it work?**
- **What happens when it fails or is pushed beyond its normal operating conditions?**
- **Why would I choose this design over another one?**

---

### Repository Structure

Each topic is a self-contained learning area.

```text
system-design/
│
├── 01-networking/
│   ├── 01-http/
│   │   ├── notes/
│   │   └── lab/
│   ├── 02-tcp-dns/
│   │   ├── notes/
│   │   └── lab/
│   └── 03-load-balancing/
│       ├── notes/
│       └── lab/
│
├── 02-databases/
│   ├── 01-sql-indexes/
│   │   ├── notes/
│   │   └── lab/
│   ├── 02-transactions/
│   │   ├── notes/
│   │   └── lab/
│   └── 03-replication-sharding/
│       ├── notes/
│       └── lab/
│
├── 03-caching/
│   └── 01-cache-fundamentals/
│       ├── notes/
│       └── lab/
│
├── 04-concurrency/
│   ├── 01-local-concurrency/
│   │   ├── notes/
│   │   └── lab/
│   └── 02-distributed-concurrency/
│       ├── notes/
│       └── lab/
│
├── 05-distributed-systems/
│   ├── 01-consistency/
│   │   ├── notes/
│   │   └── lab/
│   ├── 02-leader-election/
│   │   ├── notes/
│   │   └── lab/
│   └── 03-consensus/
│       ├── notes/
│       └── lab/
│
├── 06-messaging/
│   ├── 01-message-queues/
│   │   ├── notes/
│   │   └── lab/
│   └── 02-kafka/
│       ├── notes/
│       └── lab/
│
├── 07-event-driven/
│   ├── 01-idempotency/
│   │   ├── notes/
│   │   └── lab/
│   ├── 02-outbox/
│   │   ├── notes/
│   │   └── lab/
│   └── 03-saga/
│       ├── notes/
│       └── lab/
│
├── 08-reliability/
│   ├── 01-timeouts-retries/
│   │   ├── notes/
│   │   └── lab/
│   ├── 02-circuit-breaker/
│   │   ├── notes/
│   │   └── lab/
│   ├── 03-rate-limiting/
│   │   ├── notes/
│   │   └── lab/
│   └── 04-backpressure/
│       ├── notes/
│       └── lab/
│
├── 09-scalability/
│   ├── 01-stateless-services/
│   │   ├── notes/
│   │   └── lab/
│   ├── 02-consistent-hashing/
│   │   ├── notes/
│   │   └── lab/
│   ├── 03-object-storage/
│   │   ├── notes/
│   │   └── lab/
│   └── 04-search/
│       ├── notes/
│       └── lab/
│
├── 10-observability/
│   ├── 01-logging/
│   │   ├── notes/
│   │   └── lab/
│   ├── 02-metrics/
│   │   ├── notes/
│   │   └── lab/
│   └── 03-distributed-tracing/
│       ├── notes/
│       └── lab/
│
└── projects/
    ├── 01-url-shortner/
    └── 02-distributed-job-processing/
    └── 03-collaborative-workspace/
```

### Directory conventions

- `notes/` — concepts, mechanisms, diagrams, failure analysis, trade-offs and observations.
- `lab/` — executable implementations and experiments.
- `projects/` — larger systems that combine multiple concepts.

---

### Branch Naming Convention

Branches identify both the type of work and where it belongs.

```text
notes/<topic-number>/<subtopic-number>/<yyyy-mm-dd>-<branch-idea>
labs/<topic-number>/<subtopic-number>/<yyyy-mm-dd>-<branch-idea>

bugfix/<issue-number>/<yyyy-mm-dd>-<branch-idea>
feature/<feature-number>/<yyyy-mm-dd>-<branch-idea>
```

Examples:

```text
notes/01/01/2026-08-18-http-request-response
labs/01/01/2026-08-18-build-http-server

notes/04/02/2026-09-01-distributed-lock-failure
labs/04/02/2026-09-02-redis-distributed-lock

bugfix/12/2026-09-05-fix-stale-worker
feature/07/2026-09-12-add-worker-heartbeat
```

Branch ideas should use lowercase kebab-case.

- Use this script to create branch
```powershell
.\utility\create-branch.ps1
```

---
