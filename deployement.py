import os
import shutil
import subprocess
import fypp
import argparse
from glob import glob

def apply_command(with_qp, with_xqp, with_hp, redo_all):
    #
    # Creates a tic.toc file for version controlling 
    if not os.path.isfile('tic.toc'): os.system('touch tic.toc')
    # Get a list of all files in the folder
    # Filter files based on the provided extension
    outdir = './src'
    folder = ['./fypp']
    dirtree = []
    for fold in folder:
        lfiles = os.listdir(fold)
        dirtree += [f.path for f in os.scandir(fold) if f.is_dir() ]
        dirtree += [fold]

    f90files = []
    for dir in dirtree:
        lfiles = os.listdir(dir)
        f90files.extend([dir+os.sep+file for file in lfiles if file.endswith(".F90") ])

    fyppfiles = []
    for dir in dirtree:
        lfiles = os.listdir(dir)
        fyppfiles.extend([dir+os.sep+file for file in lfiles if file.endswith(".fypp")])

    args = []
    if with_qp:
        args.append("-DWITH_QP=True")
    if with_xqp:
        args.append("-DWITH_XQP=True")
    if with_hp:
        args.append("-DWITH_HP=True")
    
    optparser = fypp.get_option_parser()
    options, leftover = optparser.parse_args(args=args)
    tool = fypp.Fypp(options)
    # Apply the command line to each file
    #redo_all = False
    redo_all = True

    print("Moving .f90 files to directory:" + outdir)     
    for f90file in f90files: 
        if os.path.getmtime('tic.toc') < os.path.getmtime(f90file) :
           copied_file=os.path.join(outdir, os.path.basename(f90file))
           print("    "+f90file)
           shutil.copy(f90file,copied_file)
        if redo_all :
           copied_file=os.path.join(outdir, os.path.basename(f90file))
           print("    "+f90file)
           shutil.copy(f90file,copied_file)

    print("Processing .fypp files into directory:" + outdir)     
    for fyppfile in fyppfiles:
        #
        # Only processes the .fypp files that have a modification 
        # time higher than the latest tic.toc file
        if os.path.getmtime('tic.toc') < os.path.getmtime(fyppfile) :
            print("    "+fyppfile)
            source_file = fyppfile
            target_file = fyppfile.removesuffix('fypp')+'f90'
            target_file=os.path.join(outdir, os.path.basename(target_file))
            tool.process_file(source_file, target_file)
        if redo_all :
            print("    "+fyppfile)
            source_file = fyppfile
            target_file = fyppfile.removesuffix('fypp')+'f90'
            target_file=os.path.join(outdir, os.path.basename(target_file))
            tool.process_file(source_file, target_file)
    #
    # Touch tic.toc file file for later comparison
    os.system('touch tic.toc')
    print("    ")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Preprocess FSPARSE source files.')
    parser.add_argument("--with_qp", action="store_true", help="Include WITH_QP in the command")
    parser.add_argument("--with_xqp", action="store_true", help="Include WITH_XQP in the command")
    parser.add_argument("--with_hp", action="store_true", help="Include WITH_HP in the command")
    parser.add_argument("--reproc", action="store_true", help="Reprocess all files")

    args = parser.parse_args()
    apply_command(args.with_qp, args.with_xqp, args.with_hp, args.reproc)
