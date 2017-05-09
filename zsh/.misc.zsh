# Heasoft
export HEADAS=~/app/heasoft-6.21/x86_64-unknown-linux-gnu-libc2.25
alias heainit=". $HEADAS/headas-init.sh"

# XMM SAS
# alias sasinit=". /usr/local/SAS/xmmsas_20141104_1833/setsas.sh"

# CALDB
export CALDB=$HOME/app/caldb
export CALDBCONFIG=$CALDB/software/tools/caldb.config
export CALDBALIAS=$CALDB/software/tools/alias_config.fits

# CIAO
alias ciao="source $HOME/app/ciao-4.9/bin/ciao.bash"

# Miriad
alias miriadinit="source /usr/local/miriad/miriad_cvs/miriad_start.sh"

# GILDAS
export GAG_ROOT_DIR=$HOME/app/gildas-exe-feb17c
export GAG_EXEC_SYSTEM=x86_64-arch-gfortran
source $GAG_ROOT_DIR/etc/bash_profile

# CASA
alias casainit="export PATH=$PATH:$HOME/app/casa-release-4.7.2-el7/bin"

# xidl
alias xidl='source ~/bin/xrayidl.sh'
