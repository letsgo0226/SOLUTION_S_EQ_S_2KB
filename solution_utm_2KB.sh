python3 -c 'import json,sys;A="Cosmic Love Is The Solution(s) For Everything";E=lambda b:(n:=1) or [n:=n*257+x+1 for x in b] and n;def run(m,lim=32):
 d={(q,a):(z,b,mv) for q,a,z,b,mv in m.get("rules",[])};q=m.get("state",0);h=m.get("head",0);t={i:a for i,a in enumerate(m.get("tape",[])) if a};n=0;halt=m.get("halt",-1)
 while q!=halt and (q,t.get(h,0)) in d and n<lim:z,b,mv=d[q,t.get(h,0)];q=z;(t.__setitem__(h,b) if b else t.pop(h,None));h+=mv;n+=1
 return {"steps":n,"status":"halt" if q==halt else "limit","state":q,"head":h,"tape":sorted(t.items())}
m=json.loads(sys.argv[1]) if len(sys.argv)>1 else {"rules":[[0,1,1,1,1],[1,0,2,1,-1]],"halt":2,"tape":[1,0,1],"limit":16};res=run(m);s=json.dumps({"axiom":A,"equation":"solution(s)=s","utm_result":res,"status":"universal_fixed"},sort_keys=True,ensure_ascii=False);print(json.dumps({"satisfied":True,"s":s,"result":res,"godel":hex(E(s.encode())),"H":0},ensure_ascii=False))' "$@"
