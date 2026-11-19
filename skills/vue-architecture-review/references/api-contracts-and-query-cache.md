# API contracts and query cache

## Trace a representative operation

- Follow the action from the component through its composable or store, the request builder, and the client. When the BFF or API is in scope, continue through the route and response mapper. Cite the owning repository at each boundary that matters.
- Compare the method, path, query or body, success shape, and relevant error behavior to the project's source of truth. This may be a versioned schema, shared types, or documented server behavior. Identify any discrepancies and name boundaries where the contract could not be inspected.
- Check where response data becomes an application model and how unexpected or missing fields are handled. For generated clients, establish which version of the contract generated them and whether the project detects drift. Type-checking the generated client against an old schema can still pass.

## Trace cache behavior after a write

- Locate the cache that serves the affected view. Check that inputs which change the response, such as shop, filter, or pagination, distinguish cached entries. Check whether the cache is isolated by account or session when responses depend on it.
- For a representative mutation, identify which lists, details, or counts should change and what actually updates them. Look for stale variants when a record moves between filters. If there is optimistic state, follow rollback on failure.
- When frontend and BFF caches both exist, check both layers. A frontend refetch can still receive an old BFF response. Identify the owner of each key and invalidation rule before proposing a shared helper or a change to the cache policy.

For example, changing an item from available to archived can affect the old filtered list, the new list, the item detail, and their counts. Follow one write through the app and name the views that stay stale, the cache that serves them, and the smallest check that would establish the behavior.
