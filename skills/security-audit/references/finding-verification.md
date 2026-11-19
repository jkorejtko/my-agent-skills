# Finding verification

Apply this process to each candidate that could affect the audit's risk assessment or remediation. Tool matches and suspicious code are starting points.

## Establish the path

State the claim in terms of:

1. Input or state an attacker can influence, and the required identity or access.
2. The missing or bypassed security control.
3. A reachable operation consuming that input or state.
4. The resulting security impact under the actual deployment assumptions.

Follow middleware, shared validators, framework defaults, tenant filters, and downstream checks before concluding that a control is absent. Search for evidence that would disprove the claim. A dangerous API call alone is insufficient.

For dependency advisories, establish the resolved package version, affected feature, how the application uses it, and runtime reachability. Distinguish an affected installed dependency from a demonstrated exploitable application path. Do not label unknown reachability as unreachable.

## Support or challenge the claim

Use the strongest evidence available within the authorized scope:

- Trace the complete executable path with file and line references, including any mitigating controls.
- Inspect existing tests or independent configuration evidence that could corroborate or refute the path. Two scanners repeating the same advisory are not independent proof of exploitability.
- If runtime testing is authorized, use a minimal bounded reproduction and a benign control that changes the relevant security condition. For authorization, compare allowed and denied identities or objects and verify both response data and side effects. A status code alone may be insufficient.

Never test real-user data, alter production state, or expand the target or request budget without authorization. When safe reproduction is unavailable, preserve the static evidence and state the limitation.

## Assign a disposition

- **Confirmed:** evidence establishes the reachable control failure and impact. Name whether support is static, runtime, or both.
- **Refuted:** a specific control, unreachable path, unaffected version, or other counterevidence invalidates the claim. Keep a brief reason to avoid repeating it; a long list need not appear in the final report.
- **Inconclusive:** a necessary premise remains unknown. Name it and the smallest check that would resolve it.

Record the target/revision, affected locations, prerequisites, evidence, disposition, confidence, impact, and limitations. Include remediation and a retest condition for retained findings. Quote only the minimum necessary evidence; redact secrets.

For confirmed findings, inspect nearby variants of the same root cause within the agreed scope. Verify each additional path rather than assuming it shares the vulnerability. Consolidate remediation where appropriate.

## Example of a useful finding

An authenticated tenant member controls an invoice ID; the server queries by ID without a tenant predicate or subsequent ownership check; the handler returns the other tenant's invoice fields. Cite the route, query, and response mapping. Check shared middleware for ownership enforcement before confirming. If another service enforces ownership and cannot be inspected, retain an inconclusive candidate with that explicit missing premise.
