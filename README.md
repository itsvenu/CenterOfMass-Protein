###CenterOfMass-Protein
Center of Mass of a protein is a point useful for detecting simple but important features of protein structure and 
shape. Using this COM (center of mass), we can predict the tertiary models of protein from known stuctures.
For e.g residues can be assigned as interior and surface residues based on distances from COM. 

The approximate distances from the COM for interior and surface residues are 7.5±5Å and 12±5Å respectively.

Study shows that on an average the active site residues are located closer to the COM than non binding surface 
residues.

#####Usage

    $ perl CenterOfMass.pl fileName.pdb > OutPut.txt

or

    $ chmod +x CenterOfMass.pl 

    $ ./CenterOfMass.pl fileName.pdb > OutPut.txt
