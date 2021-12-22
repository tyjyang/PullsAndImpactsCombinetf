from collections import OrderedDict
import numpy as np

def readImpacts(rtfile, group, sort=True, scale=100, rounded=2):
    histname = "nuisance_group_impact_nois" if group else "nuisance_impact_nois"
    impactHist = rtfile[histname]
    impacts,binsx,binsy = impactHist.to_numpy()
    labels = np.array(impactHist.axis(1).labels())
    results = {label : round(impacts[0,i]*scale, rounded) for i,label in enumerate(labels)}
    if sort:
        order = np.argsort(impacts[0,:])
        results = OrderedDict([(l, results[l]) for l in labels[order]])
    return results

