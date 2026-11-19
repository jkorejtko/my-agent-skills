# Vue SSR and hydration

Choose the smallest environment that can demonstrate the behavior at risk.

| Risk | Test boundary | Evidence |
| --- | --- | --- |
| Server rendering depends on browser APIs, or the server returns a placeholder | Render the component or route in a Node environment without browser globals | Assert that the server HTML contains the expected visible content, links, and image attributes. |
| Hydration replaces rendered content or client behavior starts at the wrong time | Hydrate actual server output in a client environment | Assert that the expected DOM survives, there are no relevant hydration warnings, and an observable interaction works at the intended point. |
| Behavior depends on real visibility, focus, browser layout, or navigation | Exercise the page in a real browser | Scroll, navigate, or use the control as a user would. Assert the visible result, focus, or preserved state. |

Match the test to the application's lifecycle. For delayed hydration, verify behavior before and after the trigger. A stubbed observer can exercise the trigger contract. Use a browser if actual intersection behavior matters. For cached component views, cover deactivation and reactivation while loading when the timing can change the outcome.

For example, a product card rendered on the server should contain its name and image. Client hydration should preserve that content and make the card interactive when the configured trigger fires. The SSR assertion should fail if the server only renders a skeleton. The interaction assertion should fail if the trigger never activates the card. Test each regression at the boundary where it becomes observable.
