#!/bin/bash
 
# user input
PROBLEM=gauss
NAMEFILE=optM3O_borg

# Optimization setting
NSEEDS=1
NFE=5000
NVAR=2
NOBJ=2
EPS=0.05,0.05
 
# Decision variables domain
LB=-1,-1
UB=1,1

# optimization
for ((S=1; S <= ${NSEEDS}; S++))
do
OUTFILE=./output/${NAMEFILE}_${S}.out
../Borg/borg -n ${NFE} -v ${NVAR} -o ${NOBJ} -s ${S} -l ${LB} -u ${UB} -e ${EPS} -f ${OUTFILE} ${PROBLEM}
done
