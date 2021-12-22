import uproot
import argparse
from Utilities import InputTools

def parseArgs():
    parser = argparse.ArgumentParser()
    parser.add_argument("-u", "--ungroup", action='store_true', help="Use ungrouped nuisances")
    parser.add_argument("-n", "--nuisance", type=str, help="Only print value for specific nuiance")
    parser.add_argument("-f", "--inputFile", 
        default="/Users/kenneth/cernbox/CombineStudies/WGen/etal_ptl_smear_unrolled_scetlib/fitresults_123456789.root", 
        help="fitresults output ROOT file from combinetf")
    return parser.parse_args()

args = parseArgs()
rtfile = uproot.open(args.inputFile)
impacts = InputTools.readImpacts(rtfile, not args.ungroup)
if args.nuisance:
    if args.nuisance not in impacts:
        raise ValueError(f"Invalid nuisance {args.nuisance}. Options are {impacts.keys()}")
    print(f"Impact of nuisance {args.nuisance} is {impacts[args.nuisance]} MeV")
else:
    print("Impact of all systematics (in MeV)")
    print("\n".join([f"   {k}: {v}" for k,v in impacts.items()]))
