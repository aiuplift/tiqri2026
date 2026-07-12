# Slide Enhancement Checklist & Guardrails

**AI-Powered QA Training Series — Quality Standards for Session Decks**

Use this checklist after content generation for each session to ensure consistency, professionalism, and readability.

---

## 1. Visual Enhancement (Per Slide)

- [ ] Every slide has an **emoji icon** or visual element — no text-only slides
- [ ] Cards use **gradient backgrounds** or **subtle shadows** (not flat color blocks)
- [ ] Color-coded elements follow the system:
  - Blue (#2E86C1) = AI / tools / neutral
  - Mint/Teal (#48C9B0 / #1A7A6D) = target / goal / positive
  - Red (#E74C3C) = warning / limitation / advanced
  - Green (#1B8A6B / #27AE60) = good / approved
  - Amber (#F39C12) = caution / medium
- [ ] Before/after or comparison slides use **left/right layout** with contrasting backgrounds
- [ ] Process flows use **horizontal card strips** with connectors (› or →)
- [ ] Lists have **icon + title + description** structure (not plain bullets)
- [ ] Level/category badges use **colored pill or circle** format
- [ ] Top borders on cards signal category color

---

## 2. Typography & Readability

- [ ] **Minimum font sizes:**
  - Slide title: 24px
  - Card titles: 13px
  - Card descriptions: 12px
  - Stat numbers: 28px+
  - Source citations: 9–10px
  - Labels inside flow boxes: 13px
  - Body text inside cards: 12px
- [ ] No text below 10px anywhere in the deck
- [ ] Bold key terms within sentences
- [ ] Italic for sources, taglines, and examples
- [ ] Sufficient contrast (light text on dark bg, dark text on light bg)

---

## 3. Fragment/Animation Strategy

- [ ] Every content element uses `class="fragment"` for progressive reveal
- [ ] Build order is logical (top→bottom, left→right, or narrative order)
- [ ] Summary/CTA badges always appear LAST
- [ ] Chapter headers don't need fragments (they're transitions)
- [ ] Don't over-fragment — group related items if they make sense together

---

## 4. Tooltips

- [ ] All technical terms have `class="tip"` with `<span class="tip-content">...</span>`
- [ ] On dark backgrounds: inline style `border-bottom-color` and `color` matching the term color
- [ ] On light backgrounds: use `class="tip light-tip"`
- [ ] Tooltip content includes: definition + real example
- [ ] Verify tooltips work by hovering after deployment (JS overlay renders at element position)

---

## 5. Slide Structure Patterns

| Slide Type | Layout | Background |
|-----------|--------|-----------|
| Chapter header | Big number + title + subtitle + accent bar | Dark (#0D2137) |
| Stats/Impact | 3-column large numbers with source | Dark or Light |
| Comparison (Before/After) | 3-column: bad → arrow → good | Light (#F4F9FC) |
| Process flow | Horizontal flex cards with connectors | Dark |
| Principles/List | Cards or grid with icons + examples | Light |
| Categories/Grid | 2×3 or 3×2 grid with icon headers | Dark |
| Matrix/Table | Striped rows with highlighted column | Dark |
| Zones/Levels | Color-coded cards (green/yellow/red or blue/teal/red) | Dark |
| Exercise/Timeline | Grid with time badges left + content right | Light |
| Closing/CTA | Icon cards + teaser box + sign-off | Dark |
| Quiz | Single question + 3-4 options + explanation | Dark |
| Mentimeter | Solid accent background + join instructions | Mint (#48C9B0) |

---

## 6. Post-Generation Deliverables (Per Session)

For each session, produce ALL of the following:

| # | Deliverable | File | Description |
|---|------------|------|-------------|
| 1 | **HTML Slide Deck** | `session{N}_deck.html` | Reveal.js presentation, self-contained |
| 2 | **Speaker Notes Script** | `Artifacts/session{N}_speaker_notes.md` | Word-for-word facilitator script, per slide |
| 3 | **Exercise Answer Sheet** | `Artifacts/session{N}_exercise_answers.md` | Model answers for all practical tasks + quiz answers |
| 4 | **Slide count update** | In Reveal config | `return [h + ' / {TOTAL}']` matches actual `<section>` count |
| 5 | **Nav bar update** | `#session-nav` links | Slide indices match chapter positions |
| 6 | **Notes plugin loaded** | Reveal init | `import RevealNotes` + `plugins: [RevealNotes]` |

### Speaker Notes Requirements
- [ ] Covers every single slide (no gaps)
- [ ] Word-for-word script the facilitator can read aloud
- [ ] Includes `[Click — description]` cues for fragment animations
- [ ] Contains discussion prompts and audience engagement moments
- [ ] Notes live demo opportunities with step-by-step instructions
- [ ] Includes a timing guide table at the end (section → duration → cumulative)

### Exercise Answer Sheet Requirements
- [ ] Model answer for every task in the practical exercise
- [ ] Tool Map: at least 15 tools across all categories with value/complexity/agent evaluation
- [ ] Spec: full Given/When/Then with 3+ user stories, edge cases, and non-functional requirements
- [ ] AI Expansion: simulated AI output (20+ test scenarios) with Keep/Modify/Reject annotations
- [ ] Key insight documented (what did AI add vs miss)
- [ ] Quiz answer key with all questions, correct answers, and explanations
- [ ] Debrief talking points (expected patterns across groups)

---

## 7. Technical Verification

- [ ] `<section>` open count equals close count
- [ ] Reveal.js slide counter matches actual section count
- [ ] Navigation bar indices point to correct chapter slides
- [ ] RevealNotes plugin is imported and included in plugins array
- [ ] Tooltip JS runs after DOM load (at end of `<body>`)
- [ ] No unclosed HTML tags (check with: `grep -c "<section" file` vs `grep -c "</section>" file`)
- [ ] Keyboard hints are centered and fully visible

---

## 8. Content Quality Gates

- [ ] Every stat/number has a **source citation** (report name + year)
- [ ] Real-world examples reference **actual team context** (Warehouse, E-Commerce, Real Estate, etc.)
- [ ] Each theory slide has a **discussion prompt** or engagement moment in speaker notes
- [ ] Quiz questions directly test material from preceding 3-4 slides
- [ ] Exercise tasks connect theory concepts to practice (not disconnected busy-work)
- [ ] Closing slide previews next session with specific deliverables to bring

---

## 9. Accessibility & Presentation

- [ ] Color is not the ONLY differentiator (icons/text also distinguish items)
- [ ] Sufficient color contrast (test with squint test)
- [ ] Content fits within 1280×720 without overflow (check in fullscreen)
- [ ] No horizontal scroll required on any slide
- [ ] Fragments don't pile up causing content to overflow below viewport

---

## 10. Review Flow

```
Generate content → Enhance slides → Fix readability → 
Add tooltips → Verify fragments → Update nav/count → 
Test speaker notes (S key) → Create speaker script → 
Create exercise answers → Final HTML validation
```

---

## Quick Reference: Common Issues & Fixes

| Issue | Fix |
|-------|-----|
| Text too small in boxes | Minimum 12px for descriptions, 13px for labels |
| Tooltip not appearing | Check parent isn't `position:absolute`; verify JS overlay script |
| Slide count wrong in footer | Count `<section>` tags, update Reveal config |
| S key not working | Import RevealNotes plugin, add to plugins array |
| Nav links wrong after adding slides | Recount chapter positions, update `Reveal.slide(N)` |
| Content overflows slide | Reduce padding, use smaller grid gaps, or split into 2 slides |
| Colors not visible on dark bg | Use light variants (TL=#FFFFFF, TM=#A8C6D8, A=#48C9B0) |
| Keyboard hints cut off | Use `left:0;right:0;justify-content:center` |
