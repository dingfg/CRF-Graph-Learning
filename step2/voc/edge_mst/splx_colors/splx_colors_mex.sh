MATLAB="/usr/local/MATLAB/R2011a"
Arch=glnxa64
ENTRYPOINT=mexFunction
MAPFILE=$ENTRYPOINT'.map'
PREFDIR="/home/ccadena/.matlab/R2011a"
OPTSFILE_NAME="./mexopts.sh"
. $OPTSFILE_NAME
COMPILER=$CC
. $OPTSFILE_NAME
echo "# Make settings for splx_colors" > splx_colors_mex.mki
echo "CC=$CC" >> splx_colors_mex.mki
echo "CFLAGS=$CFLAGS" >> splx_colors_mex.mki
echo "CLIBS=$CLIBS" >> splx_colors_mex.mki
echo "COPTIMFLAGS=$COPTIMFLAGS" >> splx_colors_mex.mki
echo "CDEBUGFLAGS=$CDEBUGFLAGS" >> splx_colors_mex.mki
echo "CXX=$CXX" >> splx_colors_mex.mki
echo "CXXFLAGS=$CXXFLAGS" >> splx_colors_mex.mki
echo "CXXLIBS=$CXXLIBS" >> splx_colors_mex.mki
echo "CXXOPTIMFLAGS=$CXXOPTIMFLAGS" >> splx_colors_mex.mki
echo "CXXDEBUGFLAGS=$CXXDEBUGFLAGS" >> splx_colors_mex.mki
echo "LD=$LD" >> splx_colors_mex.mki
echo "LDFLAGS=$LDFLAGS" >> splx_colors_mex.mki
echo "LDOPTIMFLAGS=$LDOPTIMFLAGS" >> splx_colors_mex.mki
echo "LDDEBUGFLAGS=$LDDEBUGFLAGS" >> splx_colors_mex.mki
echo "Arch=$Arch" >> splx_colors_mex.mki
echo OMPFLAGS= >> splx_colors_mex.mki
echo OMPLINKFLAGS= >> splx_colors_mex.mki
echo "EMC_COMPILER=unix" >> splx_colors_mex.mki
echo "EMC_CONFIG=debug" >> splx_colors_mex.mki
"/usr/local/MATLAB/R2011a/bin/glnxa64/gmake" -B -f splx_colors_mex.mk
