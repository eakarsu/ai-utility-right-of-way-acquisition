// Deterministic domain insights over this app's own records. No provider call is made here.
export type InsightRow = Record<string, unknown>;
const TITLES: [string,string][] = [["Parcel & offer deadline queue", "Open records with a past due/target/response date; count is 0 when nothing is overdue."], ["Compensation exposure summary", "Sums amount/compensation fields on open records (0 when none) for budget review by a human."], ["Recording packet queue", "Records still in Draft/Open status that need recording/signature evidence review."]];
const num = (v: unknown) => { const n = Number(v); return Number.isFinite(n) ? n : 0; };
const amountOf = (r: InsightRow) => num(r.amount ?? r.amountCents ?? r.compensationCents ?? r.capacityLiters ?? 0);
const isOpen = (r: InsightRow) => !["Closed","Approved","Done","Cancelled","Recorded","Paid"].includes(String(r.status ?? "Open"));
const dateOf = (r: InsightRow) => String(r.dueAt ?? r.reviewAt ?? r.nextDueAt ?? r.targetAt ?? r.responseDueAt ?? r.expiresAt ?? "");
export function filterRecordsByStatus(rows: InsightRow[], status = "") { return status ? (rows||[]).filter(r => String(r.status ?? "") === status) : [...(rows||[])]; }
function make(kind: string, rows: InsightRow[], now: Date) {
  const open = rows.filter(isOpen); let hit: InsightRow[] = [];
  if (kind === "deadline") hit = open.filter(r => dateOf(r) && new Date(dateOf(r)) < now);
  else if (kind === "evidence") hit = open.filter(r => ["Draft","Open",""].includes(String(r.status ?? "")));
  else hit = open.filter(r => /exception|failed|overdue/i.test(String(r.status ?? "")) || amountOf(r) > 0);
  const idx = kind === "deadline" ? 0 : kind === "evidence" ? 1 : 2;
  return { title: TITLES[idx][0], detail: TITLES[idx][1], count: hit.length, totalValue: hit.reduce((s,r)=>s+amountOf(r),0), references: hit.slice(0,10).map(r=>String(r.name ?? r.title ?? r.reference ?? r.id)) };
}
export function buildDomainInsights(rows: InsightRow[], now = new Date()) {
  const list = rows || [];
  return { aiGenerated: false as const, source: "deterministic-fallback", label: "Deterministic fallback — not AI-generated", metrics: { records: list.length, open: list.filter(isOpen).length, totalValue: list.reduce((s,r)=>s+amountOf(r),0), overdue: make("deadline", list, now).count }, sections: [make("deadline", list, now), make("evidence", list, now), make("watch", list, now)] };
}
