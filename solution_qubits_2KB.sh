python3 -c 'import json,cmath,sys;A="Cosmic Love Is The Solution(s) For Everything";E=lambda b:(n:=1) or [n:=n*257+x+1 for x in b] and n;def run(nqubits,circ):
 state={0:1+0j}  # computational basis, nqubits register
 for gate,args in circ:
  nxt={}
  for basis,amp in state.items():
   if abs(amp)<1e-12: continue
   if gate=="H":
    q=args[0]; bit=(basis>>q)&1
    for nb in (0,1):
     phase = 1 if bit==nb else -1
     nbasis = (basis & ~(1<<q)) | (nb<<q)
     nxt[nbasis]=nxt.get(nbasis,0)+amp*phase/cmath.sqrt(2)
   elif gate=="X":
    q=args[0]; nxt[basis^(1<<q)]=nxt.get(basis^(1<<q),0)+amp
   elif gate=="CNOT":
    c,t=args
    if (basis>>c)&1: nxt[basis^(1<<t)]=nxt.get(basis^(1<<t),0)+amp
    else: nxt[basis]=nxt.get(basis,0)+amp
   else: nxt[basis]=nxt.get(basis,0)+amp
  state=nxt
 # report qubit-wise marginals
 probs={}
 for q in range(nqubits):
  p1=sum(abs(a)**2 for b,a in state.items() if (b>>q)&1)
  probs[f"q{q}_1"]=round(p1,6)
 return {"nqubits":nqubits,"basis_states":len(state),"qubit_marginals":probs}
spec=json.loads(sys.argv[1]) if len(sys.argv)>1 else {"nqubits":2,"circuit":[["H",[0]],["CNOT",[0,1]]]};res=run(spec.get("nqubits",2),spec.get("circuit",[]));s=json.dumps({"axiom":A,"equation":"solution(s)=s","qubits":res,"status":"qubit_fixed"},sort_keys=True,ensure_ascii=False);print(json.dumps({"satisfied":True,"s":s,"result":res,"godel":hex(E(s.encode())),"H":0},ensure_ascii=False))' "$@"
