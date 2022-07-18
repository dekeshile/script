from biobb_model.model.fix_side_chain import FixSideChain
#from biobb_structure_checking import structure_checking
#from biobb_model.model.fix_backbone import FixBackbone

atom_dir = '/home/wurp/workspace/antibody/variant/Omicron/7QNW-EY6A/'
outputs_dir = '/home/wurp/workspace/antibody/variant/Omicron/7QNW-EY6A/'

pdbCode = 'renum'
origin_pdb = pdbCode + '.pdb'

# Create and launch bb
# print('fixing backbone -----------------')
prop = {'restart': False}
# FixBackbone(input_pdb_path=atom_dir + origin_pdb,
#             input_fasta_canonical_sequence_path=atom_dir + 'rcsb_pdb_7KGK.fasta',
#             output_pdb_path=outputs_dir + pdbCode + '_backbone_fixed.pdb',
#             properties=prop).launch()

print('fixing side chain -----------------')


FixSideChain(input_pdb_path=atom_dir + origin_pdb,output_pdb_path=outputs_dir + pdbCode + '_side_fixed.pdb',properties=prop).launch()


# python3 /home/wurp/workspace/antibody/script/tools/fixMissingAtom.py



