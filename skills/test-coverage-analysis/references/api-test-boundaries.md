# API test boundaries

Start with the specific regression the test should detect. Check where the test replaces production code and whether the behavior at risk still executes.

| Regression | Useful test boundary |
| --- | --- |
| The UI renders the wrong state for a known application result | A component test can stub the data layer and assert the visible state. |
| A filter sends the wrong query parameter or misreads the response | Exercise the real request builder and response mapping with a mock at the HTTP boundary. Check the relevant request fields and the visible result. |
| The FE client and BFF disagree about a response shape | Compare the client and fixtures against the versioned contract or exercise the BFF handler with a controlled upstream. A frontend mock alone cannot verify the server's actual response. |
| A successful mutation leaves a filtered list stale | Keep the actual cache behavior in the test, control the network responses, and assert the visible update after the write. |

- Check fixture provenance. Anchor relevant fields to the project's contract or observed server behavior. Look for important optional fields, error statuses, and pagination details that a hand-written success fixture may omit.
- Check that unexpected requests fail or are surfaced in integration tests. A permissive mock that returns the same success payload for every query can hide broken URLs and filters.
- Review whether normal CI runs are deterministic without a live external backend. Use existing fixtures, HTTP mocks, or a local stub where they preserve the boundary under test. When a separate live integration check is needed, describe the environment and what it proves.

For a filter, select a status through the UI, match the outgoing query, return a distinct response for that status, and assert the updated list. The test should fail if the request always sends the default status or if the UI keeps the old result.
