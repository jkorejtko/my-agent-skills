# Measurement protocol

## Establish a comparable baseline

- Prefer a production build or a representative deployed build. Record the revision, build mode, route, browser, viewport, CPU and network settings, and relevant cache or session state. Label development-server runs.
- Choose the page load or interaction that matches the reported problem. Verify the route and visible state before recording. Use mobile and desktop profiles where layout or payload differs, and tablet when it activates a distinct layout.
- Repeat the scenario under matching conditions. Report the run count, typical result, and material variation. Keep cold loads and warm revisits distinct. Use the same profiles and tools for before and after comparisons.
- Start with three valid runs per selected scenario and profile where practical. Report median and range, and repeat noisy cells before drawing conclusions. Retain failed runs and note why they were excluded from timing statistics. Run browsers serially and interleave matched before/after runs when environmental drift is likely.
- Reset the context and verify cache and service worker behavior before calling a navigation cold. For warm runs, prime the relevant path consistently. Confirm the throttle is applied to the measured requests or execution, and record where it was applied. Cross-browser network comparisons require an equivalent shaping method and settings.

## Measure the user action

- For loading, inspect the request waterfall and the dependencies behind the relevant metric. Use an interaction trace for a click, typing, navigation, or other input after load.
- Record from before the action until the expected visual update. Inspect input delay, handler time, layout and paint, and network waits. Trace the dominant delay back to a call site where possible.
- Compare first use with a repeat to isolate work such as asset decoding or lazy initialization. Label emulated timing and individual interaction measurements. Field INP requires field data.
- Report the action, interval, dominant work, and trace location if available. If multiple explanations remain, specify the next comparison that would distinguish them.

## Preserve comparable evidence

- Use a common completion signal available in every compared browser. Network idle or the end of a click command can differ from when a user sees the result. If using an observable proxy for the visible update, label it and verify it on a recorded run.
- Capture comparable timings with the same instrumentation. Use a representative diagnostic trace per important condition when tracing overhead would skew the timing runs. Label separately captured traces and their conditions.
- Keep only artifacts needed to support the report. Use existing report locations or temporary storage as appropriate and link the saved artifacts in the result. Redact sensitive headers and page data before sharing captures.

For Chromium instrumentation see [CDP CPU throttling](https://chromedevtools.github.io/devtools-protocol/tot/Emulation/#method-setCPUThrottlingRate) and [CDP network emulation](https://chromedevtools.github.io/devtools-protocol/tot/Network/#method-emulateNetworkConditionsByRule). For bundled engine coverage see [Playwright browsers](https://playwright.dev/docs/browsers).
