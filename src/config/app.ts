export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-utility-right-of-way-acquisition",
  "title": "Utility Right-of-Way Acquisition",
  "tagline": "Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts.",
    "entities": [
      "AcquisitionProject",
      "AcquisitionParcel",
      "OwnershipInterest"
    ],
    "workflows": [
      "deed-interest-extraction",
      "appraisal-comparison-brief"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts.",
    "entities": [
      "ParcelAppraisal",
      "EasementOffer",
      "NegotiationEvent"
    ],
    "workflows": [
      "negotiation-preparation",
      "agreement-clause-gap-review"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts.",
    "entities": [
      "AcquisitionAgreement",
      "RecordingReceipt",
      "CompensationPayment"
    ],
    "workflows": [
      "recording-packet-checklist",
      "acquisition-progress-narrative"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "AcquisitionProject": {
    "name": "AcquisitionProject",
    "label": "Acquisition Project",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "projectNumber",
        "kind": "string"
      },
      {
        "name": "utility",
        "kind": "string"
      },
      {
        "name": "corridor",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "targetAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "AcquisitionParcel": {
    "name": "AcquisitionParcel",
    "label": "Acquisition Parcel",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "parcelNumber",
        "kind": "string"
      },
      {
        "name": "ownerName",
        "kind": "string"
      },
      {
        "name": "areaSqMeters",
        "kind": "number"
      },
      {
        "name": "address",
        "kind": "string"
      },
      {
        "name": "surveyReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "acquisitionProjectId",
        "kind": "string"
      }
    ]
  },
  "OwnershipInterest": {
    "name": "OwnershipInterest",
    "label": "Ownership Interest",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "acquisitionParcelId",
        "kind": "string"
      },
      {
        "name": "party",
        "kind": "string"
      },
      {
        "name": "interestType",
        "kind": "string"
      },
      {
        "name": "sharePercent",
        "kind": "number"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "acquisitionProjectId",
        "kind": "string"
      }
    ]
  },
  "ParcelAppraisal": {
    "name": "ParcelAppraisal",
    "label": "Parcel Appraisal",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "acquisitionParcelId",
        "kind": "string"
      },
      {
        "name": "appraiser",
        "kind": "string"
      },
      {
        "name": "valuedAt",
        "kind": "date"
      },
      {
        "name": "amountCents",
        "kind": "number"
      },
      {
        "name": "basis",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "acquisitionProjectId",
        "kind": "string"
      }
    ]
  },
  "EasementOffer": {
    "name": "EasementOffer",
    "label": "Easement Offer",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "acquisitionParcelId",
        "kind": "string"
      },
      {
        "name": "offeredAt",
        "kind": "date"
      },
      {
        "name": "amountCents",
        "kind": "number"
      },
      {
        "name": "terms",
        "kind": "string"
      },
      {
        "name": "responseDueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "acquisitionProjectId",
        "kind": "string"
      }
    ]
  },
  "NegotiationEvent": {
    "name": "NegotiationEvent",
    "label": "Negotiation Event",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "acquisitionParcelId",
        "kind": "string"
      },
      {
        "name": "occurredAt",
        "kind": "date"
      },
      {
        "name": "representative",
        "kind": "string"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "nextAction",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "acquisitionProjectId",
        "kind": "string"
      }
    ]
  },
  "AcquisitionAgreement": {
    "name": "AcquisitionAgreement",
    "label": "Acquisition Agreement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "acquisitionParcelId",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "compensationCents",
        "kind": "number"
      },
      {
        "name": "terms",
        "kind": "string"
      },
      {
        "name": "signatureEvidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "acquisitionProjectId",
        "kind": "string"
      }
    ]
  },
  "RecordingReceipt": {
    "name": "RecordingReceipt",
    "label": "Recording Receipt",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "acquisitionParcelId",
        "kind": "string"
      },
      {
        "name": "recorder",
        "kind": "string"
      },
      {
        "name": "documentNumber",
        "kind": "string"
      },
      {
        "name": "recordedAt",
        "kind": "date"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "acquisitionProjectId",
        "kind": "string"
      }
    ]
  },
  "CompensationPayment": {
    "name": "CompensationPayment",
    "label": "Compensation Payment",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "acquisitionParcelId",
        "kind": "string"
      },
      {
        "name": "paidAt",
        "kind": "date"
      },
      {
        "name": "amountCents",
        "kind": "number"
      },
      {
        "name": "payee",
        "kind": "string"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "acquisitionProjectId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "acquisitionProjectId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "acquisitionProjectId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "acquisitionProjectId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "deed-interest-extraction",
    "title": "Deed interest extraction",
    "description": "Deed interest extraction using selected acquisition project records and supplied evidence.",
    "prompt": "Deed interest extraction for Utility Right-of-Way Acquisition. Operational scope: Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts. Specific AI scope: Extract deed terms and organize negotiation/document gaps. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "appraisal-comparison-brief",
    "title": "Appraisal comparison brief",
    "description": "Appraisal comparison brief using selected acquisition project records and supplied evidence.",
    "prompt": "Appraisal comparison brief for Utility Right-of-Way Acquisition. Operational scope: Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts. Specific AI scope: Extract deed terms and organize negotiation/document gaps. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "negotiation-preparation",
    "title": "Negotiation preparation",
    "description": "Negotiation preparation using selected acquisition project records and supplied evidence.",
    "prompt": "Negotiation preparation for Utility Right-of-Way Acquisition. Operational scope: Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts. Specific AI scope: Extract deed terms and organize negotiation/document gaps. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "agreement-clause-gap-review",
    "title": "Agreement clause gap review",
    "description": "Agreement clause gap review using selected acquisition project records and supplied evidence.",
    "prompt": "Agreement clause gap review for Utility Right-of-Way Acquisition. Operational scope: Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts. Specific AI scope: Extract deed terms and organize negotiation/document gaps. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "recording-packet-checklist",
    "title": "Recording packet checklist",
    "description": "Recording packet checklist using selected acquisition project records and supplied evidence.",
    "prompt": "Recording packet checklist for Utility Right-of-Way Acquisition. Operational scope: Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts. Specific AI scope: Extract deed terms and organize negotiation/document gaps. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "acquisition-progress-narrative",
    "title": "Acquisition progress narrative",
    "description": "Acquisition progress narrative using selected acquisition project records and supplied evidence.",
    "prompt": "Acquisition progress narrative for Utility Right-of-Way Acquisition. Operational scope: Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts. Specific AI scope: Extract deed terms and organize negotiation/document gaps. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected acquisition project records and supplied evidence.",
    "prompt": "Evidence completeness review for Utility Right-of-Way Acquisition. Operational scope: Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts. Specific AI scope: Extract deed terms and organize negotiation/document gaps. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected acquisition project records and supplied evidence.",
    "prompt": "Operations handoff draft for Utility Right-of-Way Acquisition. Operational scope: Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts. Specific AI scope: Extract deed terms and organize negotiation/document gaps. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
