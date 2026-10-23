import { NextRequest } from "next/server";
import { authorize } from "@/lib/api-auth";
import { prisma } from "@/lib/prisma";
import { records, errorResponse } from "@/lib/record-store";
import { buildDomainInsights } from "@/lib/domain-ai";
export const dynamic = "force-dynamic";
// Deterministic fallback over own records only; never calls a provider.
export async function POST(request: NextRequest) { try { await authorize(); const body = await request.json().catch(() => ({})) as { entity?: string }; const rows = await records(prisma, String(body.entity || "")).findMany({ orderBy: [{ createdAt: "desc" }], take: 200 }); return Response.json(buildDomainInsights(rows as Record<string, unknown>[])); } catch (e) { return errorResponse(e); } }
