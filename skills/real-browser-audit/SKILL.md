---
name: real-browser-audit
description: Measure page loading, interaction latency, and visual stability in real browsers. Use for Lighthouse or Core Web Vitals audits, browser traces, elements that jump during use, and comparisons under network or CPU throttling.
---

# Real Browser Audit

Measure how long a user waits for a page or interaction and identify what dominates the wait. For a broad source-level review of frontend, SSR, cache, and BFF, use `performance-audit` when available. For a combined audit, share one summary and put the run matrix and evidence below it.

## Choose the audit mode

- **Lighthouse baseline.** Use Lighthouse navigation mode when load performance is the question. Report LCP, CLS, and TBT, with FCP or Speed Index when they help explain the result. Record the Lighthouse version, device preset, throttling method, and cache state. Compare raw metrics under the same settings. If Lighthouse is unavailable, label any browser-native measurements by their actual source.
- **Interaction stability.** For hover, scroll, filtering, or controls that move after loading, use [Interaction stability](references/interaction-stability.md). Record the action, the elements or scroll position that should stay stable, the expected content change, and the observed displacement or delay.

Use the focused mode requested. When both are in scope, report initial navigation metrics and post-load observations separately.

## Establish the test

1. Identify the build or revision and the route. For an interaction audit, pick one representative action and an observable completion condition, such as the selected image becoming visible after opening a gallery. Add routes or actions when the request calls for them.
2. Use the browser tools and test setup available in the current host. Record the exact browser product or engine, version, OS, machine or device, viewport, headless or headed mode, and build type. A mobile viewport models layout. Measurements from a physical phone should identify the device.
3. Define cache, authentication, and test data state before collecting samples. Keep cold loads, warm revisits, first interactions, and repeated interactions distinct. Use test data when the action writes anything.
4. Follow [Measurement protocol](references/measurement-protocol.md) for repetitions, instrumentation, and evidence capture.

## Run the profiles

| Profile | Network | CPU | What it isolates |
| --- | --- | --- | --- |
| Normal | Unthrottled | Unthrottled | Baseline in each requested, available browser |
| Slow 4G | Recorded latency, download and upload settings | Unthrottled | Sensitivity to the connection |
| CPU stress | Same as normal | 10× where supported | Sensitivity to CPU delay |
| Combined | Same as Slow 4G | Same as CPU stress or a named calibrated profile | Behavior when both constraints apply |

Start with normal runs in the requested browsers, then add Slow 4G and CPU stress where the controls are supported. Use the combined profile when it answers a question the isolated runs leave open. Verify the effective settings and label unsupported or unrun cells. Record the actual network settings even when using a named preset. Record the CPU method and factor, which are relative to the test machine. A calibrated mobile approximation and a 10× stress run are separate profiles.

Use installed Chrome, Firefox, or Safari when the result must describe that product. Label bundled Playwright builds explicitly as Chromium, Playwright Firefox, or Playwright WebKit. For Chromium controls use the available DevTools tooling or CDP. Treat software throttling and physical-device runs as distinct test setups.

## Report what changed

- Lead with the most consequential observed slowdown and its likely cause. Cite the trace evidence and identify any competing explanation the run could not resolve.
- Report the scenario, browser/version, profile, cache state, sample count, typical timing and spread, and trace or report location. Compare common metrics only under comparable conditions. Keep browser-specific diagnostics with their own runs.
- Use navigation metrics such as LCP, CLS, and TTFB where relevant. For an interaction, distinguish delay to the next paint from time until the expected result is visible. Use the label field INP only for field data.
- Include unsuccessful runs and gaps that affect the conclusion. End with the highest-value fix or diagnostic and the exact scenario to rerun.
