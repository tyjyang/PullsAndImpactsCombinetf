# Setup
Setup the necessary environment with
```bash
python3 -m venv env
pip install -r requirements.txt
```
Then ```. ./env/bin/activate``` before running (needed every time you open a new session)

Running is most convenient from your local computer, using lxplus etc you would need to play with tunneling or open the browser from lxplus. 

For this, you could copy the fitresults_xxx.root file locally using cernbox.

Can run either interactive mode (via dash) or just run the script and write out an html/png/pdf etc

For arguments, see

```bash
python3 pullsAndImpacts.py --help
``` 
Some arguments are common to both modes, some are specific to the output mode

# Producing HTML/png/pdf output

```bash
python pullsAndImpacts.py -f ~/cernbox/CombineStudies/WGen/etal_ptl_smear_unrolled/fitresults_123456789.root output
```

for example

# Running interactively

Launch the server with, for example

```bash
 python pullsAndImpacts.py -f ~/cernbox/CombineStudies/WGen/etal_ptl_smear_unrolled/fitresults_123456789.root interactive
``` 

and direct your browser to localhost:3389
