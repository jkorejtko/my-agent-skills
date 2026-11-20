---
name: minimalistic-design-audit
description: Audit the visual hierarchy of a website or app for competing calls to action, redundant links, and distracting elements. Use for minimal design reviews, squint tests, and prioritizing what to remove or simplify while preserving the user journey.
---

# Minimalistic Design Audit

> Dokonalost nastává, když už není co odebrat.

Review what competes for attention and propose the smallest changes that make the intended next step obvious. Treat this as an audit unless the user also requests implementation.

## Establish the task

- Identify the user, the page or state they are in, and what they came to do. Define the **decision area** where that task happens, such as the hero, a filter drawer, or the footer of a dialog. Name the next action in the user's words. For reading, browsing, and other states where no single action is appropriate, identify the content or choice that should lead.
- Inspect the first viewport and the point where the user is ready to act. Use representative desktop and mobile widths when available. Check relevant active, loading, empty, and error states if they change what should stand out.
- Use screenshots or the rendered UI to judge visual weight. If only source is available, label hierarchy findings as provisional.

## Run the squint test

1. Look briefly at the viewport with eyes partly closed, from a distance, or using a reduced or lightly blurred screenshot. Keep the entire visible viewport in view, including sticky controls and banners. Record the first thing that draws attention before inspecting labels or implementation.
2. Where the user has a clear next step, look for **one visually dominant CTA** per decision area. Record the outcome as **clear**, **competing**, **missing or wrong emphasis**, or **no primary CTA needed**. Name the specific competitor and why it wins attention, such as a second filled button, a fixed banner, or moving imagery. A heading can still lead the reading order.
3. Look at the unmodified view. Confirm that the prominent control does what the user expects and that necessary alternatives are recognizable. Count simultaneous visual choices, including duplicated versions of the same action. Repeating the same action can help at later decision points if the copies do not compete within the same view.

The squint test checks visual hierarchy. Assess access with the actual UI, including legibility, keyboard focus, meaningful labels, and screen-reader semantics. If a person unfamiliar with the page is available, show it briefly and ask what it offers and what they would do next. Label your own quick impression as expert review.

## Remove visual competition

- **Remove** duplicate links, repeated copy, purely decorative badges, or animation that draws attention away from the task when no useful information or action would be lost. For each candidate ask who would miss it and when.
- **Demote or combine** useful alternatives that compete visually with the primary action. Prefer a consistent secondary style. Combine links only if they serve the same intent from that point in the journey. Keep essential navigation and frequently used controls discoverable. Hiding a control can add friction even when it makes the screen look simpler.
- **Use emphasis sparingly.** Give the primary action visual weight through placement, contrast, type, or space around it. Group related items and retain cues that distinguish links, buttons, current filters, and status messages.
- **Protect completion and recovery.** Preserve information people need to decide, including prices or consequences where relevant, plus alternatives such as cancel, skip, reject, or undo. Give equivalent choices comparable emphasis where users are making a neutral decision, such as accepting or rejecting optional tracking. Check whether the proposed change adds a hidden step or makes the task harder to recover. Verify that quieter controls remain legible and recognizable and that focus, keyboard operation, and touch access still work. Use `ux-audit` for a broader journey or accessibility review when available.

Use [worked examples](references/worked-examples.md) when the screen mixes multiple tasks, states, or overlapping calls to action.

## Report

State the screen, task, tested viewport and state, intended primary action or focus, and squint-test outcome. For each priority finding, name the competing element, the reason it distracts, the proposed decision, and one retest with an observable outcome. Cite screenshots or the rendered view when inspected. Label untested proposals as such.

When a revised view is available, compare it against the same viewport and state. Confirm that the intended action stands out, the user can still complete and recover from the task, and required choices remain discoverable. Treat any expected conversion effect as a hypothesis until tested.

## Reading behind the method

- [Ondřej Ilinčev on visual hierarchy](https://www.ilincev.com/vizualni-hierarchie-na-webu) informs the squint test, brief first-impression check, and ordering by importance.
- [Minimalism in web design](https://www.ilincev.com/minimalismus) informs the use of space and contrast and the emphasis on discoverable navigation.
- [Calls to action](https://www.ilincev.com/call-to-action) and [cases where best practices failed](https://www.ilincev.com/kdy-nefunguji-best-practices) inform action hierarchy, placement in the journey, and checking that simplification serves the actual audience.
