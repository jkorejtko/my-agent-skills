# SSR and backend for frontend (BFF)

## Trace the request path

- Map the path from edge through middleware, render admission, HTML cache, data fetches, render, and response. Use available timings or trace IDs to attribute waits. Cover warm hit, cold miss, bypass, and stale or error paths separately.
- On a cache hit, identify middleware, session work, and remote cache operations still on the critical path. On concurrent misses, check whether requests for the same key share a render or each consume a slot. Establish whether that behavior applies within one process or across replicas.
- Follow preview or cache-bypass flags across callers through both the read and write paths. Check the cache key for relevant request context and whether fallbacks or incomplete output can enter the cache.

## Follow deadlines and cleanup

- Compare upstream, SSR, and gateway budgets. Verify whether the upstream timeout covers both headers and body consumption and whether cancellation reaches downstream work.
- Distinguish the response deadline, render slot release, and termination of the operation. Follow cancellation and cleanup on timeout and client disconnect. Fetches and renderer work can survive a timed-out response.
- Inspect queue limits, retries, and cache-miss coalescing before recommending more concurrency. Trace how each behaves when an upstream is slow or intermittently fails.

If local runtime checks are in scope, compare a warm hit, a cold miss, and a slow upstream stub. Use representative conditions and record what each scenario establishes. For source-only audits, report the path and remaining uncertainty without assigning latency or throughput values.
