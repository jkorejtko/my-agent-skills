# Interaction stability

## Set the baseline

- Reproduce the route, viewport, input method, scroll position, and relevant UI state. Wait for the starting state to settle, then begin recording before the action. Follow the flow through loading, arrival of data, and the final visible state.
- Pick a few anchors that should stay stable, such as a menu trigger, neighboring controls, a filter panel, or the scroll container. Identify the content expected to change. Use scroll offsets to distinguish normal scrolling from a jump relative to the page or container.

## Capture movement and response

- Capture a browser trace or frame sequence around the action when available. Collect `layout-shift` entries where supported, including timestamps, moved elements, and `hadRecentInput`. A moved element is a clue to the cause. Inspect surrounding changes before attributing it.
- Compare the anchors' viewport rectangles before, during, and after the action. Report maximum displacement or size change in CSS pixels and when it happened. Include intermediate frames when an element moves back to its original position. Use these checks for motion that layout-shift entries miss, including visual motion from transforms. Keep geometry sampling focused and collect timing separately if instrumentation affects the result.
- Qualifying shifts shortly after discrete input can be excluded from CLS. Keep any observed movement relevant to the scenario even if the entry has `hadRecentInput`. Report that movement separately from standard CLS. INP does not cover hover or scroll. For clicks or keys, capture next-paint timing where supported and record time to the expected result separately, especially after a network response.
- If there is visible stutter without displacement, inspect frame gaps and long frames. Report the browser capability and evidence used. Missing entries alone do not establish that the experience was stable.

## Run representative scenarios

- **Menu hover.** Move the pointer across adjacent triggers, into the submenu, and back. Pause over a trigger after entering. Check whether the pointer loses its intended target while stationary, whether the menu flickers or closes, and whether neighboring items move. Record the trigger and neighbor positions. Opening the submenu is expected. Losing the target because the trigger shifted is a finding.
- **Category filter.** Start from a known category and scroll position. Apply and clear a filter. Observe the clicked control, panel, results, and scroll container before the action, during loading, and after data arrives. The result grid may change by design. Flag a control moving under the pointer, an unexpected scroll reset, or transient layout changes that obstruct the next action. When available and relevant, repeat with a slower response to expose the loading state.

Report the exact route and action, the moved element and timing, observed displacement or delay, the effect on the next user action, and a link to the supporting capture when available. Include a focused retest.
