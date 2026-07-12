# Session 1: Speaker Notes Script

**AI-Powered QA — Rethinking Strategy & Process**  
**Date:** Monday, 14th July 2026 | 8:30–10:30 AM (IST)  
**Facilitator:** Dr. Chathuranga Manamendra

---

## Slide 1: Title

> "Good morning everyone. Welcome to Session 1 of AI-Powered QA — Rethinking Strategy & Process. This is a 3-session series running weekly. Today we have 1 hour of theory covering 5 key topics, followed by 1 hour of hands-on practical work in groups."

> "Quick show of hands — how many of you have used an AI tool for testing in the last month? ...Great. By the end of today, everyone will have hands-on experience. Let's get started."

---

## Slide 2: Ground Rules

> "Before we begin, a few ground rules. This is a safe space — there are no dumb questions. We're all at different levels with AI, and that's completely fine. The goal is to leave today with practical skills, not theoretical knowledge."

> "Phones on silent please. Feel free to use AI tools during the practical — that's the whole point. Questions are welcome anytime during theory."

---

## Slide 3: Agenda

> "Here's our roadmap for today. Six topics — five theory, one practical. We'll cover what AI can actually do in testing, survey the tool landscape, introduce spec-driven development, talk about how your role is evolving, and discuss guardrails. Then you'll apply everything in a hands-on exercise."

---

## Slide 4 (Chapter 01 Header): AI-Driven Testing in Practice

> "Let's start by separating hype from reality. AI in testing has become a buzzword — but what does it actually mean for us as quality engineers?"

---

## Slide 4A: Three Levels — Staircase Overview

> "AI in testing isn't a single thing — it's a spectrum. Think of it as a staircase with three levels."

> **[Click — Level 1 appears]** "At the bottom, AI-Assisted. This is where 94% of teams are today. You're in the driver's seat. You type, Copilot suggests. You ask Claude a question, it answers. The AI is reactive — on demand only."

> **[Click — Level 2 appears]** "In the middle, AI-Augmented. This is where the real productivity gains happen. AI handles routine tasks — generating test suites, triaging defects — and you review and guide. This is our target for this series."

> **[Click — Level 3 appears]** "At the top, AI-Autonomous. Only 12% of organizations have reached this. AI plans, executes, and adapts independently. You set goals, AI figures out how. We'll explore this in the Advanced Series."

> "The key insight: the gap between 94% adoption and 12% maturity is where the opportunity lives."

---

## Slide 4B: Level 1 — AI-Assisted

> "Let's go deeper into Level 1. Here, the human drives everything. You decide when to invoke AI, what to do with the output. Examples you're probably already using: Copilot autocomplete as you type, asking Claude to generate a test case, AI suggesting assertion patterns."

> "This is the starting point. Useful, but limited — you're doing all the thinking. The AI just saves you keystrokes."

---

## Slide 4C: Level 2 — AI-Augmented

> "Level 2 is fundamentally different. Here, AI and human work as partners. AI generates a full test suite from your spec — you review it. AI auto-triages defects — you confirm the classifications. Self-healing locators fix themselves — you set the rules."

> "Your Warehouse team is already here — they have 'Code reviewed by Copilot' in their Definition of Done. That's AI-Augmented in action. This series takes everyone to this level."

---

## Slide 4D: Level 3 — AI-Autonomous

> "Level 3 is the frontier. The robot is in charge. AI plans the test strategy from requirements, executes tests, adapts when things fail, files bugs with evidence and root cause — all without human intervention between steps."

> "Multi-agent systems where different AI agents handle different concerns. Only 12% are here. This is Advanced Series territory — we'll build agents like this in the follow-up series."

---

## Slide 4E: Comparison Summary

> "Here's your reference table. Notice two things: as AI does more, human effort goes down — but trust required goes up. That's why guardrails matter — Topic 5 later today."

> "Quick question for you: where would YOU place your team on this table today? Think about it silently."

---

## Slide 5: What AI Can Do for QA Today

> "These aren't theoretical — these are real numbers from 2025-2026 industry reports. 40–70% reduction in test creation time. Over 30% cut in test cycle time — 80% of organizations report this. 40% reduction in manual effort per project."

> "And the capabilities: test case generation from user stories, intelligent defect triage, visual regression with AI noise filtering, risk-based test selection, flaky test detection, and synthetic test data."

> "Question for you: which of these would have the biggest impact on YOUR daily work right now?"

---

## Slide 6: What AI Cannot Do (Yet)

> "Now the reality check. Balance is important. AI cannot understand your business domain without clear specifications. It generates plausible output — not provably correct output. It can't replace the exploratory testing intuition you've built over years."

> "It can't read the room — organizational politics, stakeholder dynamics, human factors. And critically, it cannot make risk decisions. Accountability requires human judgment."

> **[Click — right panel appears]** "But look at the other side. These limitations are exactly what makes YOU essential. Domain expertise, creativity, judgment, empathy — these are your superpowers. AI amplifies your expertise. It doesn't replace it."

---

## Quiz 1

> "Quick check before we move on. Which level of AI involvement best describes: 'AI generates full test suites, human reviews before committing'?"

> **[After answers]** "Correct — AI-Augmented. The human review step is what distinguishes it from Autonomous. If there's no human in the loop, that's Autonomous."

---

## Slide 7 (Chapter 02 Header): The AI Tool Landscape & Agent Capabilities

> "Now let's map what's actually out there. What tools exist, and critically, what's the difference between a tool and an agent?"

---

## Slide 8: AI Tool Categories for QA

> "Six categories of AI tools relevant to your work. Test generation, execution and orchestration, defect intelligence, test data, visual testing, and monitoring."

> "Hover over any category name for a detailed explanation. This is your starting point — in the practical exercise, you'll expand this into a full tool map for your team."

> "Quick poll: which categories are you already using tools in? ...And which has the biggest gap?"

---

## Slide 9: Tools vs Agents

> "This is the most important conceptual distinction in today's session."

> **[Click — Tool card]** "A tool is a transaction. You ask, it answers, done. No memory between calls. Like a calculator — powerful but stateless. Example: you ask Claude to generate a test case. It responds. Transaction complete."

> **[Click — Agent card]** "An agent is fundamentally different. It has goals, memory, and planning ability. It can take multiple actions, learn from results, and adapt. Example: you tell Copilot Workspace 'test this feature end-to-end' — it plans the approach, writes the tests, runs them, and iterates."

> "Understanding this distinction changes how you think about what's possible — and what guardrails you need."

---

## Quiz 2

> "What's the key difference between a Tool and an Agent?"

> **[After answers]** "Agents have goals, memory, and multi-step planning. A tool does one thing when asked. An agent orchestrates multiple steps toward a goal."

---

## Slide 10 (Chapter 03 Header): Spec-Driven Development

> "This is perhaps THE most important concept in the entire series. Everything else builds on this foundation. The quality of your spec determines everything downstream."

---

## Slide 11: Why Specs Matter More in an AI World

> "Here's the principle in one sentence: the quality of your specification directly determines the quality of your AI output."

> **[Click — bad side]** "Without clear specs — vague input to AI, generic shallow tests, false confidence, bugs reach production. Coverage theater."

> **[Click — good side]** "With clear specs — precise AI input, boundary and negative cases included, genuine coverage, defects caught early. Real confidence."

> **[LIVE DEMO if time allows]** "Let me show you this live. I'll paste a vague requirement into Claude... see what we get. Now watch what happens when I rewrite it as a proper Given/When/Then spec... The difference is night and day."

---

## Slide 12: The Spec → Code → Test → Validate Loop

> "This is the workflow you'll practice in Session 2. Five steps in a continuous loop."

> **[Build each step]** "Start with a Spec — human writes acceptance criteria and edge cases. AI generates Code from the spec. AI creates Tests — Playwright tests directly from your spec. Human Validates — reviews and verifies AI output. Then Refine — iterate on gaps and feed back into the spec."

> "Two critical points: the spec drives BOTH code generation and test generation. And when specs change, AI can identify which tests need updating. That's traceability at scale."

> "Bring your spec to Session 2 — polished or rough, we're building from it."

---

## Slide 13: Writing Testable Specifications

> "Five principles that make your specs dramatically more useful as AI input."

> **[Build cards]** "One: Given/When/Then format. Two: explicit boundaries — '1 to 100 characters', not 'user enters text'. Three: negative cases — what should NOT happen. Four: data constraints — formats, ranges, types. Five: error behaviors — what happens when things go wrong."

> "Look at the example at the bottom. 'Users can log in' tells AI nothing. But 'Given valid email plus 8-character password, When submit, Then redirect within 2 seconds, max 3 attempts then 15-minute lockout' — that gives AI everything it needs to generate meaningful tests."

> "You'll apply these principles directly in the practical exercise."

---

## Quiz 3

> "Which specification is MOST useful as input for AI test generation?"

> **[After answers]** "Option B. Clear boundaries, specific context, measurable outcomes. That's what gives AI the precision it needs."

---

## Slide 14 (Chapter 04 Header): The Evolving QA Role & AI Skills

> "How has your role changed in the last two years? What feels different now compared to before AI tools? Let's talk about where QE is heading."

---

## Slide 15: From Gatekeeper to Strategist

> **[Click — Old model]** "The old model: reactive, finding bugs after code is written. A gate at the end of the cycle. Manual execution. Measured by bug count. Siloed from development."

> **[Click — New model]** "The new model: proactive, influencing quality at every stage. Present from architecture through deployment. AI handles routine execution. Measured by quality outcomes. Embedded in the delivery team."

> "The key message: the most valuable QE knows what to automate AND what NOT to. That judgment is irreplaceable."

---

## Slide 16: QE AI Skills Matrix

> "Where are you today on this matrix? Be honest with yourself."

> **[Build levels]** "Level 1 — Consumer: uses AI tools as provided. Level 2 — Power User: crafts effective prompts, evaluates output. Level 3 — Builder: creates workflows, integrates AI into pipelines. Level 4 — Architect: designs org-wide strategy."

> "Level 3 is highlighted — that's your target. This series takes you from wherever you are today to Builder level. Level 4 is the Advanced Series."

> "Self-assess silently: where are you right now? No judgment. It's a growth tool."

---

## Slide 17 (Chapter 05 Header): Guardrails for AI in QE

> "Final theory topic. AI without guardrails is like automation without assertions — it runs, it looks impressive, but you can't trust the results."

> "Trust equals Capability times Predictability times Boundaries. You need all three."

---

## Slide 18: The Three Zones of AI Trust

> "Think of AI activities in three zones."

> **[Click — Green]** "Green Zone: automate freely. Low risk, easily reversible. Test data generation, code formatting, report generation. Let AI run without review."

> **[Click — Yellow]** "Yellow Zone: human reviews. Medium risk. Test case generation, code suggestions, bug classification. AI generates, you validate before it enters the pipeline."

> **[Click — Red]** "Red Zone: human only. High risk, compliance-sensitive, accountability required. Security decisions, compliance sign-offs, release approvals, GDPR data handling. AI should NOT be involved here."

> "Question for discussion: what's in YOUR Red Zone right now? There's no wrong answer — it depends on your context."

> "GDPR reminder: all teams work with Norwegian/EU client data. Never paste client acceptance criteria or real user data into public AI tools without anonymization."

---

## Slide 19: Practical Exercise

> "Time to apply everything. Form your groups — 6 teams. You have 60 minutes total."

> "Task 1: 25 minutes — build your tool map. Map the AI tool landscape relevant to your practice. This becomes your team reference for the series."

> "Task 2: 20 minutes — write your micro-app spec. Choose an idea, write user stories with Given/When/Then acceptance criteria. This is what you'll build in Session 2."

> "Task 3: 10 minutes — feed your spec to AI. Evaluate what it generates. Keep, modify, or reject. Notice how spec quality affects output quality."

> "Debrief: 5 minutes — each group presents in under 1 minute. Tool map highlight, app concept, one insight."

> "Grab your handouts, form your groups, and let's go. Timer starts now."

---

## Slide 20: Closing

> "What a session. Here's what's coming next week in Session 2:"

> "Bring your spec — polished or rough, we're building from it. You'll turn your specification into a working micro-app using AI code generation, then write Playwright tests directly from your acceptance criteria."

> "Before next week: try at least one new AI tool from your tool map. Refine your spec if you can."

> "The Advanced Series — coming after Session 3 — is where we build custom AI agents. Agents tailored to your codebase, your test patterns, your definition of quality."

> "See you next week. Great work today everyone."

---

## Timing Guide

| Section | Duration | Cumulative |
|---------|----------|-----------|
| Title + Ground Rules + Agenda | 3 min | 3 min |
| Chapter 01: Three Levels (5 slides) | 8 min | 11 min |
| What AI Can/Cannot Do + Quiz | 8 min | 19 min |
| Chapter 02: Tool Categories + Tools vs Agents + Quiz | 10 min | 29 min |
| Chapter 03: Specs (3 slides) + Quiz | 12 min | 41 min |
| Chapter 04: Role Evolution (2 slides) | 6 min | 47 min |
| Chapter 05: Guardrails (1 slide) | 5 min | 52 min |
| Practical Exercise intro | 3 min | 55 min |
| **BREAK / TRANSITION** | 5 min | 60 min |
| Practical Exercise | 55 min | 115 min |
| Closing | 5 min | 120 min |
