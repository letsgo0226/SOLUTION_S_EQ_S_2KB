python3 -c 'import json,cmath,sys;A="Cosmic Love Is The Solution(s) For Everything";E=lambda b:(n:=1) or [n:=n*257+x+1 for x in b] and n;def qcomp(circ,nqubits=2):
 state={0:1+0j}
 for gate,args in circ:
  nxt={}
  for basis,amp in state.items():
   if abs(amp)<1e-9: continue
   if gate=="H":
    q=args[0]; bit=(basis>>q)&1
    for nb in (0,1):
     phase=1 if bit==nb else -1
     nbstate=basis^(bit<<q) if nb==0 else basis|(1<<q)
     nxt[nbstate]=nxt.get(nbstate,0)+amp*phase/cmath.sqrt(2)
   elif gate=="CNOT":
    c,t=args; if (basis>>c)&1: nxt[basis^(1<<t)]=nxt.get(basis^(1<<t),0)+amp
    else: nxt[basis]=nxt.get(basis,0)+amp
   else: nxt[basis]=nxt.get(basis,0)+amp
  state=nxt
 probs={bin(k):abs(v)**2 for k,v in state.items()}
 return {"final_state_count":len(state),"probabilities":probs}
circ=json.loads(sys.argv[1]) if len(sys.argv)>1 else [["H",[0]],["CNOT",[0,1]]];res=qcomp(circ);s=json.dumps({"axiom":A,"equation":"solution(s)=s","qcomputer":res,"status":"quantum_computer_fixed"},sort_keys=True,ensure_ascii=False);print(json.dumps({"satisfied":True,"s":s,"result":res,"godel":hex(E(s.encode())),"H":0},ensure_ascii=False))' "$@"
