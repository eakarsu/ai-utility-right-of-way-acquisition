# Utility Right-of-Way Acquisition

Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts.

## Implemented records

- **Acquisition Project**: name, project Number, utility, corridor, jurisdiction, target At, status.
- **Acquisition Parcel**: name, parcel Number, owner Name, area Sq Meters, address, survey Reference, status.
- **Ownership Interest**: title, party, interest Type, share Percent, evidence, status.
- **Parcel Appraisal**: title, appraiser, valued At, amount Cents, basis, status.
- **Easement Offer**: title, offered At, amount Cents, terms, response Due At, status.
- **Negotiation Event**: title, occurred At, representative, notes, next Action, status.
- **Acquisition Agreement**: title, version, compensation Cents, terms, signature Evidence, status.
- **Recording Receipt**: title, recorder, document Number, recorded At, receipt, status.
- **Compensation Payment**: title, paid At, amount Cents, payee, receipt, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Deed interest extraction: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Appraisal comparison brief: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Negotiation preparation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Agreement clause gap review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Recording packet checklist: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Acquisition progress narrative: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Acquisition compensation budget: Reconcile approved commitments, payments and remaining corridor budget in integer minor units.
- Acquisition Project evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
