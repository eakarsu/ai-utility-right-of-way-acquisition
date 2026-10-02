-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AcquisitionProject" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "projectNumber" TEXT NOT NULL,
    "utility" TEXT NOT NULL,
    "corridor" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "targetAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AcquisitionProject_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AcquisitionParcel" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "parcelNumber" TEXT NOT NULL,
    "ownerName" TEXT NOT NULL,
    "areaSqMeters" DOUBLE PRECISION NOT NULL,
    "address" TEXT NOT NULL,
    "surveyReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "acquisitionProjectId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AcquisitionParcel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OwnershipInterest" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "acquisitionParcelId" TEXT NOT NULL,
    "party" TEXT NOT NULL,
    "interestType" TEXT NOT NULL,
    "sharePercent" DOUBLE PRECISION NOT NULL,
    "evidence" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "acquisitionProjectId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OwnershipInterest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ParcelAppraisal" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "acquisitionParcelId" TEXT NOT NULL,
    "appraiser" TEXT NOT NULL,
    "valuedAt" TIMESTAMP(3) NOT NULL,
    "amountCents" INTEGER NOT NULL,
    "basis" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "acquisitionProjectId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ParcelAppraisal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EasementOffer" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "acquisitionParcelId" TEXT NOT NULL,
    "offeredAt" TIMESTAMP(3) NOT NULL,
    "amountCents" INTEGER NOT NULL,
    "terms" TEXT NOT NULL,
    "responseDueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "acquisitionProjectId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EasementOffer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NegotiationEvent" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "acquisitionParcelId" TEXT NOT NULL,
    "occurredAt" TIMESTAMP(3) NOT NULL,
    "representative" TEXT NOT NULL,
    "notes" TEXT NOT NULL,
    "nextAction" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "acquisitionProjectId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NegotiationEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AcquisitionAgreement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "acquisitionParcelId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "compensationCents" INTEGER NOT NULL,
    "terms" TEXT NOT NULL,
    "signatureEvidence" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "acquisitionProjectId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AcquisitionAgreement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordingReceipt" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "acquisitionParcelId" TEXT NOT NULL,
    "recorder" TEXT NOT NULL,
    "documentNumber" TEXT NOT NULL,
    "recordedAt" TIMESTAMP(3) NOT NULL,
    "receipt" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "acquisitionProjectId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RecordingReceipt_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompensationPayment" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "acquisitionParcelId" TEXT NOT NULL,
    "paidAt" TIMESTAMP(3) NOT NULL,
    "amountCents" INTEGER NOT NULL,
    "payee" TEXT NOT NULL,
    "receipt" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "acquisitionProjectId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CompensationPayment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "acquisitionProjectId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "acquisitionProjectId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "acquisitionProjectId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "AcquisitionProject_createdAt_idx" ON "AcquisitionProject"("createdAt");

-- CreateIndex
CREATE INDEX "AcquisitionParcel_createdAt_idx" ON "AcquisitionParcel"("createdAt");

-- CreateIndex
CREATE INDEX "AcquisitionParcel_acquisitionProjectId_idx" ON "AcquisitionParcel"("acquisitionProjectId");

-- CreateIndex
CREATE INDEX "OwnershipInterest_createdAt_idx" ON "OwnershipInterest"("createdAt");

-- CreateIndex
CREATE INDEX "OwnershipInterest_acquisitionProjectId_idx" ON "OwnershipInterest"("acquisitionProjectId");

-- CreateIndex
CREATE INDEX "ParcelAppraisal_createdAt_idx" ON "ParcelAppraisal"("createdAt");

-- CreateIndex
CREATE INDEX "ParcelAppraisal_acquisitionProjectId_idx" ON "ParcelAppraisal"("acquisitionProjectId");

-- CreateIndex
CREATE INDEX "EasementOffer_createdAt_idx" ON "EasementOffer"("createdAt");

-- CreateIndex
CREATE INDEX "EasementOffer_acquisitionProjectId_idx" ON "EasementOffer"("acquisitionProjectId");

-- CreateIndex
CREATE INDEX "NegotiationEvent_createdAt_idx" ON "NegotiationEvent"("createdAt");

-- CreateIndex
CREATE INDEX "NegotiationEvent_acquisitionProjectId_idx" ON "NegotiationEvent"("acquisitionProjectId");

-- CreateIndex
CREATE INDEX "AcquisitionAgreement_createdAt_idx" ON "AcquisitionAgreement"("createdAt");

-- CreateIndex
CREATE INDEX "AcquisitionAgreement_acquisitionProjectId_idx" ON "AcquisitionAgreement"("acquisitionProjectId");

-- CreateIndex
CREATE INDEX "RecordingReceipt_createdAt_idx" ON "RecordingReceipt"("createdAt");

-- CreateIndex
CREATE INDEX "RecordingReceipt_acquisitionProjectId_idx" ON "RecordingReceipt"("acquisitionProjectId");

-- CreateIndex
CREATE INDEX "CompensationPayment_createdAt_idx" ON "CompensationPayment"("createdAt");

-- CreateIndex
CREATE INDEX "CompensationPayment_acquisitionProjectId_idx" ON "CompensationPayment"("acquisitionProjectId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_acquisitionProjectId_idx" ON "OperationalTask"("acquisitionProjectId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_acquisitionProjectId_idx" ON "RuleVersion"("acquisitionProjectId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_acquisitionProjectId_idx" ON "DocumentRequirement"("acquisitionProjectId");

-- AddForeignKey
ALTER TABLE "AcquisitionParcel" ADD CONSTRAINT "AcquisitionParcel_acquisitionProjectId_fkey" FOREIGN KEY ("acquisitionProjectId") REFERENCES "AcquisitionProject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OwnershipInterest" ADD CONSTRAINT "OwnershipInterest_acquisitionParcelId_fkey" FOREIGN KEY ("acquisitionParcelId") REFERENCES "AcquisitionParcel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OwnershipInterest" ADD CONSTRAINT "OwnershipInterest_acquisitionProjectId_fkey" FOREIGN KEY ("acquisitionProjectId") REFERENCES "AcquisitionProject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ParcelAppraisal" ADD CONSTRAINT "ParcelAppraisal_acquisitionParcelId_fkey" FOREIGN KEY ("acquisitionParcelId") REFERENCES "AcquisitionParcel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ParcelAppraisal" ADD CONSTRAINT "ParcelAppraisal_acquisitionProjectId_fkey" FOREIGN KEY ("acquisitionProjectId") REFERENCES "AcquisitionProject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EasementOffer" ADD CONSTRAINT "EasementOffer_acquisitionParcelId_fkey" FOREIGN KEY ("acquisitionParcelId") REFERENCES "AcquisitionParcel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EasementOffer" ADD CONSTRAINT "EasementOffer_acquisitionProjectId_fkey" FOREIGN KEY ("acquisitionProjectId") REFERENCES "AcquisitionProject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NegotiationEvent" ADD CONSTRAINT "NegotiationEvent_acquisitionParcelId_fkey" FOREIGN KEY ("acquisitionParcelId") REFERENCES "AcquisitionParcel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NegotiationEvent" ADD CONSTRAINT "NegotiationEvent_acquisitionProjectId_fkey" FOREIGN KEY ("acquisitionProjectId") REFERENCES "AcquisitionProject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AcquisitionAgreement" ADD CONSTRAINT "AcquisitionAgreement_acquisitionParcelId_fkey" FOREIGN KEY ("acquisitionParcelId") REFERENCES "AcquisitionParcel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AcquisitionAgreement" ADD CONSTRAINT "AcquisitionAgreement_acquisitionProjectId_fkey" FOREIGN KEY ("acquisitionProjectId") REFERENCES "AcquisitionProject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecordingReceipt" ADD CONSTRAINT "RecordingReceipt_acquisitionParcelId_fkey" FOREIGN KEY ("acquisitionParcelId") REFERENCES "AcquisitionParcel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecordingReceipt" ADD CONSTRAINT "RecordingReceipt_acquisitionProjectId_fkey" FOREIGN KEY ("acquisitionProjectId") REFERENCES "AcquisitionProject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompensationPayment" ADD CONSTRAINT "CompensationPayment_acquisitionParcelId_fkey" FOREIGN KEY ("acquisitionParcelId") REFERENCES "AcquisitionParcel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompensationPayment" ADD CONSTRAINT "CompensationPayment_acquisitionProjectId_fkey" FOREIGN KEY ("acquisitionProjectId") REFERENCES "AcquisitionProject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_acquisitionProjectId_fkey" FOREIGN KEY ("acquisitionProjectId") REFERENCES "AcquisitionProject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_acquisitionProjectId_fkey" FOREIGN KEY ("acquisitionProjectId") REFERENCES "AcquisitionProject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_acquisitionProjectId_fkey" FOREIGN KEY ("acquisitionProjectId") REFERENCES "AcquisitionProject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

