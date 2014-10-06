m4_include(inst.m4)m4_dnl
\documentclass[twoside]{artikel3}
\pagestyle{headings}
\usepackage{pdfswitch}
\usepackage{figlatex}
\usepackage{makeidx}
\renewcommand{\indexname}{General index}
\makeindex
\newcommand{\thedoctitle}{m4_doctitle}
\newcommand{\theauthor}{m4_author}
\newcommand{\thesubject}{m4_subject}
\newcommand{\CLTL}{\textsc{cltl}}
\newcommand{\NAF}{\textsc{naf}}
\title{\thedoctitle}
\author{\theauthor}
\date{m4_docdate}
m4_include(texinclusions.m4)m4_dnl
\begin{document}
\maketitle
\begin{abstract}
  This is a description and documentation of the installation of the current NLP
  modules on Lisa, so that they can be used in pipelines.
\end{abstract}
\tableofcontents

\section{Introduction}
\label{sec:Introduction}

This document describes the current set-up of pipeline that annotates
dutch texts in order to extract knowledge. The pipeline has been set
up by the Computational Lexicology an Terminology Lab
(\CLTL{}~\footnote{\url{http://wordpress.let.vupr.nl}}) as part
of the newsreader~\footnote{http://www.newsreader-project.eu}. 

Apart from describing the pipeline set-up, the document actually constructs
the pipeline. The described version has been made with an aim to run
it on a specific supercomputer (Lisa, Surfsara,
Amsterdam~\footnote{https://surfsara.nl/systems/lisa}), but it can
probably be implemented on other unix-like systems without problems.

The installation has been parameterized. The locations and names that
you read (and that will be used to build the pipeline) have been read
from variables in file \texttt{inst.m4} in the nuweb directory.  


\subsection{List of the modules to be installed}

Table~\ref{tab:modulelist}
\begin{table}[hbtp]
  \centering
  \begin{footnotesize}
    \begin{tabular}{lllll}
     \textbf{module}      & \textbf{directory} & \textbf{source} & \textbf{script} & \textbf{Details} \\
       Tokenizer          & \verb|m4_tokenizerdir| & Github    & m4_tokenizerscript  &               \\
       morphosyntactic parser     & \verb|m4_morphpardir|  & Github    & \verb|m4_morphparscript|   &   \\
       alpinohack         & \verb|clean_hack|      & This doc. &  m4_alpinohackscript  & \footnote{not a  module, but an
                                                                                          encoding hack} \\
       \textsc{ner}       & \verb|m4_jardir|       & Lisa      & m4_nerscript        &   \\
       \textsc{wsd}       & \verb|m4_wsddir|       & Lisa      & m4_wsdscript        &  \\
       Onto               & \verb|m4_ontodir|      & Lisa      & m4_ontoscript       &  \\
       Heidel             & \verb|m4_heideldir|    & Github      & m4_heidelscript     &  \\
       SRL                & \verb|m4_srldir|       & Lisa      & m4_srlscript        &  \\
@%       Alpino             & \verb|m4_alpinodir|    & \textsc{rug} & m4_Alpinoscript  & \\
@%       Ticcutils          & \verb|m4_ticcdir|      & \textsc{ilk} & & \\
@%       Timbl              & \verb|m4_timbldir|     & \textsc{ilk} & & \\
@%       Treetagger         &                        &              & & \\
    \end{tabular}
  \end{footnotesize}
  \caption{List of the modules to be installed. Column description:
    \textbf{directory:} Name of the subdirectory below subdirectory \texttt{modules} in
    which it is installed; \textbf{Source:} From where the module has
    been obtained; \textbf{script:} Script to be included in a pipeline.}
  \label{tab:modulelist}
\end{table}
lists the modules in the pipeline. The column \emph{source} indicates
the origin of the module. Ideally, modules are directly obtained from
a public repository, e.g. Github, or from a website of the organisation
where the module has been built. However, some of the modules are not yet
available in this way and only a snapshot has been installed by hand in
Lisa. Table~/ref{tab:modulesources} provides the \textsc{url}'s of the
sources that have been obtained from a public repository.

The modules themselves use other utilities like dependency-taggers and
POS taggers. These utilities are listed in
table~\ref{tab:utillist}.
\begin{table}[hbtp]
  \centering
  \begin{tabular}{llll}
   \textbf{module}      & \textbf{directory}  & \textbf{source}  & \textbf{Details} \\
     KafNafParserPy     & \verb|m4_kafnafdir| & Github           & \\
     Alpino             & \verb|m4_alpinodir| & \textsc{rug}     &  \\
     Ticcutils          & \verb|m4_ticcdir|   & \textsc{ilk}     & \\
     Timbl              & \verb|m4_timbldir|  & \textsc{ilk}     & \\
     Treetagger         &                     &                  & \\
  \end{tabular}
  \caption{List of the modules to be installed. Column description:
    \textbf{directory:} Name of the subdirectory below \texttt{mod} in
    which it is installed; \textbf{Source:} From where the module has
    been obtained; \textbf{script:} Script to be included in a pipeline.}
  \label{tab:utillist}
\end{table}


Table~\ref{tab:modulesources} lists the source of the modules and
utilities that can be installed from an open source.
\begin{table}[hbtp]
  \centering
  \begin{footnotesize}
  \begin{tabular}{lll}
   \textbf{module} & \textbf{source} & {\small\textbf{URL}}  \\
   Tokenizer          & Github & m4_tokenizergit \\
   Morphosynt. p. & Github & \verb|m4_morphpargit| \\
   heideltime. & Github & \verb|m4_morphpargit| \\
   Alpino             & \textsc{rug}  & \verb|m4_alpinosrc| \\
   Ticcutils          & \textsc{ilk}  & m4_ticcsrc \\
   Timble            & \textsc{ilk} & m4_timblsrc \\
  \end{tabular}
  \end{footnotesize}
  \caption{Sources of the modules}
  \label{tab:modulesources}
\end{table}




\subsection{File-structure of the pipeline}
\label{sec:filestructure}

The files that make up the pipeline are organised in set of
directories:

\begin{description}
\item[nuweb:] This directory comntains this document and everything to
  create the pipeline from the open sources of the modules.
\item[modules:] Contains the program code of each module in a
  subdirectory. Fuurthermore, it contains a subdirectory
  \verb|python| for python software-modules, subdirectory
  \texttt{jars} for jar files and subdirectory
  /usrlocal/ for binaries and libs that are used by modules.
\item[bin:] Contains for each of the modules a script that reads
  \NAF{} input, passes it to the module in the \texttt{modules}
  directory and produces the output on standard out. Furthermore, the
  subdirectory contains the script \texttt{m4_module_installer} that
  performs the installation,  and 
  a script \texttt{test} that shows that the pipeline works in a trivial
  case.
\item[nuweb:] Contains this document, the nuweb source that creates
  the documents and the sources and a Makefile to perform the actions.
\end{description}

@d directories to create @{m4_amoddir @| @}
@d directories to create @{m4_abindir @| @}
@d directories to create @{m4_ausrlocaldir @| @}
@d directories to create @{m4_ausrlocaldir<!!>/bin @| @}
@d directories to create @{m4_ausrlocaldir<!!>/lib @| @}
@d directories to create @{m4_amoddir/python m4_ajardir @| @}

Make Python utilities findable with the following macro:

@d set pythonpath @{@%
export PYTHONPATH=m4_amoddir/python:\$PYTHONPATH
@| @}

Similarly, make binaries findable:

@d set local bin directory @{@%
export PATH=m4_ausrlocaldir<!!>/bin:$PATH
@| @}


 
\section{Installation}
\label{sec:install}

This section describes how the modules are obtained from their
open-source and installed. This is performed by script \verb|m4_module_installer|


@o m4_bindir/m4_module_installer @{@%
#!/bin/bash
@< variables of m4_module_installer @>
@< install the tokenizer @>
@< install kafnafparserpy @>
@< install Alpino @>
@< install the morphosyntactic parser @>
@< install the NER module @>
@< install the WSD module @>
@< install the onto module @>
@< install the heideltime module @>
@< install the srl module @>
@< install the treetagger utility @>
@< install the ticcutils utility @>
@< install the timbl utility @>

@| @}

@d make scripts executable @{@%
chmod 775  m4_abindir/m4_module_installer
@| @}


Installation goes as follows:

\begin{enumerate}
\item If the module exists already, move it to a temporary place.
\item Try to install the module from the source.
\item If that is successful, remove the old version. Otherwise, move
  the old version back to its original place.
\end{enumerate}

The following macro's move or remove modules.

@d move module  @{@%
if
 [ -e @1 ]
then
   mv @1 old.@1
fi
@| @}


@d remove old module  @{@%
rm -rf old.@1
@| @}


@d re-instate old module @{@%
mv old.@1 @1
MESS="Replaced previous version of @1"
@< logmess @($MESS@) @>

@| @}

The following macro can be used to install a module from github. It
needs as parameters:
\begin{enumerate}
\item Name of the module.
\item Name of the root directory.
\item \URL{} to clone from.
\end{enumerate}

@d install from github @{@%
MODNAM=@1
DIRN=@2
GITU=@3
@< find leave and tree @>
@< logmess @("TREE: \$TREE; LEAVE: \$LEAVE"@) @>
cd $TREE
@< move module @(\$LEAVE@) @>
git clone $GITU
if
  [ $? -gt 0 ]
then
  @< logmess @(Cannot install current $MODNAM version@) @>
  @< re-instate old module @(\$LEAVE@) @>
else
  @< remove old module @(\$LEAVE@) @>
fi

@| @}


Note: Par.~1: Directory; par~2: path to directory; par~3: directory name.

@d find leave and tree @{@%
FULLDIR=m4_amoddir/$DIRN
LEAVE=${FULLDIR##*/}
TREE=${FULLDIR%%\$LEAVE}
@| @}


\subsection{Install tokenizer}
\label{sec:installtokenizer}

\subsubsection{Module}
\label{sec:install-tokenizermodule}

@d install the tokenizer @{@%
@< install from github @(tokenizer@,m4_tokenizerdir@,m4_tokenizergit@) @>
@| @}


@% @d install the tokenizer @{@%
@% cd m4_amoddir
@% @< move module @(m4_tokenizerdir@) @>
@% git clone m4_tokenizergit
@% if
@%   [ $? -gt 0 ]
@% then
@%   @< logmess @(Cannot install current tokenizer version@) @>
@%   @< re-instate old module @(m4_tokenizerdir@) @>
@% else
@%   @< remove old module @(m4_tokenizerdir@) @>
@% fi
@% @| @} 

\subsubsection{Script}
\label{sec:tokenizerscript}

The script just runs the tokenizerscript in Perl.

@o m4_bindir/m4_tokenizerscript @{@%
#!/bin/bash
ROOT=m4_aprojroot
TOKBINDIR=m4_amoddir/<!!>m4_tokenizerdir<!!>/core
cat | perl \$TOKBINDIR/tokenizer-cli.pl -l nl t  

@| @}

@d make scripts executable @{@%
chmod 775  m4_abindir/m4_tokenizerscript
@| @}


\subsection{Install Alpino}
\label{sec:install-alpino}

Install Alpino from the website of Gertjan van Noort.

\subsubsection{Module}
\label{sec:installalpinomodule}

@d install Alpino @{@%
SUCCES=0
cd m4_amoddir
@< move module @(Alpino@) @>
wget m4_alpinourl
SUCCES=\$?
if
  [ \$SUCCES -eq 0 ]
then
  tar -xzf m4_alpinosrc
  SUCCES=\$?
  rm -rf m4_alpinosrc
fi
if
  [ $SUCCES -eq 0 ]
then
  @< logmess @(Installed Alpino@) @>
  @< remove old module @(Alpino@) @>
else
  @< re-instate old module @(Alpino@) @>
fi
@|SUCCES @}

Currently, alpino is not used as a pipeline-module on its own, but it
is included in other pipeline-modules. Modules that use Alpino should
set the following variables:

@d set alpinohome @{@%
export ALPINO_HOME=m4_amoddir/Alpino
@| ALPINO_HOME @}


\subsection{Morphosyntactic parser}
\label{sec:install-morphsynt-parser}


\subsubsection{Module}
\label{sec:install-morphosyntmodule}

@d install the morphosyntactic parser @{@%
@< install from github @(morphsynparser@,m4_morphpardir@,m4_morphpargit@) @>
@| @}


@% @d install the morphosyntactic parser @{@%
@% cd m4_amoddir
@% @< move module @(m4_morphpardir@) @>
@% git clone m4_morphpargit
@% if
@%   [ $? -gt 0 ]
@% then
@%   @< logmess @(Cannot install current tokenizer version@) @>
@%   @< re-instate old module @(m4_tokenizerdir@) @>
@% else
@%   @< remove old module @(m4_tokenizerdir@) @>
@% fi
@% @| @} 

\subsubsection{Script}
\label{sec:morphparserscript}

@o m4_bindir/m4_morphparscript @{@%
#!/bin/bash
ROOT=m4_aprojroot
MODDIR=m4_amoddir/<!!>m4_morphpardir<!!>
@< set alpinohome @>
@< set pythonpath @>
cat | python \$MODDIR/core/morph_syn_parser.py
@| @}

@d make scripts executable @{@%
chmod 775  m4_abindir/m4_morphparscript
@| @}

\subsection{Alpino hack}
\label{sec:alpinohack}

Install a hack that removes output from Alpino that cannot be
interpreted by following modules. It is just a small python script.

\subsubsection{Module}
\label{sec:install_alpinohack}

@d directories to create @{m4_amoddir/m4_alpinohackdir @| @}

@o m4_moddir/m4_alpinohackdir/m4_alpinohackpythonscript @{@%
#!/usr/bin/python
import sys

input = sys.stdin

output = ''

for line in input:
    line = line.replace('"--','"#')
    line = line.replace('--"','#"')
    output += line

print output

@| @}

\subsubsection{Script}
\label{sec:alpinohack-script}

@o m4_bindir/m4_alpinohackscript @{@%
#!/bin/bash
ROOT=m4_aprojroot
HACKDIR=m4_amoddir/m4_alpinohackdir
cat | python  \$HACKDIR/clean_hack.py 

@| @}

@d make scripts executable @{@%
chmod 775  m4_abindir/m4_alpinohackscript
@| @}



\subsection{Named entity recognition}
\label{sec:nermodule}

\subsubsection{Module}
\label{sec:module}

We do not (yet have the source code of the NER module. A snapshot is
comprised in a jar library.

@d install the NER module @{@%
cp m4_asnapshotroot/jars/m4_nerjar m4_jardir/
@| @}

\subsubsection{Script}
\label{sec:nerscript}

@o m4_bindir/m4_nerscript @{@%
#!/bin/bash
ROOT=m4_aprojroot
JARDIR=m4_ajardir
cat | java -jar \$JARDIR/m4_nerjar tag
@| @}

@d make scripts executable @{@%
chmod 775  m4_abindir/m4_nerscript
@| @}


\subsection{Wordsense-disambiguation}
\label{sec:wsd}

We do not yet have a source-repository of the wsd module. Therefore,
install from a snapshot on Lisa.

\subsubsection{Module}
\label{sec:wsd-module}

@d install the WSD module @{@%
cp -r m4_asnapshotroot/m4_wsddir m4_amoddir/
@| @}


\subsubsection{Script}
\label{sec:wsdscript}

@o m4_bindir/m4_wsdscript @{@%
#!/bin/bash
# WSD -- wrapper for word-sense disambiguation
# 8 Jan 2014 Ruben Izquierdo
# 16 sep 2014 Paul Huygen
ROOT=m4_aprojroot
WSDDIR=m4_amoddir/m4_wsddir
WSDSCRIPT=kaf_annotate_senses.pl
UKB=\$WSDDIR/ukb_wsd_2.0
POSMAP=$WSDDIR/posmap.NGV.txt

if [ "$1" = "nl" ]
then
  GRAPH=\$WSDDIR/cdb2.0-nld-all.infv.0.0.no-allwords.bin
  DICT=\$WSDDIR/dictionary
else
  GRAPH=\$WSDDIR/wn30g_eng.v20.bin
  DICT=\$WSDDIR/wn30_eng_dict.txt
fi

iconv -t utf-8//IGNORE | \$WSDDIR/\$WSDSCRIPT -x \$UKB -M \$GRAPH -W \$DICT -m \$POSMAP
@| @}

@d make scripts executable @{@%
chmod 775  m4_abindir/m4_wsdscript
@| @}


\subsection{Ontotagger}
\label{sec:onto}

We do not yet have a source-repository of the Ontotagger module. Therefore,
install from a snapshot on Lisa.

\subsubsection{Module}
\label{sec:ontotagger-module}

@d install the onto module @{@%
cp -r m4_asnapshotroot/m4_ontodir m4_amoddir/
@| @}


\subsubsection{Script}
\label{sec:ontoscript}

@o m4_bindir/m4_ontoscript @{@%
#!/bin/bash
ROOT=/home/phuijgen
ONTODIR=m4_amoddir/m4_ontodir
JARDIR=\$ONTODIR/lib
RESOURCESDIR=\$ONTODIR/resources
PREDICATEMATRIX="\$RESOURCESDIR/PredicateMatrix.v1.1/PredicateMatrix.v1.1.role.nl-1.merged"
GRAMMATICALWORDS="\$RESOURCESDIR/grammaticals/Grammatical-words.nl"
TMPFIL=`mktemp -t stap6.XXXXXX`
cat >$TMPFIL

CLASSPATH=\$JARDIR/ontotagger-1.0-jar-with-dependencies.jar
JAVASCRIPT=eu.kyotoproject.main.KafPredicateMatrixTagger


@% JAVA_ARGS="-Xmx1812m"
@% JAVA_ARGS=\$JAVA_ARGS " -cp \$JARDIR/ontotagger-1.0-jar-with-dependencies.jar"
@% JAVA_ARGS=\$JAVA_ARGS " eu.kyotoproject.main.KafPredicateMatrixTagger"
JAVA_ARGS="--mappings \"fn;pb;nb\" "
JAVA_ARGS="\$JAVA_ARGS  --key odwn-eq"
JAVA_ARGS="\$JAVA_ARGS  --version 1.1"
JAVA_ARGS="\$JAVA_ARGS  --predicate-matrix \$PREDICATEMATRIX"
JAVA_ARGS="\$JAVA_ARGS  --grammatical-words \$GRAMMATICALWORDS"
JAVA_ARGS="\$JAVA_ARGS  --naf-file \$TMPFIL"
java -Xmx1812m -cp \$CLASSPATH \$JAVASCRIPT \$JAVA_ARGS

@% @< onto javacommand @>
@% java \$JAVA_ARGS
@% java -Xmx1812m -cp $JARDIR/ontotagger-1.0-jar-with-dependencies.jar \
@%      eu.kyotoproject.main.KafPredicateMatrixTagger \
@%      --mappings "fn;pb;nb" --key odwn-eq --version 1.1 \
@%      --predicate-matrix \
@%        "\$RESOURCESDIR/PredicateMatrix.v1.1/PredicateMatrix.v1.1.role.nl-1.merged" \ 
@%        --grammatical-words \
@%      "\$RESOURCESDIR/grammaticals/Grammatical-words.nl" \
@%       --naf-file $TMPFIL 
rm -rf \$TMPFIL

@| @}


@% The Java command for the onto-tagger is very long. I tried to make it
@% more readable and could only come up with the following method:
@% 
@% @d onto javacommand @{java -Xmx1812m @| @}
@% @d onto javacommand @{-cp \$CLASSPATH @| @}
@% @d onto javacommand @{\$JAVASCRIPT  @| @}
@% @d onto javacommand @{--mappings "fn;pb;nb" @| @}
@% @d onto javacommand @{ --key odwn-eq @| @}
@% @d onto javacommand @{--version 1.1 @| @}
@% @d onto javacommand @{--predicate-matrix \$PREDICATEMATRIX @| @}
@% @d onto javacommand @{ --grammatical-words "\$GRAMMATICALWORDS" @| @}
@% @d onto javacommand @{--naf-file $TMPFIL
@% @| @}



@d make scripts executable @{@%
chmod 775  m4_abindir/m4_ontoscript
@| @}



\subsection{Heideltime}
\label{sec:heideltime}

\subsubsection{Module}
\label{sec:heideltimmodule}

@d install the heideltime module @{@%
@< install from github @(heideltime@,m4_heideldir@,m4_heidelgit@) @>
@< adapt heideltime's config.props @>

@| @}

@d adapt heideltime's config.props @{@%
CONFIL=m4_heideldir/config.props
tempfil=`mktemp -t heideltmp.XXXXXX`
mv $CONFIL \$tempfil
MODDIR=m4_amoddir
TREETAGDIR=m4_treetagdir
AWKCOMMAND='/^treeTaggerHome/ {\$0="treeTaggerHome = m4_amoddir/m4_treetagdir"}; {print}'
gawk "\$AWKCOMMAND" \$tempfil >\$CONFIL
@| @}


\subsubsection{Script}
\label{sec:heideltime-script}

@o m4_bindir/m4_heidelscript @{@%
#!/bin/bash
ROOT=m4_aprojroot
HEIDELDIR=m4_amoddir/m4_heideldir
TEMPDIR=`mktemp -t -d heideltmp.XXXXXX`
cd $HEIDELDIR
@< set pythonpath @>
iconv -t utf-8//IGNORE | python \$HEIDELDIR/HeidelTime_NafKaf.py \$HEIDELDIR/heideltime-standalone/ \$TEMPDIR
@| @}

@d make scripts executable @{@%
chmod 775  m4_abindir/m4_heidelscript
@| @}

\subsection{Semantic Role labelling}
\label{sec:SRL}

\subsubsection{Module}
\label{sec:SRL-module}

@d install the srl module @{@%
cp -r m4_asnapshotroot/m4_srldir m4_amoddir/

@| @}


\subsubsection{Script}
\label{sec:SRLscript}

@o m4_bindir/m4_srlscript @{@%
#!/bin/bash
ROOT=m4_aprojroot
SRLDIR=m4_amoddir/m4_srldir
TEMPDIR=`mktemp -d -t SRLTMP.XXXXXX`
cd \$SRLDIR
@< set local bin directory @>
@< set pythonpath @>
cat | \$SRLDIR/getSRLinfo.py \$SRLDIR/srlModule/ \$TEMPDIR
rm -rf \$TEMPDIR
@| @}

@d make scripts executable @{@%
chmod 775  m4_abindir/m4_srlscript
@| @}



\subsection{KafNafParserPy}
\label{sec:KafNafParserPy}

Several modules use KafNafParserpy to read and write \textsc{naf}
files.

\subsubsection{Module}
\label{sec:install-kafnafparserpy}

@d install kafnafparserpy @{@%
@< install from github @(kafnafparserpy@,m4_kafnafdir@,m4_kafnafgit@) @>
@| @}


\section{Utilities}
\label{sec:utilities}

\subsection{Test script}
\label{sec:testscript}

The following script pushes a single sentence through the modules of
the pipeline.

@o m4_bindir/test @{@%
#!/bin/bash
ROOT=m4_aprojroot
BIND=\$ROOT/bin
echo "De hond eet jus." | \$BIND/tok | \$BIND/mor | \
\$BIND/m4_alpinohackscript | \$BIND/m4_nerscript  | \$BIND/m4_wsdscript | \
\$BIND/m4_ontoscript  > \$ROOT/test.onto
cat \$ROOT/test.onto | \$BIND/m4_heidelscript  > \$ROOT/test.heidel
cat \$ROOT/test.heidel | \$BIND/m4_srlscript  > \$ROOT/test.out
@% \$BIND/m4_ontoscript | \$BIND/m4_heidelscript | \$BIND/m4_srlscrip  > \$ROOT/test.out
@| @}

@d make scripts executable @{@%
chmod 775  m4_abindir/test
@| @}


\subsection{Treetagger}
\label{sec:installtreetagger}

\subsubsection{Module}
\label{sec:mdule}

Installation goes as follows (See
\href{http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/}{Treetagger's homepage}:

\begin{enumerate}
\item Download and unpack the treetagger tarball. This generates the
  subdirectories \verb|bin|, \verb|cmd| and \verb|doc|
\item Download and unpack the tagger-scripts tarball
\end{enumerate}

The locatioan where treetager comes from and the location where it is going to reside:

@d install the treetagger utility @{@%
TREETAGDIR=m4_treetagdir
TTREETAG_BASIS_URL=m4_treetag_base_url
@| @}

The source tarball, scripts and the installation-script:

@d install the treetagger utility @{@%
TREETAGSRC=m4_treetagsrc
TREETAGSCRIPTS=m4_treetagger_scripts
TREETAG_INSTALLSCRIPT=m4_treetagger_installscript
@| @}

Parametersets:

@d install the treetagger utility @{@%
DUTCHPARS_UTF_GZ=m4_treetag_dutchparms       
DUTCH_TAGSET=m4_treetag_dutch_tagset 
DUTCHPARS_2_GZ=m4_treetag_dutchparms2
@| @}

Download everything in the target directory:

@d install the treetagger utility @{@%
mkdir -p m4_amoddir/\$TREETAGDIR
cd m4_amoddir/\$TREETAGDIR
wget \$TREETAGURL/\$TREETAGSRC
wget \$TREETAGURL/\$TREETAGSCRIPTS
wget \$TREETAGURL/\$TREETAG_INSTALLSCRIPT
wget \$TREETAGURL/\$DUTCHPARS_UTF_GZ
wget \$TREETAGURL/\$DUTCH_TAGSET    
wget \$TREETAGURL/\$DUTCHPARS_2_GZ  
@| @}

Rub the install-script:

@d install the treetagger utility @{@%
chmod 775 \$TREETAG_INSTALLSCRIPT
./\$TREETAG_INSTALLSCRIPT
@| @}

Remove the tarballs:

@d install the treetagger utility @{@%
rm \$TREETAGSRC
rm \$TREETAGSCRIPTS
rm \$TREETAG_INSTALLSCRIPT
rm \$DUTCHPARS_UTF_GZ
rm \$DUTCH_TAGSET    
rm \$DUTCHPARS_2_GZ
@| @}




\subsection{Timbl and ticcutils}
\label{sec:timbl}



\subsubsection{Module}
\label{sec:timblmodule}

Timbl and ticcutils are installed from their source-tarballs. The
installation is not (yet?) completely reproducibe because it uses the currently
available c-compiler. Installation involves:

\begin{enumerate}
\item Download the tarball in a temporary directory.
\item Unpack the tarball.
\item cd to the unpacked directory and perform \verb|./configure|,
  \verb|make| and \verb|make install|. Note the argument that causes
  the files to be installed in the \verb|usrlocal| subdirectory of the
  modules directory.
\end{enumerate}

@d install the ticcutils utility @{@%
URL=m4_ticcurl
TARB=m4_ticcsrc
DIR=m4_ticcdir
@< unpack ticcutils or timbl @>
@| @}

@d install the timbl utility @{@%
URL=m4_timblurl
TARB=m4_timblsrc
DIR=m4_timbldir
@< unpack ticcutils or timbl @>
@| @}


@d unpack ticcutils or timbl @{@%
SUCCES=0
ticbeldir=`mktemp -t -d tickbel.XXXXXX`
cd \$ticbeldir
wget \$URL
SUCCES=\$?
if
  [ \$SUCCES -eq 0 ]
then
  tar -xzf \$TARB
  SUCCES=\$?
  rm -rf \$TARB
fi
if
  [ \$SUCCES -eq 0 ]
then
  cd \$DIR
  ./configure --prefix=m4_ausrlocaldir
  make
  make install
fi
cd m4_aprojroot
rm -rf \$ticbeldir
if
  [ \$SUCCES -eq 0 ]
then
  @< logmess @(Installed \$DIR@) @>
else
  @< logmess @(NOT installed \$DIR@) @>
fi
@| @}



\subsection{Logging}
\label{sec:logging}

Write log messages to standard out if variable \verb|LOGLEVEL| is
equal to~1.

@d variables of m4_module_installer @{@%
LOGLEVEL=1
@| @}

@d logmess @{@%
if
 [ $LOGLEVEL -gt 0 ]
then
 echo @1
fi 
@| @}

\subsection{Misc}
\label{sec:misc}

Install a module from a tarball: The macro expects the following three
variables to be present:

\begin{description}
\item[URL:] The \textsc{url} tfrom where the taball can be downloaded.
\item[TARB:] The name of the tarball.
\item[DIR;] Name of the directory for the module.
\end{description}

Arg 1: URL; Arg 2: tarball; Arg 3: directory.

@d install from tarball @{@%
SUCCES=0
cd m4_amoddir
@< move module @(\$DIR@) @>
wget \$URL
SUCCES=\$?
if
  [ \$SUCCES -eq 0 ]
then
  tar -xzf \$TARB
  SUCCES=\$?
  rm -rf \$TARB
fi
if
  [ $SUCCES -eq 0 ]
then
  @< logmess @(Installed \$DIR@) @>
  @< remove old module @(\$DIR@) @>
else
  @< re-instate old module @(\$DIR@) @>
fi
@| @}



\appendix

\section{How to read and translate this document}
\label{sec:translatedoc}

This document is an example of \emph{literate
  programming}~\cite{Knuth:1983:LP}. It contains the code of all sorts
of scripts and programs, combined with explaining texts. In this
document the literate programming tool \texttt{nuweb} is used, that is
currently available from Sourceforge
(URL:\url{m4_nuwebURL}). The advantages of Nuweb are, that
it can be used for every programming language and scripting language, that
it can contain multiple program sources and that it is very simple.


\subsection{Read this document}
\label{sec:read}

The document contains \emph{code scraps} that are collected into
output files. An output file (e.g. \texttt{output.fil}) shows up in the text as follows:

\begin{alltt}
"output.fil" \textrm{4a \(\equiv\)}
      # output.fil
      \textrm{\(<\) a macro 4b \(>\)}
      \textrm{\(<\) another macro 4c \(>\)}
      \(\diamond\)

\end{alltt}

The above construction contains text for the file. It is labelled with
a code (in this case 4a)  The constructions between the \(<\) and
\(>\) brackets are macro's, placeholders for texts that can be found
in other places of the document. The test for a macro is found in
constructions that look like:

\begin{alltt}
\textrm{\(<\) a macro 4b \(>\) \(\equiv\)}
     This is a scrap of code inside the macro.
     It is concatenated with other scraps inside the
     macro. The concatenated scraps replace
     the invocation of the macro.

{\footnotesize\textrm Macro defined by 4b, 87e}
{\footnotesize\textrm Macro referenced in 4a}
\end{alltt}

Macro's can be defined on different places. They can contain other macro´s.

\begin{alltt}
\textrm{\(<\) a scrap 87e \(>\) \(\equiv\)}
     This is another scrap in the macro. It is
     concatenated to the text of scrap 4b.
     This scrap contains another macro:
     \textrm{\(<\) another macro 45b \(>\)}

{\footnotesize\textrm Macro defined by 4b, 87e}
{\footnotesize\textrm Macro referenced in 4a}
\end{alltt}


\subsection{Process the document}
\label{sec:processing}

The raw document is named
\verb|a_<!!>m4_progname<!!>.w|. Figure~\ref{fig:fileschema}
\begin{figure}[hbtp]
  \centering
@%  \includegraphics{fileschema.fig}
  \caption{Translation of the raw code of this document into
    printable/viewable documents and into program sources. The figure
    shows the pathways and the main files involved.}
  \label{fig:fileschema}
\end{figure}
 shows pathways to
translate it into printable/viewable documents and to extract the
program sources. Table~\ref{tab:transtools}
\begin{table}[hbtp]
  \centering
  \begin{tabular}{lll}
    \textbf{Tool} & \textbf{Source} & \textbf{Description} \\
    gawk  & \url{www.gnu.org/software/gawk/}& text-processing scripting language \\
    M4    & \url{www.gnu.org/software/m4/}& Gnu macro processor \\
    nuweb & \url{nuweb.sourceforge.net} & Literate programming tool \\
    tex   & \url{www.ctan.org} & Typesetting system \\
    tex4ht & \url{www.ctan.org} & Convert \TeX{} documents into \texttt{xml}/\texttt{html}
  \end{tabular}
  \caption{Tools to translate this document into readable code and to
    extract the program sources}
  \label{tab:transtools}
\end{table}
lists the tools that are
needed for a translation. Most of the tools (except Nuweb) are available on a
well-equipped Linux system.

@%\textbf{NOTE:} Currently, not the most recent version  of Nuweb is used, but an older version that has been modified by me, Paul Huygen.

@d parameters in Makefile @{@%
NUWEB=m4_nuwebbinary
@| @}


\subsection{Translate and run}
\label{sec:transrun}

This chapter assembles the Makefile for this project.

@o Makefile -t @{@%
@< default target @>

@< parameters in Makefile @> 

@< impliciete make regels @>
@< expliciete make regels @>
@< make targets @>
@| @}

The default target of make is \verb|all|.

@d  default target @{@%
all : @< all targets @>
.PHONY : all

@|PHONY all @}


One of the targets is certainly the \textsc{pdf} version of this
document.

@d all targets @{m4_progname.pdf@}

We use many suffixes that were not known by the C-programmers who
constructed the \texttt{make} utility. Add these suffixes to the list.

@d parameters in Makefile @{@%
.SUFFIXES: .pdf .w .tex .html .aux .log .php

@| SUFFIXES @}



\subsection{Pre-processing}
\label{sec:pre-processing}

To make usable things from the raw input
\verb|a_<!!>m4_progname<!!>.w|, do the following:

\begin{enumerate}
\item Process \verb|\$| characters.
\item Run the m4 pre-processor.
\item Run nuweb.
\end{enumerate}

This results in a \LaTeX{} file, that can be converted into a \pdf{}
or a \HTML{} document, and in the program sources and scripts.

\subsubsection{Process `dollar' characters }
\label{sec:procdollars}

Many ``intelligent'' \TeX{} editors (e.g.\ the auctex utility of
Emacs) handle \verb|\$| characters as special, to switch into
mathematics mode. This is irritating in program texts, that often
contain \verb|\$| characters as well. Therefore, we make a stub, that
translates the two-character sequence \verb|\\$| into the single
\verb|\$| character.


@d expliciete make regels @{@%
m4_<!!>m4_progname<!!>.w : a_<!!>m4_progname<!!>.w
@%	gawk '/^@@%/ {next}; {gsub(/[\\][\\$\$]/, "$$");print}' a_<!!>m4_progname<!!>.w > m4_<!!>m4_progname<!!>.w
	gawk '{if(match($$0, "@@<!!>%")) {printf("%s", substr($$0,1,RSTART-1))} else print}' a_<!!>m4_progname.w \
          | gawk '{gsub(/[\\][\\$\$]/, "$$");print}'  > m4_<!!>m4_progname<!!>.w
@% $

@| @}

@%@d expliciete make regels @{@%
@%m4_<!!>m4_progname<!!>.w : a_<!!>m4_progname<!!>.w
@%	gawk '/^@@%/ {next}; {gsub(/[\\][\\$\$]/, "$$");print}' a_<!!>m4_progname<!!>.w > m4_<!!>m4_progname<!!>.w
@%
@%@% $
@%@| @}

\subsubsection{Run the M4 pre-processor}
\label{sec:run_M4}

@d  expliciete make regels @{@%
m4_progname<!!>.w : m4_<!!>m4_progname<!!>.w inst.m4
	m4 -P m4_<!!>m4_progname<!!>.w > m4_progname<!!>.w

@| @}


\subsection{Typeset this document}
\label{sec:typeset}

Enable the following:
\begin{enumerate}
\item Create a \pdf{} document.
\item Print the typeset document.
\item View the typeset document with a viewer.
\item Create a \HTML document.
\end{enumerate}

In the three items, a typeset \pdf{} document is required or it is the
requirement itself.




\subsubsection{Figures}
\label{sec:figures}

This document contains figures that have been made by
\texttt{xfig}. Post-process the figures to enable inclusion in this
document.

The list of figures to be included:

@d parameters in Makefile @{@%
FIGFILES=fileschema

@| FIGFILES @}

We use the package \texttt{figlatex} to include the pictures. This
package expects two files with extensions \verb|.pdftex| and
\verb|.pdftex_t| for \texttt{pdflatex} and two files with extensions \verb|.pstex| and
\verb|.pstex_t| for the \texttt{latex}/\texttt{dvips}
combination. Probably tex4ht uses the latter two formats too.

Make lists of the graphical files that have to be present for
latex/pdflatex:

@d parameters in Makefile @{@%
FIGFILENAMES=\$(foreach fil,\$(FIGFILES), \$(fil).fig)
PDFT_NAMES=\$(foreach fil,\$(FIGFILES), \$(fil).pdftex_t)
PDF_FIG_NAMES=\$(foreach fil,\$(FIGFILES), \$(fil).pdftex)
PST_NAMES=\$(foreach fil,\$(FIGFILES), \$(fil).pstex_t)
PS_FIG_NAMES=\$(foreach fil,\$(FIGFILES), \$(fil).pstex)

@|FIGFILENAMES PDFT_NAMES PDF_FIG_NAMES PST_NAMES PS_FIG_NAMES@}


Create
the graph files with program \verb|fig2dev|:

@d impliciete make regels @{@%
%.eps: %.fig
	fig2dev -L eps \$< > \$@@

%.pstex: %.fig
	fig2dev -L pstex \$< > \$@@

.PRECIOUS : %.pstex
%.pstex_t: %.fig %.pstex
	fig2dev -L pstex_t -p \$*.pstex \$< > \$@@

%.pdftex: %.fig
	fig2dev -L pdftex \$< > \$@@

.PRECIOUS : %.pdftex
%.pdftex_t: %.fig %.pstex
	fig2dev -L pdftex_t -p \$*.pdftex \$< > \$@@

@| fig2dev @}


\subsubsection{Bibliography}
\label{sec:bbliography}

To keep this document portable, create a portable bibliography
file. It works as follows: This document refers in the
\texttt|bibliography| statement to the local \verb|bib|-file
\verb|m4_progname.bib|. To create this file, copy the auxiliary file
to another file \verb|auxfil.aux|, but replace the argument of the
command \verb|\bibdata{m4_progname}| to the names of the bibliography
files that contain the actual references (they should exist on the
computer on which you try this). This procedure should only be
performed on the computer of the author. Therefore, it is dependent of
a binary file on his computer.


@d expliciete make regels @{@%
bibfile : m4_progname.aux m4_mkportbib
	m4_mkportbib m4_progname m4_bibliographies

.PHONY : bibfile
@| @}

\subsubsection{Create a printable/viewable document}
\label{sec:createpdf}

Make a \pdf{} document for printing and viewing.

@d make targets @{@%
pdf : m4_progname.pdf

print : m4_progname.pdf
	m4_printpdf(m4_progname)

view : m4_progname.pdf
	m4_viewpdf(m4_progname)

@| pdf view print @}

Create the \pdf{} document. This may involve multiple runs of nuweb,
the \LaTeX{} processor and the bib\TeX{} processor, and depends on the
state of the \verb|aux| file that the \LaTeX{} processor creates as a
by-product. Therefore, this is performed in a separate script,
\verb|w2pdf|.

\paragraph{The w2pdf script}
\label{sec:w2pdf}

The three processors nuweb, \LaTeX{} and bib\TeX{} are
intertwined. \LaTeX{} and bib\TeX{} create parameters or change the
value of parameters, and write them in an auxiliary file. The other
processors may need those values to produce the correct output. The
\LaTeX{} processor may even need the parameters in a second
run. Therefore, consider the creation of the (\pdf) document finished
when none of the processors causes the auxiliary file to change. This
is performed by a shell script \verb|w2pdf|.

@%@d make targets @{@%
@%m4_progname.pdf : m4_progname.w \$(FIGFILES)
@%	chmod 775 bin/w2pdf
@%	bin/w2pdf m4_progname
@%
@%@| @}



Note, that in the following \texttt{make} construct, the implicit rule
\verb|.w.pdf| is not used. It turned out, that make did not calculate
the dependencies correctly when I did use this rule.

@d  impliciete make regels@{@%
@%.w.pdf :
%.pdf : %.w \$(W2PDF)  \$(PDF_FIG_NAMES) \$(PDFT_NAMES)
	chmod 775 \$(W2PDF)
	\$(W2PDF) \$*

@| @}

The following is an ugly fix of an unsolved problem. Currently I
develop this thing, while it resides on a remote computer that is
connected via the \verb|sshfs| filesystem. On my home computer I
cannot run executables on this system, but on my work-computer I
can. Therefore, place the following script on a local directory.

@d directories to create @{m4_nuwebbindir @| @}


@d parameters in Makefile @{@%
W2PDF=m4_nuwebbindir/w2pdf
@| @}

@d expliciete make regels  @{@%
\$(W2PDF) : m4_progname.w
	\$(NUWEB) m4_progname.w
@| @}

m4_dnl
m4_dnl Open compile file.
m4_dnl args: 1) directory; 2) file; 3) Latex compiler
m4_dnl
m4_define(m4_opencompilfil,
<!@o !>\$1<!!>\$2<! @{@%
#!/bin/bash
# !>\$2<! -- compile a nuweb file
# usage: !>\$2<! [filename]
# !>m4_header<!
NUWEB=m4_nuwebbinary
LATEXCOMPILER=!>\$3<!
@< filenames in nuweb compile script @>
@< compile nuweb @>

@| @}
!>)m4_dnl

m4_opencompilfil(<!m4_nuwebbindir/!>,<!w2pdf!>,<!pdflatex!>)m4_dnl

@%@o w2pdf @{@%
@%#!/bin/bash
@%# w2pdf -- make a pdf file from a nuweb file
@%# usage: w2pdf [filename]
@%#  [filename]: Name of the nuweb source file.
@%`#' m4_header
@%echo "translate " \$1 >w2pdf.log
@%@< filenames in w2pdf @>
@%
@%@< perform the task of w2pdf @>
@%
@%@| @}

The script retains a copy of the latest version of the auxiliary file.
Then it runs the four processors nuweb, \LaTeX{}, MakeIndex and bib\TeX{}, until
they do not change the auxiliary file or the index. 

@d compile nuweb @{@%
NUWEB=m4_nuweb
@< run the processors until the aux file remains unchanged @>
@< remove the copy of the aux file @>
@| @}

The user provides the name of the nuweb file as argument. Strip the
extension (e.g.\ \verb|.w|) from the filename and create the names of
the \LaTeX{} file (ends with \verb|.tex|), the auxiliary file (ends
with \verb|.aux|) and the copy of the auxiliary file (add \verb|old.|
as a prefix to the auxiliary filename).

@d filenames in nuweb compile script @{@%
nufil=\$1
trunk=\${1%%.*}
texfil=\${trunk}.tex
auxfil=\${trunk}.aux
oldaux=old.\${trunk}.aux
indexfil=\${trunk}.idx
oldindexfil=old.\${trunk}.idx
@| nufil trunk texfil auxfil oldaux indexfil oldindexfil @}

Remove the old copy if it is no longer needed.
@d remove the copy of the aux file @{@%
rm \$oldaux
@| @}

Run the three processors. Do not use the option \verb|-o| (to suppres
generation of program sources) for nuweb,  because \verb|w2pdf| must
be kept up to date as well.

@d run the three processors @{@%
\$NUWEB \$nufil
\$LATEXCOMPILER \$texfil
makeindex \$trunk
bibtex \$trunk
@| nuweb makeindex bibtex @}


Repeat to copy the auxiliary file and the index file  and run the processors until the
auxiliary file and the index file are equal to their copies.
 However, since I have not yet been able to test the \verb|aux|
file and the \verb|idx| in the same test statement, currently only the
\verb|aux| file is tested.

It turns out, that sometimes a strange loop occurs in which the
\verb|aux| file will keep to change. Therefore, with a counter we
prevent the loop to occur more than m4_maxtexloops times.

@d run the processors until the aux file remains unchanged @{@%
LOOPCOUNTER=0
while
  ! cmp -s \$auxfil \$oldaux 
do
  if [ -e \$auxfil ]
  then
   cp \$auxfil \$oldaux
  fi
  if [ -e \$indexfil ]
  then
   cp \$indexfil \$oldindexfil
  fi
  @< run the three processors @>
  if [ \$LOOPCOUNTER -ge 10 ]
  then
    cp \$auxfil \$oldaux
  fi;
done
@| @}


\subsubsection{Create HTML files}
\label{sec:createhtml}

\textsc{Html} is easier to read on-line than a \pdf{} document that
was made for printing. We use \verb|tex4ht| to generate \HTML{}
code. An advantage of this system is, that we can include figures
in the same way as we do for \verb|pdflatex|.

Nuweb creates a \LaTeX{} file that is suitable
for \verb|latex2html| if the source file has \verb|.hw| as suffix instead of
\verb|.w|. However, this feature is not compatible with tex4ht.

Make html file:

@d make targets @{@%
html : m4_htmltarget

@| @}

The \HTML{} file depends on its source file and the graphics files.

Make lists of the graphics files and copy them.

@d parameters in Makefile @{@%
HTML_PS_FIG_NAMES=\$(foreach fil,\$(FIGFILES), m4_htmldocdir/\$(fil).pstex)
HTML_PST_NAMES=\$(foreach fil,\$(FIGFILES), m4_htmldocdir/\$(fil).pstex_t)
@| @}


@d impliciete make regels @{@%
m4_htmldocdir/%.pstex : %.pstex
	cp  \$< \$@@

m4_htmldocdir/%.pstex_t : %.pstex_t
	cp  \$< \$@@

@| @}

Copy the nuweb file into the html directory.

@d expliciete make regels @{@%
m4_htmlsource : m4_progname.w
	cp  m4_progname.w m4_htmlsource

@| @}

We also need a file with the same name as the documentstyle and suffix
\verb|.4ht|. Just copy the file \verb|report.4ht| from the tex4ht
distribution. Currently this seems to work.

@d expliciete make regels @{@%
m4_4htfildest : m4_4htfilsource
	cp m4_4htfilsource m4_4htfildest

@| @}

Copy the bibliography.

@d expliciete make regels  @{@%
m4_htmlbibfil : m4_anuwebdir/m4_progname.bib
	cp m4_anuwebdir/m4_progname.bib m4_htmlbibfil

@| @}



Make a dvi file with \texttt{w2html} and then run
\texttt{htlatex}. 

@d expliciete make regels @{@%
m4_htmltarget : m4_htmlsource m4_4htfildest \$(HTML_PS_FIG_NAMES) \$(HTML_PST_NAMES) m4_htmlbibfil
	cp w2html m4_abindir
	cd m4_abindir && chmod 775 w2html
	cd m4_htmldocdir && m4_abindir/w2html m4_progname.w

@| @}

Create a script that performs the translation.

@%m4_<!!>opencompilfil(m4_htmldocdir/,`w2dvi',`latex')m4_dnl


@o w2html @{@%
#!/bin/bash
# w2html -- make a html file from a nuweb file
# usage: w2html [filename]
#  [filename]: Name of the nuweb source file.
`#' m4_header
echo "translate " \$1 >w2html.log
NUWEB=m4_nuwebbinary
@< filenames in w2html @>

@< perform the task of w2html @>

@| @}

The script is very much like the \verb|w2pdf| script, but at this
moment I have still difficulties to compile the source smoothly into
\textsc{html} and that is why I make a separate file and do not
recycle parts from the other file. However, the file works similar.


@d perform the task of w2html @{@%
@< run the html processors until the aux file remains unchanged @>
@< remove the copy of the aux file @>
@| @}


The user provides the name of the nuweb file as argument. Strip the
extension (e.g.\ \verb|.w|) from the filename and create the names of
the \LaTeX{} file (ends with \verb|.tex|), the auxiliary file (ends
with \verb|.aux|) and the copy of the auxiliary file (add \verb|old.|
as a prefix to the auxiliary filename).

@d filenames in w2html @{@%
nufil=\$1
trunk=\${1%%.*}
texfil=\${trunk}.tex
auxfil=\${trunk}.aux
oldaux=old.\${trunk}.aux
indexfil=\${trunk}.idx
oldindexfil=old.\${trunk}.idx
@| nufil trunk texfil auxfil oldaux @}

@d run the html processors until the aux file remains unchanged @{@%
while
  ! cmp -s \$auxfil \$oldaux 
do
  if [ -e \$auxfil ]
  then
   cp \$auxfil \$oldaux
  fi
@%  if [ -e \$indexfil ]
@%  then
@%   cp \$indexfil \$oldindexfil
@%  fi
  @< run the html processors @>
done
@< run tex4ht @>

@| @}


To work for \textsc{html}, nuweb \emph{must} be run with the \verb|-n|
option, because there are no page numbers.

@d run the html processors @{@%
\$NUWEB -o -n \$nufil
latex \$texfil
makeindex \$trunk
bibtex \$trunk
htlatex \$trunk
@| @}


When the compilation has been satisfied, run makeindex in a special
way, run bibtex again (I don't know why this is necessary) and then run htlatex another time.
@d run tex4ht @{@%
m4_index4ht
makeindex -o \$trunk.ind \$trunk.4dx
bibtex \$trunk
htlatex \$trunk
@| @}


\paragraph{create the program sources}
\label{sec:createsources}

Run nuweb, but suppress the creation of the \LaTeX{} documentation.
Nuweb creates only sources that do not yet exist or that have been
modified. Therefore make does not have to check this. However,
``make'' has to create the directories for the sources if they
do not yet exist.
@%This is especially important for the directories
@%with the \HTML{} files. It seems to be easiest to do this with a shell
@%script.
So, let's create the directories first.

@d parameters in Makefile @{@%
MKDIR = mkdir -p

@| MKDIR @}



@d make targets @{@%
DIRS = @< directories to create @>

\$(DIRS) : 
	\$(MKDIR) \$@@

@| DIRS @}


@d make targets @{@%
sources : m4_progname.w \$(DIRS)
@%	cp ./createdirs m4_bindir/createdirs
@%	cd m4_bindir && chmod 775 createdirs
@%	m4_bindir/createdirs
	\$(NUWEB) m4_progname.w
	@< make scripts executable @>

jetty : sources
	cd .. && mvn jetty:run

@| @}

@%@o createdirs @{@%
@%#/bin/bash
@%# createdirs -- create directories
@%`#' m4_header
@%@< create directories @>
@%@| @}


\section{References}
\label{sec:references}

\subsection{Literature}
\label{sec:literature}

\bibliographystyle{plain}
\bibliography{m4_progname}

\subsection{URL's}
\label{sec:urls}

\begin{description}
\item[Nuweb:] \url{m4_nuwebURL}
\item[Apache Velocity:] \url{m4_velocityURL}
\item[Velocitytools:] \url{m4_velocitytoolsURL}
\item[Parameterparser tool:] \url{m4_parameterparserdocURL}
\item[Cookietool:] \url{m4_cookietooldocURL}
\item[VelocityView:] \url{m4_velocityviewURL}
\item[VelocityLayoutServlet:] \url{m4_velocitylayoutservletURL}
\item[Jetty:] \url{m4_jettycodehausURL}
\item[UserBase javadoc:] \url{m4_userbasejavadocURL}
\item[VU corpus Management development site:] \url{http://code.google.com/p/vucom} 
\end{description}

\section{Indexes}
\label{sec:indexes}


\subsection{Filenames}
\label{sec:filenames}

@f

\subsection{Macro's}
\label{sec:macros}

@m

\subsection{Variables}
\label{sec:veriables}

@u

\end{document}

% Local IspellDict: british 

% LocalWords:  Webcom
