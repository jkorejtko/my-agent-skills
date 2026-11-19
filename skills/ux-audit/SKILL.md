---
name: ux-audit
description: Audit the usability of an existing website or application through user journeys, responsive layouts, interaction states, keyboard and touch controls, and UI copy. Use for UX reviews of a screen, workflow, or product.
---

# UX Audit

Evaluate whether people can complete their tasks, understand what happened, and recover when something goes wrong. Audit the requested scope and report changes in priority order. Keep implementation separate unless the user also asks for fixes.

## Pick journeys and evidence

- Identify the user role, starting point, intended outcome, and the actions most likely to cause confusion or costly mistakes. For a focused request, follow the affected journey through completion and recovery.
- Use the current implementation and existing tests to find the default path and edge states. When browser work is requested, exercise the journey in the available preview or test environment. Prefer test data for destructive actions. Record the role, route, viewport, and input method when they affect the result.
- Match the device checks to the journey. For a responsive web review, cover a narrow viewport and desktop, adding tablet when a breakpoint changes the layout or controls. Check the measured viewport. Emulation can verify layout and many interactions, while native keyboard and touch behavior may need a physical device.
- If the UI cannot be exercised, report source observations and identify which interactions still need a browser or device check. Keep performance numbers and accessibility conformance claims tied to their actual evidence.

## Follow the interaction

- **Discover and act.** Check whether the next action, available controls, current selection, and consequences are clear. Look for information or actions available only on hover. Verify keyboard access, visible focus, focus return after dialogs, and Escape or another clear dismissal mechanism.
- **Change context.** Switch filters, sorting, tabs, pages, or roles while a selection or edit is active. Check whether state carries over as expected and whether any hidden selections still count toward bulk actions.
- **Handle disruption.** Compare loading, empty, no-results, error, and partial-success states. Check retry, unsaved changes, duplicate submissions, and whether status messages describe what actually happened.
- **Complete consequential actions.** Verify that confirmations identify the item, count, and scope where relevant. Check how users detect partial failure and recover from mistakes. Use existing tests or source evidence if execution would affect real data.
- **Read the UI as a user.** Check that labels, help, and feedback match the actual behavior and visible controls. On small screens, check truncation, wrapping, reachability, and whether fixed controls obscure content or intercept scrolling.

## Report findings

When visible movement or stutter affects a journey, use `real-browser-audit` and its interaction stability protocol for measurement when available. Describe the usability consequence in the UX report, such as a button moving away from the pointer.

For each material finding, state the scenario, observed behavior, user consequence, and proposed change. Cite the route, code location, test, or captured evidence. Include a short retest whenever the result depends on an interaction.

Prioritize blocked tasks and data loss first, followed by recurring friction and visual polish. Put source-based hypotheses in a separate group and name the check needed to confirm them. End with the journeys, device/input combinations, and failure states you covered and any gaps that could change the conclusions.
