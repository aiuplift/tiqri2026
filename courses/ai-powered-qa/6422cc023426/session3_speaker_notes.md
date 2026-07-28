# Session 3: Speaker Notes Script

**Process Improvement & Building an AI-Augmented QA Practice**  
**Date:** Monday, 28th July 2026 | 8:30–10:30 AM (IST)  
**Facilitator:** Dr. Chathuranga Manamendra

---

## Slide 1: Title

> "Welcome to our final session. Over the past two weeks you've built the foundation — tool maps, specs, working apps, and Playwright tests. Today we bring it all together: maturity assessment, guardrails, adoption roadmaps, and your final presentations."

> "By the end of today, every team will have a concrete plan they can execute on Monday morning."

---

## Slide 2: Agenda

> "Five theory topics focused on strategy and organizational change, then your final practical: complete your project, build an adoption roadmap, and present to the group."

---

## Slide 2B: Today's Mental Model — People, Process, Technology

> "Before we dive in, here's the lens for today's session. Sustainable AI adoption requires three pillars working together."

> **[Click — People]** "People: skills, growth paths, accountability, culture of learning. Without the right people skills, the best tools go unused."

> **[Click — Process]** "Process: guardrails, governance, review workflows, change management. Without process, AI generates chaos at scale."

> **[Click — Technology]** "Technology: AI tools, automation, CI/CD integration, platform choices. This is what most teams focus on first — but it's only one third of the picture."

> **[Click — bottom insight]** "Technology without process equals chaos. Process without people equals shelfware. You need all three. Today covers all three."

---

## Recap Quiz: Session 2 Review

> "Quick recall. Three questions on prompt engineering, evaluation, and the spec-to-test workflow."

> **[After quiz]** "Good. Those skills — effective prompting, critical evaluation, and traceability — are the tools you'll use to build your roadmap today."

---

## Slide 3 (Chapter 01): QA Maturity Assessment

> "Not every team is ready for the same level of AI integration. Let's be honest about where we are so we can identify the highest-ROI entry points."

---

## Slide 4: The QA Maturity Spectrum

> "Four levels. Level 1: Manual — ad-hoc testing, no standards, reactive. Level 2: Automated — scripted tests, CI integration, team standards. Level 3: AI-Augmented — AI assists human work, spec-driven, guardrails in place. Level 4: AI-Native — AI plans and executes, human sets goals only."

> "Most of you are between Level 2 and early Level 3. The Warehouse team with Copilot in their DoD is solidly Level 3. The Participant Management team using Jira-Xray without AI tools is Level 2. Both are valid starting points."

> "Key lesson: don't jump levels. AI works best when there's structure to augment. Chaos amplified by AI is still chaos."

---

## Slide 5: Matching AI to Maturity

> "Here's what to focus on based on where you are. Level 1 to 2: start with test case generation from specs and prompt templates. Don't try autonomous agents yet."

> "Level 2 to 3: AI-assisted test creation, defect triage, spec-driven workflows. This is where this series has been taking you."

> "Level 3 to 4: agent orchestration, CI/CD integration, self-healing. That's the Advanced Series."

---

## Slide 6 (Chapter 02): AI Skills for Quality Engineers

> "The skills that made a great QA engineer five years ago are necessary but no longer sufficient. Let's define what you need to add."

---

## Slide 7: The Expanded Skills Matrix

> "Six skill areas, four levels each. Prompt Engineering, Spec Writing, Tool Evaluation, Critical Validation, Agent Understanding, and Guardrail Thinking."

> "Take 2 minutes. Rate yourself 1-4 on each row. Be honest — this is your personal growth map."

> **[Pause 2 minutes]**

> "Where are you strongest? Where do you want to grow? This series has moved most of you from Consumer toward Builder level."

---

## Slide 7B: Self-Assessment Grid

> "Here's your personal scorecard. Six skill areas, four levels. Take 2 minutes — silently rate yourself on each row."

> **[Pause 2 minutes while they mentally assess]**

> "Look at your grid. Which row has the biggest gap between where you are and Builder level? That's your 30-day focus. One skill, one level up, 30 days. That's achievable."

---

## Slide 8 (Chapter 03): Building Guardrails

> "This is the most strategically important topic of the entire series. Guardrails separate successful adoption from dangerous over-reliance."

---

## Slide 9: The Guardrail Framework

> "Three zones again — but now with implementation detail. Automate Freely: test data, formatting, boilerplate, reports. Gate with Human Review: test generation, defect triage, spec review, code generation. Prohibit: security decisions, compliance sign-offs, risk acceptance, ethical choices."

> "For your organization specifically: property valuation figures, participant personal data, and warehouse customer configurations are PROHIBIT zone for public AI tools. But internal enterprise AI tools with data processing agreements may be in the GATE zone."

---

## Slide 10: Acceptance Criteria for AI Artifacts

> "Every AI-generated artifact entering your pipeline needs clear acceptance criteria. Generated tests: must map to spec item, have meaningful assertions, run reliably. Test data: must be realistic, cover boundaries, contain no PII. Defect reports: must be reproducible, accurate severity."

> "The principle: if you can't explain what an AI-generated test validates, don't commit it."

---

## Slide 11: The Accountability Model

> "Who owns AI-generated coverage? The person who approved it. Can we blame AI for a production incident? No — AI is a tool, humans are accountable."

> "Document AI involvement: `// AI-generated, reviewed by [name], [date]`. This creates audit trails for compliance."

---

## Slide 12 (Chapter 04): Change Management & Roadmap

> "Having skills and frameworks is necessary but not sufficient. You also need to navigate organizational dynamics."

---

## Slide 13: Building the Business Case

> "Five metrics your leadership cares about. Test creation time: 40-60% reduction expected. Defect escape rate: 15-25% reduction. Test coverage: +20-30%. Regression cycle time: 30-50% faster. Onboarding time: 25% reduction."

> "Frame these in YOUR context. The Warehouse team's 6-hour regression suite? AI-assisted test prioritization could cut that to under 2 hours. That's a concrete, measurable business case."

---

## Slide 14: The 30-60-90 Day Roadmap

> "Days 1-30: Quick Wins. AI-assisted test generation for one feature. Prompt templates shared with the team. Tool evaluation completed. Success metric: 3+ features tested with AI assistance."

> "Days 31-60: Workflow Integration. Spec-driven testing workflow adopted. Playwright + AI in daily pipeline. Team standards documented. Success: AI in daily workflow for test creation."

> "Days 61-90: Strategic Expansion. Guardrails documented. Multiple teams onboarded. Metrics tracking active. Success: measurable improvement in KPIs."

> "This framework gives you something concrete to take to your manager tomorrow."

---

## Slide 15 (Chapter 05): Governance & Responsible AI

> "Final theory topic. As a services company working with client data, this is especially critical for TIQRI."

---

## Slide 16: Data Privacy Rules

> "What can you share with AI tools? Open-source patterns, generic logic, synthetic data, anonymized descriptions. What you cannot share: proprietary client code, real customer data, PII, credentials, NDA-covered requirements, security vulnerabilities."

> "When in doubt: anonymize or synthesize. Never assume it's safe."

> "All teams work with Norwegian/EU client data via secure remote desktops. GDPR applies. This is non-negotiable."

---

## Slide 17: Practical Exercise

> "Final practical — three parts plus presentations."

> "Task 1: 20 minutes — complete your app to full test coverage. Use AI for gap analysis. Add boundary and edge case tests. Aim for 7-10 tests total."

> "Task 2: 15 minutes — build your AI adoption roadmap. Map your real QA process, identify 2-3 highest-value AI integration points, define guardrails for your top opportunity. Use the Effort vs. Impact matrix."

> "Task 3: 7 minutes — prep your final presentation. Demo structure: app demo, test run, tool map highlight, lessons learned, adoption roadmap."

> "Presentations: 15 minutes total — 2.5 minutes per group. Live demos encouraged."

---

## Final Presentations (Facilitator role)

> **[During presentations]** Note common themes. After all groups present:

> "Let me highlight what I noticed across all groups..."
> - Common patterns: what everyone identified as high-value
> - Shared challenges: where everyone struggled
> - Strongest ideas: 2-3 standout approaches to call out

---

## Slide 20A: The Formula — People, Process, Technology (Venn)

> "Before we close — let me bring it full circle."

> **[Click — People circle]** "People. You assessed your skills, built a growth path, defined accountability."

> **[Click — Process circle]** "Process. You designed guardrails, governance frameworks, review workflows."

> **[Click — Technology circle]** "Technology. You evaluated tools, built with AI, integrated into your pipeline."

> **[Click — center badge]** "The intersection — where all three overlap — that's AI-Augmented Quality. That's what you've been building across three sessions."

> **[Click — bottom]** "All three must evolve together. That's the takeaway."

---

## Closing: What's Next for You

> "What happens next: each team has a 30-60-90 day plan. Implement your top priority within 2 weeks. Let's schedule a 4-week check-in to review progress."

> "Keep building your prompt library. Pair across teams. Share what works."

> "The foundation you've built opens doors to deeper territory — custom agents, self-healing frameworks, CI/CD integration. When the team is ready to go deeper, the path is there."

> "Keep practicing — consistency beats intensity. Thank you all for three weeks of engagement. See you at the check-in."

---

## Timing Guide

| Section | Duration | Cumulative |
|---------|----------|-----------|
| Title + Agenda + Recap Quiz | 5 min | 5 min |
| Chapter 01: Maturity Assessment (2 slides) | 10 min | 15 min |
| Chapter 02: AI Skills (1 slide) | 8 min | 23 min |
| Chapter 03: Guardrails (3 slides) | 15 min | 38 min |
| Chapter 04: Business Case + Roadmap (2 slides) | 12 min | 50 min |
| Chapter 05: Governance (1 slide) | 5 min | 55 min |
| Practical intro | 3 min | 58 min |
| **TRANSITION** | 2 min | 60 min |
| Task 1: Complete & Polish | 20 min | 80 min |
| Task 2: Build Roadmap | 15 min | 95 min |
| Task 3: Prep Presentations | 7 min | 102 min |
| Final Presentations (6 groups × 2.5 min) | 15 min | 117 min |
| Closing & Series Wrap | 3 min | 120 min |
