# Session 2: Speaker Notes Script

**AI in the Testing Workflow — Practical Integration**  
**Date:** Monday, 21st July 2026 | 8:30–10:30 AM (IST)  
**Facilitator:** Dr. Chathuranga Manamendra

---

## Slide 1: Title

> "Welcome back everyone to Session 2. Last week we built the foundation — tool maps, specs, and the Three Levels framework. Today we put it all to work. You'll leave this session with a working micro-app and passing Playwright tests — built with AI assistance."

> "Quick check: did everyone bring their spec from last week? Good. You'll need it."

---

## Slide 2: Agenda

> "Today's structure: 5 theory topics building your practical skills, then 1 hour of hands-on building. The theory is shorter and more applied — every topic directly feeds into what you'll do in the practical."

---

## Recap Quiz: Session 1 Review

> "Let's warm up with a quick recall from last week. Three questions to get your brain back in AI-testing mode."

> **[After quiz]** "Great. Those concepts — the three levels, spec quality, and the tool-vs-agent distinction — are the foundation for everything today."

---

## Slide 3 (Chapter 01): AI Across the SDLC

> "Last week we focused on AI in testing specifically. Today we zoom out — AI has applications at EVERY stage of the software lifecycle. Understanding the full map helps you spot the highest-value integration points."

---

## Slide 4: AI-Augmented SDLC Map

> "Here's the full picture. Requirements, Design, Build, Test, Deploy, Monitor — AI plays a role at each stage."

> **[Build each phase]** "Requirements: ambiguity detection, testability scoring. Design: architecture review, risk assessment. Build: code generation, code review. Test: test generation, data synthesis. Deploy: risk prediction, release validation. Monitor: anomaly detection, incident triage."

> "Question: where are you currently using AI? Where's your biggest untapped opportunity? Most teams only apply AI to test generation — but the biggest ROI might be in requirements or defect management."

---

## Slide 5: AI in Testing Phases — Detail

> "Let's zoom into the testing phases specifically. Four sub-phases: Test Planning, Test Creation, Test Execution, and Defect Management."

> "For each phase, AI brings specific capabilities. Test Planning: risk-based prioritization, change impact analysis. Test Creation: scenario generation, data synthesis, code generation. Execution: self-healing, intelligent retry, flaky detection. Defect Management: auto-classification, duplicate detection, root cause suggestion."

---

## Quiz 1

> "Quick check. In which SDLC phase would 'AI scanning user stories for vague language' fit?"

> **[After answers]** "Requirements — that's ambiguity detection. Catching issues before code is written is always cheaper than finding them in test."

---

## Slide 6 (Chapter 02): Prompt Engineering for QA

> "This is THE core skill of AI-augmented QA. A good prompt is the difference between useful output and garbage. Everything you do with AI tools depends on how well you communicate with them."

---

## Slide 7: Anatomy of a Good QA Prompt

> "Five components. Context — who you are, what domain. Spec/Input — the user story, acceptance criteria. Constraints — your tech stack, patterns, limitations. Format — how you want the output structured. Examples — what good output looks like."

> "Miss any of these and your output quality drops significantly. The spec from Session 1 provides your Input and Constraints. Today you learn to wrap them in the right prompt structure."

---

## Slide 8: Techniques That Work

> "Five proven techniques. Role prompting: 'You are a senior QA engineer who specializes in...' — this sets the quality bar."

> "Few-shot examples: show one good test case before asking for more. Chain-of-thought: 'First analyze the spec, then identify scenarios, then write tests.' Constraint anchoring: 'Use Playwright with TypeScript, Page Object Model pattern.' Negative prompting: 'Do NOT only test the happy path.'"

> "These aren't theoretical — you'll use them in the practical in 30 minutes."

---

## Slide 9: Prompt Templates

> "Three ready-to-use templates. Template 1: Test Case Generation — includes role, context, spec, tech stack, and output format. Template 2: Defect Report from Test Failure. Template 3: Spec Review for testability issues."

> "These are in your handouts. Use them as starting points, then customize for your domain."

---

## Quiz 2

> "Which prompt technique works best when AI generates only happy-path tests?"

> **[After answers]** "Negative prompting — explicitly tell the AI 'Do NOT include only happy path tests. Include negative flows, boundary conditions, and error handling.' You have to constrain what you DON'T want."

---

## Slide 10 (Chapter 03): From Spec to Automated Test

> "Now we connect Session 1's specs directly to Playwright. This is where the rubber meets the road."

---

## Slide 11: Spec → Test Workflow

> "Three boxes. Your Spec feeds into AI Generates Playwright Tests feeds into You Validate & Refine."

> "The key insight: your spec's acceptance criteria are literally the test descriptions. 'Given X, When Y, Then Z' maps directly to a Playwright test structure. AI is the translator between your spec language and executable code."

---

## Slide 12: Playwright + AI

> "Why Playwright for AI-assisted testing? It's modern, TypeScript-first, well-documented, and AI tools are extensively trained on it. Auto-wait, smart assertions, cross-browser — it handles the complexity."

> "The workflow: feed acceptance criteria to AI, get test scaffolding. AI generates the file structure, page objects, and test stubs. You refine: selectors, assertions, test data, flow logic."

> "Traceability: name every test `test('[Story-X] should [acceptance criterion]')`. If a test can't trace to a spec item, question why it exists."

---

## Slide 13 (Chapter 04): Evaluating AI Output

> "AI will confidently generate incorrect, incomplete, or misleading test artifacts. Your job as a quality engineer is to catch that. This is where your expertise is irreplaceable."

---

## Slide 14: 5-Dimension Evaluation Framework

> "Five dimensions. Coverage: does this test what the spec requires? Correctness: are assertions checking the right things? Completeness: are edge cases covered? Maintainability: can a human read and update this? Trustworthiness: would you bet on this in production?"

> "Use this framework every time you review AI-generated tests. It takes 2 minutes and catches 90% of issues."

---

## Slide 15: Spotting AI Hallucinations

> "Four patterns to watch for. Tests that check elements exist but not their content. Assertions that match expected to itself — tautologies. Tests with no meaningful assertions — just `expect(page).toBeVisible()`. Impressive-looking suites that test nothing meaningful."

> "The scariest pattern: 20 tests for a login page where none actually verify authentication works. Looks comprehensive in the test report. Catches zero bugs."

---

## Quiz 3

> "Which is an example of 'hallucinated coverage'?"

> **[After answers]** "A test that asserts a button exists but never clicks it or checks what happens. It'll pass whether the feature works or not — that's the hallucination."

---

## Slide 16: Guardrail Principles

> "Five principles. Never commit unreviewed AI code. Every test needs at least one meaningful assertion that validates business logic. For every positive test, at least one negative test. Every test must link to a spec item. And manual exploration first — AI generates from spec, but exploratory testing finds what spec missed."

---

## Slide 17 (Chapter 05): Common Pitfalls

> "Final theory topic. Four traps to avoid."

---

## Slide 18: Pitfalls to Avoid

> "One: Over-reliance — 'AI said it's covered.' Forty tests generated, but 30 test the same happy path with variations. Fix: check coverage against spec, not test count."

> "Two: Hallucinated coverage — tests that pass but test nothing meaningful. Fix: assertion audit."

> "Three: False confidence from impressive output — AI-generated suites look professional. Dangerous because it discourages questioning. Fix: adversarial thinking."

> "Four: The copy-paste trap — taking AI output verbatim without understanding it. Fix: treat AI output as a first draft, never the final version."

> "Real example from your org: The Real Estate team reports 'development output from AI is too much to test and release.' That's the over-reliance pitfall happening in real time."

---

## Slide 19: Practical Exercise

> "Time to build. You have 60 minutes. Three tasks."

> "Task 1: 20 minutes — build your micro-app from the spec. AI is your pair programmer. Don't aim for perfection — aim for functional. RAD checkpoints: basic UI by minute 5, one story working by minute 10, core flows by minute 15, demo-able by minute 20."

> "Task 2: 25 minutes — write Playwright tests from your acceptance criteria. Use the prompt templates. Aim for 3-5 passing tests with traceability."

> "Task 3: 10 minutes — validate using the 5-dimension framework. Coverage audit, assertion quality check, hallucination check."

> "Debrief: 5 minutes — quick demo, one passing test, one good prompt pattern, one thing AI got wrong."

> "Go. Timer starts now."

---

## Slide 20: Closing

> "Incredible work today. You've gone from spec to working software to automated tests — all with AI assistance. That's the AI-Augmented workflow in action."

> "Next week is the finale. You'll complete your project to full coverage, build your team's AI adoption roadmap with guardrails, and present your work. Bring everything — your app, your tests, your prompt patterns."

> "Homework if you want it: add 2 more tests, improve your app based on what tests revealed. See you next week."

---

## Timing Guide

| Section | Duration | Cumulative |
|---------|----------|-----------|
| Title + Agenda + Recap Quiz | 5 min | 5 min |
| Chapter 01: AI Across SDLC (2 slides) + Quiz | 10 min | 15 min |
| Chapter 02: Prompt Engineering (3 slides) + Quiz | 15 min | 30 min |
| Chapter 03: Spec to Test (2 slides) | 8 min | 38 min |
| Chapter 04: Evaluating Output (3 slides) + Quiz | 10 min | 48 min |
| Chapter 05: Pitfalls (1 slide) | 5 min | 53 min |
| Practical Exercise intro | 2 min | 55 min |
| **TRANSITION** | 5 min | 60 min |
| Practical Exercise | 55 min | 115 min |
| Closing | 5 min | 120 min |
