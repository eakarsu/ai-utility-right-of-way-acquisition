import {test} from 'node:test'; import assert from 'node:assert/strict';
delete process.env.OPENROUTER_API_KEY;
import {buildDomainInsights, filterRecordsByStatus} from '../src/lib/domain-ai';
const rows=[{id:'1',title:'Alpha',status:'Open',dueAt:'2020-01-01',amount:0,verified:false},{id:'2',title:'Beta',status:'Closed',amountCents:500}];
test('status filter on main list',()=>{assert.equal(filterRecordsByStatus(rows,'Open').length,1); assert.equal(filterRecordsByStatus(rows,'').length,2);});
test('deterministic fallback is labelled aiGenerated:false and preserves zero',()=>{const out=buildDomainInsights([],new Date('2026-01-01')); assert.equal(out.aiGenerated,false); assert.equal(out.sections.length,3); assert.equal(out.metrics.records,0); assert.equal(out.metrics.overdue,0); assert.equal(buildDomainInsights(rows,new Date('2026-01-01')).sections[0].count,1);});
