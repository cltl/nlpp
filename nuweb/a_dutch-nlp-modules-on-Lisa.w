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
\newcommand{\EHU}{\textsc{ehu}}
\newcommand{\NAF}{\textsc{naf}}
\newcommand{\NED}{\textsc{ned}}
\newcommand{\NLP}{\textsc{nlp}}
\title{\thedoctitle}
\author{\theauthor}
\date{m4_docdate}
m4_include(texinclusions.m4)m4_dnl
\begin{document}
\maketitle
\begin{abstract}
  This is a description and documentation of the installation of the current \NLP{}
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
@%        Tokenizer          & \verb|m4_tokenizerdir| & Github    &   m4_tokenizerscript  &               \\
       Tokenizer          & \verb|m4_tokenizerdir| & \EHU{}    & m4_tokenizerscript  &               \\
       morphosyntactic parser     & \verb|m4_morphpardir|  & Github    & \verb|m4_morphparscript|   &   \\
       alpinohack         & \verb|clean_hack|      & This doc. &  m4_alpinohackscript  & \footnote{not a  module, but an
                                                                                          encoding hack} \\
       \textsc{nerc}       & \verb|m4_jardir|      & \textsc{tar} & m4_nercscript     & \\
       \textsc{wsd}       & \verb|m4_wsddir|       & \textsc{tar} & m4_wsdscript      & \\
       Onto               & \verb|m4_ontodir|      & \textsc{tar} & m4_ontoscript     & \\
       Heidel             & \verb|m4_heideldir|    & Github       & m4_heidelscript   & \\
       \textsc{srl}       & \verb|m4_srldir|       & Github       & m4_srlscript      & \\
       \textsc{ned}       & \verb|m4_neddir|       & \EHU{}       & m4_nedscript      & \\
       Nom. coref         & \verb|m4_ncorefsrc|    & None         &  m4_ncorefscript  & \\  
       Ev. coref          & \verb|m4_evcorefsrc|   & None         &  m4_evcorefscript & \\  
       Opinion miner      & \verb|m4_opinisrc|   & None           &  m4_opiniscript   & \\  
       Framenet sem. role label. &  \verb|m4_fsrlsrc|   & None      &  m4_fsrlscript  & \\  
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
the origin of the module. The modules are obtained in one of the following ways:


\begin{enumerate}
\item If possible, the module is directly obtained from an open-source repository like Github.
\item Some modules are available from the dedicated repository on \href{m4_ehu_rep_url}. A username and password are needed to access these modules. This is indicated as \EHU{}.
\item Some modules have not been officially published in a repository or the repositrory is not yet known by the author. These modules have been packed in a tar-ball that can be obtained by the author. This is indicated as \textsc{tar}.
\end{enumerate}

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
\item[nuweb:] This directory contains this document and everything to
  create the pipeline from the open sources of the modules.
\item[modules:] Contains the program code of each module in a
  subdirectory. Furthermore, it contains a subdirectory
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

@d directories to create @{m4_moddir @| @}
@d directories to create @{m4_bindir @| @}
@d directories to create @{m4_usrlocaldir @| @}
@d directories to create @{m4_usrlocaldir<!!>/bin @| @}
@d directories to create @{m4_usrlocaldir<!!>/lib @| @}
@d directories to create @{m4_moddir/python m4_jardir @| @}

Make binaries findable:

@d set local bin directory @{@%
export PATH=m4_ausrlocaldir<!!>/bin:$PATH
@| @}


\section{Java and Python environment}
\label{sec:environment}

To be independent from the software environment of the host computer
and to perform reproducible processing, the pipeline features its own
Java and Python environment. The costs of this feature are that the
pipeline takes more disk-space by reproducing infra-structure that is
already present in the system and that installation takes more time.

The following file sets up the programming environment in scripts.

@o m4_bindir/progenv @{@%
PIPEROOT=m4_aprojroot
PIPEBIN=$PIPEROOT/bin
PIPEMODD=$PIPEROOT/modules
@< set up java environment in scripts@>
@< activate the python environment @>
@| @}

@d set up programming environment @{@%
source m4_abindir/progenv
@| @}


\subsection{Java}
\label{sec:java}

To install Java, download \texttt{m4_javatarball} from
\href{m4_javatarballurl}. Find it in the root directory and unpack it
in a subdirectory of \texttt{m4_aenvdir}.

@d directories to create @{m4_javadir @| @}


@d check this first @{@%
if
  [ ! -e m4_aprojroot/m4_javatarball ]
then
  echo "Cannot find  m4_aprojroot/m4_javatarball"
  exit 4
fi
@| @}



@d set up java @{@%
@< unpack the java tarball @>
@| @}

@d unpack the java tarball @{@%
cd m4_aenvdir/java
tar -xzf m4_aprojroot/m4_javatarball
@| @}

@d set up java environment in scripts @{@%
export JAVA_HOME=m4_ajavadir/m4_javajdk
export PATH=$JAVA_HOME/bin:$PATH
@| JAVA_HOME @}

Put jars in the jar subdirectory of the java directory:

@d directories to create @{m4_jardir @| @}

@d set up java environment in scripts @{@%
export JARDIR=m4_ajardir
@| @}



\subsection{Maven}
\label{sec:Maven}

@d directories to create @{m4_mavendir @| @}


@d install maven @{@%
cd m4_aenvdir
wget m4_maventarballurl
tar -xzf m4_maventarball
rm m4_maventarball
@| @}

@d install maven @{@%
export MAVEN_HOME=m4_mavendir
export PATH=${MAVEN_HOME}/bin:${PATH}
@| @}


@d remove maven @{@%
rm -rf m4_mavendir
@| @}



\subsection{Python}
\label{sec:python}

@d set up python @{@%
@< create a virtual environment for Python @>
@< activate the python environment @>
@< install kafnafparserpy @>
@< install python packages @>
@| @}



\subsubsection{Virtual environment}
\label{sec:pythonvirtenv}

Create a virtual environment.

@d create a virtual environment for Python @{@%
@< test whether virtualenv is present on the host @>
cd m4_aenvdir
virtualenv venv
@| @}

@d test whether virtualenv is present on the host @{@%
which virtualenv
if
  [ $? -ne 0 ]
then
  echo Please install virtualenv
  exit 1
fi
@|virtualenv @}


@d activate the python environment @{@%
source m4_aenvdir/venv/bin/activate
@|activate @}

@% @d de-activate the python environment @{@%
@% deactivate
@% @| @}

Subdirectory \texttt{m4_aenvdir/python} will contain general Python
packages like KafnafParserPy.

@d directories to create @{m4_aenvdir/python @| @}

Activation of Python include pointing to the place where Python
packages are:

@d activate the python environment @{@%
export PYTHONPATH=m4_aenvdir/python:\$PYTHONPATH
@|PYTHONPATH @}


\subsubsection{KafNafParserPy}
\label{sec:KafNafParserPy}

@% Currently the pipeline uses Python as it has been installed on the
@% host. This has to be changed and a virtual environment has to be
@% used. Let us reserve directory \verb|modules/python| for Python
@% utility modules. 
@% 
@% Make Python utilities findable with the following macro:
@% 
@% @d set pythonpath @{@%
@% export PYTHONPATH=m4_pythonmoddir:\$PYTHONPATH
@% @| @}

A cornerstone Pythonmodule for the pipeline is
\href{https://github.com/cltl/KafNafParserPy}{KafNafParserPy}. It is a
feature of this module that it cannot be installed with \textsc{pip}, but that
you can put it somewhere and then put the somewhere in your \textsc{pythonpath}.


@d install kafnafparserpy @{@%
@% cd m4_pythonmoddir
cd m4_aenvdir/python
DIRN=KafNafParserPy
@< move module @($DIRN@) @>
git clone m4_kafnafgit
if
  [ $? -gt 0 ]
then
  @< logmess @(Cannot install current $DIRN version@) @>
  @< re-instate old module @(\$DIRN@) @>
else
  @< remove old module @(\$DIRN@) @>
fi
@| @}

\subsubsection{Python packages}
\label{sec:pypacks}

Install python packages:

\begin{description}
\item[lxml:]
\item[pyyaml:] for coreference-graph
\end{description}


@d install python packages @{@%
pip install lxml
pip install pyyaml
@| lxml pyyaml @}



\section{Installation}
\label{sec:install}

This section describes how the modules are obtained from their
(open-)source and installed. 

\subsection{Installing vs. updating}
\label{sec:installvsupdate}

When the install-script installs something that has already been
installed, it moves the installed module to a temporary location and
then tries to install the module from its source. If that is
successfull it removes the vormer version of the module, otherwise it
moves the old version back. 

The following macro's can be used to move or remove modules, provided
they are called when the modules directory is the default directory. 

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


\subsection{Installation from Github}
\label{sec:installfromgithub}

The following macro can be used to install a module from github. It
needs as parameters:
\begin{enumerate}
\item Name of the module.
\item Name of the root directory.
\item Github \URL{} to clone from.
\end{enumerate}


@d install from github @{@%
MODNAM=@1
DIRN=@2
GITU=@3
cd m4_amoddir
@% @< cd to the modules directory @>
@< move module @(\$DIRN@) @>
git clone $GITU
if
  [ $? -gt 0 ]
then
  @< logmess @(Cannot install current $MODNAM version@) @>
  @< re-instate old module @(\$DIRN@) @>
else
  @< remove old module @(\$DIRN@) @>
fi

@| @}

@% @d cd to the modules directory @{@%
@% cd m4_amodd
@% @| @}



@% @d cd to the modules directory @{@%
@% @< find leave and tree @>
@% @< logmess @("TREE: \$TREE; LEAVE: \$LEAVE"@) @>
@% cd $TREE
@% @| @}
@% 
@% Note: Par.~1: Directory; par~2: path to directory; par~3: directory name.
@% 
@% @d find leave and tree @{@%
@% FULLDIR=m4_amoddir/$DIRN
@% LEAVE=${FULLDIR##*/}
@% TREE=${FULLDIR%%\$LEAVE}
@% @| @}


@% \subsection{Installation from EHU}
@% \label{sec:installfromEHU}
@% 
@% Get a module from the home of the pipeline-VM control center at
@% \EHU{}. From this control center standardised virtual machines to
@% process texts can obtain the latest versions of the modules. The
@% \textsc{url} of the control center is \url{m4_ehu_rep_url}. The
@% modules can be found in subdirectory \texttt{m4_ehu_modules_directory}
@% of the home-directory of user \texttt{m4_ehu_user}.


\subsection{Installation from EHU}
\label{sec:installfromehu}

Some of the modules cannot be easily obtained available on Github, but
there is a complete package on EHU. 


@% \begin{verbatim}
@% scp -r -P 2223 "newsreader@u017940.si.ehu.es:components/EHU-tok
@% \end{verbatim}

\subsection{Installation from the snapshot}
\label{sec:snapshotinstall}

For some modules a public repository is not available or not
known. They must be installed from a tarball with snapshots that can
be obtained from the author. Let us first check whether we have the
snapshot and complain if we don't. We expect the file
\verb|m4_aprojroot/m4_snapshot_tarball|.


@d unpack snapshots or die @{@%
cd m4_aprojroot
if
  [ -e m4_snapshot_tarball ]
then
  tar -zxf m4_snapshot_tarball
fi
if
  [ ! -e m4_snapshotdir ]
then
  echo "No module snapshots"
  exit 1
fi
@| @}





\subsection{The installation script}
\label{sec:installscript}

The installation is performed by script \verb|m4_module_installer|


@o m4_bindir/m4_module_installer @{@%
#!/bin/bash
echo Set up environment
@< variables of m4_module_installer @>
@< check this first @>
@% @< unpack snapshots or die @>
@% echo ... Java
@% @< set up java @>
@< set up java environment in scripts @>
@% @< install maven @>
@% echo ... Python
@% @< set up python @>
@% echo ... Alpino
@% @< install Alpino @>
@< install the spotlight server @>
@% echo Tokenizer
@% @< install the tokenizer @>
@% echo Morphosyntactic parser
@% @< install the morphosyntactic parser @>
@% @< install the NERC module @>
@% @% @< install coreference-base @>
@% @< install the WSD module @>
@% @< install the onto module @>
@% @< install the heideltime module @>
@< install the srl module @>
@< install the \NED{} module @>
@% @< install the lu2synset converter @>
@% @< install the treetagger utility @>
@< install the ticcutils utility @>
@< install the timbl utility @>
@% @< remove maven @>

@| @}

@d make scripts executable @{@%
chmod 775  m4_bindir/m4_module_installer
@| @}


\subsection{Install utilities and resources}
\label{sec:utilitiesandresources}

\subsubsection{Alpino}
\label{sec:install-alpino}

Install Alpino from the website of Gertjan van Noort.

\paragraph{Module}
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



\subsection{Install modules}
\label{sec:installmodules}



\subsubsection{Install tokenizer}
\label{sec:installtokenizer}

\paragraph{Module}
\label{par:install-tokenizermodule}

The tokenizer is just a jar that has to be run in Java. Although  the
jar is directly available from \url{http://ixa2.si.ehu.es/ixa-pipes/download.html}, we
prefer to compile the package in order to make this thing ready for
reproducible set-ups. 

Not yet included in this script is the set-up of an environment to use
the specified version of Java (Oracle 1.7) and Maven (3). For now, we
assume that it is there. This is a todo item.

To install the tokenizer, we proceed as follows:

\begin{enumerate}
\item Clone the source from github into a temporary directory.
\item Compile to produce the jar file with the tokenizer.
\item move the jar file into the jar directory.
\item remove the tempdir with the sourcecode.
\end{enumerate}

@d install the tokenizer @{@%
@% @< install from github @(tokenizer@,m4_tokenizerdir@,m4_tokenizergit@) @>
tempdir=`mktemp -d -t tok.XXXXXX`
cd \$tempdir
git clone m4_tokenizergit
cd m4_tokenizerdir
mvn clean package
mv target/m4_tokenizerjar m4_ajardir
cd m4_aprojroot
@% rm -rf \$tempdir
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

\paragraph{Script}
\label{par:tokenizerscript}

The script runs the tokenizerscript.

@o m4_bindir/m4_tokenizerscript @{@%
#!/bin/bash
@< set up programming environment @>
JARFILE=m4_ajardir/m4_tokenizerjar
java -jar \$JARFILE tok -l nl --inputkaf
@| @}

@d make scripts executable @{@%
chmod 775  m4_bindir/m4_tokenizerscript
@| @}



\subsubsection{Morphosyntactic parser}
\label{sec:install-morphsynt-parser}


\paragraph{Module}
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

\paragraph{Script}
\label{sec:morphparserscript}

@o m4_bindir/m4_morphparscript @{@%
#!/bin/bash
@< set up programming environment @>
ROOT=m4_aprojroot
MODDIR=m4_amoddir/<!!>m4_morphpardir<!!>
@< set alpinohome @>
cat | python \$MODDIR/core/morph_syn_parser.py
@| @}

@d make scripts executable @{@%
chmod 775  m4_bindir/m4_morphparscript
@| @}

\subsubsection{Alpino hack}
\label{sec:alpinohack}

Install a hack that removes output from Alpino that cannot be
interpreted by following modules. It is just a small python
script. Actually, it may no longer be necessary.

\paragraph{Module}
\label{par:install_alpinohack}

@d directories to create @{m4_moddir/m4_alpinohackdir @| @}

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

\paragrqph{Script}
\label{par:alpinohack-script}

@o m4_bindir/m4_alpinohackscript @{@%
#!/bin/bash
ROOT=m4_aprojroot
HACKDIR=m4_amoddir/m4_alpinohackdir
cat | python  \$HACKDIR/clean_hack.py 

@| @}

@d make scripts executable @{@%
chmod 775  m4_bindir/m4_alpinohackscript
@| @}


\subsubsection{Nominal coreference-base}
\label{sec:nomcorefgraph}

Get this thing from Github
(\url{https://github.com/opener-project/coreference-base/}) and use
the instruction of
\url{https://github.com/opener-project/coreference-base/blob/master/core/README.md}.


\paragraph{Module}

@d install coreference-base @{@%
@< install from github @(coreference-base@,m4_corefbasedir@,m4_corefbasegit@) @>
@% pip install --upgrade --user hg+https://bitbucket.org/Josu/pykaf#egg=pykaf
@% pip install --upgrade --user networkx
pip install --upgrade  hg+https://bitbucket.org/Josu/pykaf#egg=pykaf
pip install --upgrade  networkx
@| @}


\paragraph{Script}

@o m4_bindir/m4_corefbasescript @{@%
#!/bin/bash
@< set up programming environment @>
cd $PIPEMODD/m4_corefbasedir/core
cat | python -m corefgraph.process.file --language nl --singleton --sieves NO
@| @}

@d make scripts executable @{@%
chmod 775  m4_bindir/m4_corefbasescript
@| @}


\subsubsection{Named entity recognition (NERC)}
\label{sec:nerc}

\paragraph{Module}
\label{sec:nercmodule}

The  Nerc program can be installed from Github
(\url{m4_nercgit}). However, the model that is needed is not publicly
available. Therefore, the Nerc module of the standard English
pipeline, that is not yet public available, has been put in the snapshot-tarball.


@% @d install the NERC module @{@%
@% cd m4_amoddir
@% git clone m4_nercgit
@% cd m4_nercdir
@% mvn clean
@% @| @}


@d install the NERC module @{@%
@< compile the nerc jar @>
@< get the nerc models @>

cp -r m4_asnapshotroot/m4_nercdir  m4_amoddir/
@| @}

@d compile the nerc jar  @{@%
TEMPDIR==`mktemp -d -t nerc.XXXXXX`
cd $TEMPDIR
git clone m4_nercgit
cd ixa-pipe-nerc/
mvn clean package
mv target/m4_nercjar m4_ajardir/
cd m4_aprojroot/nuweb
rm -rf $TEMPDIR
@| @}

@d get the nerc models @{@%
mkdir -p m4_moddir/m4_nercdir
cp -r m4_asnapshotroot/m4_nercdir/m4_nercmodeldir m4_moddir/m4_nercdir
@| @}



\paragraph{Script}
\label{sec:nercscript}

@% Unfortunately, this module does not accept
@% the \NAF{} version that the previous module supplies. 
@% 
@% @d gawk script to patch NAF for nerc module @{@%
@% patchscript='{gsub("wf id=", "wf wid="); gsub("term id=", "term tid="); print}'
@% @| @}


@o m4_bindir/m4_nercscript @{@%
#!/bin/bash
@< set up programming environment @>
MODDIR=$PIPEMODD/m4_nercdir
JAR=$JARDIR/m4_nercjar
MODEL=m4_nercmodel
@% @< gawk script to patch NAF for nerc module @>
@% cat | gawk "$patchscript" | java -jar \$JARDIR/m4_nercjar tag
cat | java -jar \$JAR tag -m $MODDIR/m4_nercmodeldir/nl/$MODEL
@| @}



@d make scripts executable @{@%
chmod 775  m4_bindir/m4_nercscript
@| @}


\subsection{Wordsense-disambiguation}
\label{sec:wsd}

Install WSD from its Github source (\href{m4_wsdgit}). According to
the \texttt{readme} of that module, the next thing to do is, to
execute install-script \texttt{install.sh} or
\texttt{install_naf.sh}. The latter script installs a
``Support-Vector-Machine'' (\textsc{svm}) module, ``Dutch-SemCor''
(\textsc{dsc}) models and KafNafParserPy.  


\subsubsection{Module}
\label{sec:wsd-module}


@%  4209  2014-11-08 16:55:05 cat input.naf | python dsc_wsd_tagger.py |less
@%  4210  2014-11-08 16:55:57 less install_naf.sh 
@%  4211  2014-11-08 17:18:48 ./install_naf.sh 
@%  4212  2014-11-09 09:34:25 cat naf_example.xml | python dsc_wsd_tagger.py --naf > ../output.naf
@%  4213  2014-11-09 09:34:32 less ../output.naf 
@%  4214  2014-11-09 09:46:53 ls /mnt/kyoto/projecten/pipelines/dutch-nlp-modules-on-Lisa/test
@%  4215  2014-11-09 09:47:56 cat /mnt/kyoto/projecten/pipelines/dutch-nlp-modules-on-Lisa/test/test.nerc.naf | python dsc_wsd_tagger.py --naf > ../output.naf
@%  4216  2014-11-09 09:48:03 less ../output.naf 

@d install the WSD module @{@%
@< install from github @(wsd@,m4_wsddir@,m4_wsdgit@) @>
cd m4_amoddir/m4_wsddir
@< install svm lib @>
@< download svm models @>


@| @}


This part has been copied from [[install_naf.sh]] in the \textsc{wsd} module.

@d install svm lib @{@%
mkdir lib
cd lib
wget --no-check-certificate  https://github.com/cjlin1/libsvm/archive/master.zip 2>/dev/null
zip_name=`ls -1 | head -1`
unzip $zip_name > /dev/null
rm $zip_name
folder_name=`ls -1 | head -1`
mv $folder_name libsvm
cd libsvm/python
make > /dev/null 2> /dev/null
echo LIBSVM installed correctly lib/libsvm
@| @}

This part has also been copied from [[install_naf.sh]] in the \textsc{wsd} module.

@d download svm models @{@%
cd m4_amoddir/m4_wsddir
echo 'Downloading models...(could take a while)'
wget --user=cltl --password='.cltl.' kyoto.let.vu.nl/~izquierdo/models_wsd_svm_dsc.tgz 2> /dev/null
echo 'Unzipping models...'
tar xzf models_wsd_svm_dsc.tgz
rm models_wsd_svm_dsc.tgz
echo 'Models installed in folder models'

@| @}




\subsubsection{Script}
\label{sec:wsdscript}

@o m4_bindir/m4_wsdscript @{@%
#!/bin/bash
# WSD -- wrapper for word-sense disambiguation
# 8 Jan 2014 Ruben Izquierdo
# 16 sep 2014 Paul Huygen
@< set up programming environment @>
WSDDIR=$PIPEMODD/m4_wsddir
WSDSCRIPT=dsc_wsd_tagger.py
cat | python $WSDDIR/$WSDSCRIPT --naf 
@| @}

@d make scripts executable @{@%
chmod 775  m4_bindir/m4_wsdscript
@| @}

@% \subsubsection{Script}
@% \label{sec:wsdscript}
@% 
@% @o m4_bindir/m4_wsdscript @{@%
@% #!/bin/bash
@% # WSD -- wrapper for word-sense disambiguation
@% # 8 Jan 2014 Ruben Izquierdo
@% # 16 sep 2014 Paul Huygen
@% ROOT=m4_aprojroot
@% WSDDIR=m4_amoddir/m4_wsddir
@% WSDSCRIPT=kaf_annotate_senses.pl
@% UKB=\$WSDDIR/ukb_wsd_2.0
@% POSMAP=$WSDDIR/posmap.NGV.txt
@% 
@% if [ "$1" = "nl" ]
@% then
@%   GRAPH=\$WSDDIR/cdb2.0-nld-all.infv.0.0.no-allwords.bin
@%   DICT=\$WSDDIR/dictionary
@% else
@%   GRAPH=\$WSDDIR/wn30g_eng.v20.bin
@%   DICT=\$WSDDIR/wn30_eng_dict.txt
@% fi
@% 
@% iconv -t utf-8//IGNORE | \$WSDDIR/\$WSDSCRIPT -x \$UKB -M \$GRAPH -W \$DICT -m \$POSMAP
2@% @| @}
@% 
@% @d make scripts executable @{@%
@% chmod 775  m4_bindir/m4_wsdscript
@% @| @}


@% We do not yet have a source-repository of the wsd module. Therefore,
@% install from a snapshot on Lisa.
@% 
@% \subsubsection{Module}
@% \label{sec:wsd-module}
@% 
@% @d install the WSD module @{@%
@% @%cp -r m4_asnapshotroot/m4_wsddir m4_amoddir/
@% cp -r m4_aprojroot/m4_snapshotdir/m4_wsddir m4_amoddir/
@% @| @}
@% 
@% 
@% \subsubsection{Script}
@% \label{sec:wsdscript}
@% 
@% @o m4_bindir/m4_wsdscript @{@%
@% #!/bin/bash
@% # WSD -- wrapper for word-sense disambiguation
@% # 8 Jan 2014 Ruben Izquierdo
@% # 16 sep 2014 Paul Huygen
@% ROOT=m4_aprojroot
@% WSDDIR=m4_amoddir/m4_wsddir
@% WSDSCRIPT=kaf_annotate_senses.pl
@% UKB=\$WSDDIR/ukb_wsd_2.0
@% POSMAP=$WSDDIR/posmap.NGV.txt
@% 
@% if [ "$1" = "nl" ]
@% then
@%   GRAPH=\$WSDDIR/cdb2.0-nld-all.infv.0.0.no-allwords.bin
@%   DICT=\$WSDDIR/dictionary
@% else
@%   GRAPH=\$WSDDIR/wn30g_eng.v20.bin
@%   DICT=\$WSDDIR/wn30_eng_dict.txt
@% fi
@% 
@% iconv -t utf-8//IGNORE | \$WSDDIR/\$WSDSCRIPT -x \$UKB -M \$GRAPH -W \$DICT -m \$POSMAP
@% @| @}
@% 
@% @d make scripts executable @{@%
@% chmod 775  m4_bindir/m4_wsdscript
@% @| @}

\subsection{Lexical-unit converter}
\label{sec:lu2synset}

\subsubsection{Module}
\label{sec:lu2synsetinstaller}

There is not an official repository for this module yet, so copy the
module from the tarball.

@d install the lu2synset converter @{@%
cp -r m4_asnapshotroot/m4_lu2syndir m4_amoddir/
@| @}

\subsubsection{Script}
\label{sec:lu2synsetscript}

@o m4_bindir/m4_lu2synsetscript  @{@%
#!/bin/bash
ROOT=m4_aprojroot
JAVALIBDIR=m4_amoddir/m4_lu2syndir/lib
RESOURCESDIR=m4_amoddir/m4_lu2syndir/resources
JARFILE=WordnetTools-1.0-jar-with-dependencies.jar
java -Xmx812m -cp  $JAVALIBDIR/$JARFILE vu.wntools.util.NafLexicalUnitToSynsetReferences \
   --wn-lmf "\$RESOURCESDIR/cornetto2.1.lmf.xml" --format naf 
@| @}


\subsection{Spotlight}
\label{sec:spotlight}

Install Spotlight as described on the readme of \texttt{ixa-pipe-ned}.

@d install the spotlight server @{@%
mkdir -p m4_spotlightdir
cd m4_aspotlightdir
wget m4_spotlight_download_url/m4_spotlightjar
wget m4_spotlight_download_url/m4_spotlight_nl_model
tar -xzf m4_spotlight_nl_model
wget m4_spotlight_download_url/m4_spotlight_en_model
tar -xzf m4_spotlight_en_model
MVN_SPOTLIGHT_OPTIONS="-Dfile=m4_spotlightjar"
MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -DgroupId=ixa"
MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -DartifactId=dbpedia-spotlight"
MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -Dversion=m4_spotlightjarversion"
MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -Dpackaging=jar"
MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -DgeneratePom=true"


#mvn install:install-file -Dfile=dbpedia-spotlight-0.7.jar -DgroupId=ixa -DartifactId=dbpedia-spotlight -Dversion=0.7 -Dpackaging=jar -DgeneratePom=true 
mvn install:install-file $MVN_SPOTLIGHT_OPTIONS


@| @}

@% Spotlight is not itself a pipeline-module, but it is needed in the
@% \NED{} module. Now I make a shortcut from the snapshot.

@% @d install the spotlight server @{@%
@% cp -r m4_asnapshotroot/m4_spotlight_snapdir  m4_amoddir/
@% @| @}

@d start the spotlight server @{@%
cd m4_aspotlightdir
java  -Xmx8g -jar m4_spotlightjar nl http://localhost:m4_spotlight_nl_port/rest
java -jar -Xmx8g dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar nl http://localhost:2060/rest  &
@% java -jar -Xmx8g dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar nl http://localhost:2060/rest  &
@| @}



@d check/start the spotlight server @{@%
spottasks=`netstat -an | grep :m4_spotlight_nl_port | wc -l`
if
  [ $spottasks -eq 0 ]
then
  @< start the spotlight server @>
  sleep 180
fi
@| @}

\subsection{NED}
\label{sec:onto}

The \NED{} module wants to consult the dbpedia spotlight server, so
that one has to be installed somewhere. For this moment, let us
suppose that it has been installed on localhost.




@% \subsubsection{Installation of the spotlight server}
@% \label{sec:spotlightinstall}

@% Itziar Aldabe (\href{mailto:itziar.aldabe@@ehu.es}) wrote:
@% 
@% \begin{quotation}
@% The NED module works for English, Spanish, Dutch and Italian. The
@% module returns multiple candidates and correspondences for all the
@% languages. If you want to integrate it in your Dutch or Italian
@% pipeline, you will need:
@% 
@% \begin{enumerate}
@% \item The jar file with the dbpedia-spotlight server. You need the
@%   version that Aitor developed in order to correctly use the "candidates"
@%   option. You can copy it from the English VM. The jar file name is
@%   \verb|dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar|
@% \item The Dutch/Italian model for the dbpedia-spotlight. You can download them from:
@%     \href{http://spotlight.sztaki.hu/downloads/}
@% \item The jar file with the NED module:
@%     \verb|ixa-pipe-ned-1.0.jar|. You can copy it from the English VM
@%     too.
@% \item The file: \verb|wikipedia-db.v1.tar.gz|. You can download it
@%   from:
@%   \href{http://ixa2.si.ehu.es/ixa-pipes/models/wikipedia-db.v1.tar.gz}. This
@%   file contains the required information to do the mappings between
@%   the wikipedia-entries. The zip file contains three files:
@%   wikipedia-db, wikipedia-db.p and wikipedia-db.t
@% \end{enumerate}
@% 
@% To start the dbPeadia server:
@%     Italian server: java -jar -Xmx8g dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar it http://localhost:2050/rest 
@%     Dutch server:  java -jar -Xmx8g dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar nl http://localhost:2060/rest 
@% 
@%     We set 8Gb for the English server, but the Italian and Dutch spotlight will require less memory. 
@% 
@% 
@% 
@%     To run the NED module
@% 
@%     Italian:
@%     cat file.naf | java -jar ixa-pipe-ned-1.0.jar -p 2050 -e candidates -i $dir/wikipedia-db -n itEn
@% 
@%     Dutch:
@%     cat file.naf | java -jar ixa-pipe-ned-1.0.jar -p 2060 -e candidates -i $dir/wikipedia-db -n nlEn
@% 
@%     where $dir refers to the directory the wikipedia-db* files are. 
@% 
@% Please, let me know if something is not clear or something doesn't work properly.
@% 
@% Regards,
@% Itziar
@% \end{quotation}



\subsubsection{Module}
\label{sec:ned-module}

@% @d install the \NED{} module @{@%
@% cp m4_asnapshotroot/m4_neddir/m4_nedjar m4_ajardir/
@% mkdir -p m4_amoddir/m4_neddir
@% cd m4_amoddir/m4_neddir
@% wget http://ixa2.si.ehu.es/ixa-pipes/models/wikipedia-db.v1.tar.gz
@% tar -xzf wikipedia-db.v1.tar.gz
@% @| @}

@d install the \NED{} module @{@%
@< install from github @(ned@,m4_neddir@,m4_nedgit@) @>
cd m4_amoddir/m4_neddir
mvn -Dmaven.compiler.target=m4_maven_javaversion -Dmaven.compiler.source=m4_maven_javaversion clean package
mv target/ixa-pipe-ned-`'m4_ned_version.jar m4_ajardir/ 
@% cp m4_asnapshotroot/m4_neddir/m4_nedjar m4_ajardir/
@% @% mkdir -p m4_amoddir/m4_neddir
@% wget http://ixa2.si.ehu.es/ixa-pipes/models/wikipedia-db.v1.tar.gz
@% tar -xzf wikipedia-db.v1.tar.gz
@| @}


\subsubsection{Script}
\label{sec:nedscript}

@o m4_bindir/m4_nedscript @{@%
#!/bin/bash
ROOT=m4_aprojroot
JARDIR=m4_ajardir
@< check/start the spotlight server @>
cat | java -jar \$JARDIR/m4_nedjar  -p 2060 -e candidates -i m4_amoddir/m4_neddir/wikipedia-db -n nlEn
@| @}


@d make scripts executable @{@%
chmod 775  m4_bindir/m4_nedscript
@| @}



\subsection{Ontotagger}
\label{sec:onto}

We do not yet have a source-repository of the Ontotagger module. Therefore,
install from a snapshot (\texttt{m4_ontotarball}).

\subsubsection{Module}
\label{sec:ontotagger-module}

@d install the onto module @{@%
@%cp -r m4_asnapshotroot/m4_ontodir m4_amoddir/
cd m4_amoddir
tar -xzf m4_aprojroot/m4_snapshotdir/m4_ontotarball
cp -r m4_aprojroot/m4_snapshotdir/m4_ontodir m4_amoddir/
chmod -R o+r m4_amoddir
@| @}


\subsubsection{Script}
\label{sec:ontoscript}

@o m4_bindir/m4_ontoscript @{@%
#!/bin/bash
@< set up programming environment @>
ROOT=m4_aprojroot
ONTODIR=$PIPEMODD/m4_ontodir
JARDIR=\$ONTODIR/lib
RESOURCESDIR=\$ONTODIR/resources
@% PREDICATEMATRIX="\$RESOURCESDIR/PredicateMatrix.v1.1/PredicateMatrix.v1.1.role.nl-1.merged"
PREDICATEMATRIX="\$RESOURCESDIR/PredicateMatrix_nl_lu_withESO.v0.2.role.txt"
GRAMMATICALWORDS="\$RESOURCESDIR/grammaticals/Grammatical-words.nl"
TMPFIL=`mktemp -t stap6.XXXXXX`
cat >$TMPFIL

CLASSPATH=\$JARDIR/ontotagger-1.0-jar-with-dependencies.jar
JAVASCRIPT=eu.kyotoproject.main.KafPredicateMatrixTagger

@% JAVA_ARGS="-Xmx1812m"
@% JAVA_ARGS=\$JAVA_ARGS " -cp \$JARDIR/ontotagger-1.0-jar-with-dependencies.jar"
@% JAVA_ARGS=\$JAVA_ARGS " eu.kyotoproject.main.KafPredicateMatrixTagger"
@% JAVA_ARGS="--mappings \"fn;pb;nb\" "
JAVA_ARGS="--mappings \"fn;mcr;ili;eso\" "
JAVA_ARGS="\$JAVA_ARGS  --key odwn-eq"
JAVA_ARGS="\$JAVA_ARGS  --version 1.1"
JAVA_ARGS="\$JAVA_ARGS  --predicate-matrix \$PREDICATEMATRIX"
JAVA_ARGS="\$JAVA_ARGS  --grammatical-words \$GRAMMATICALWORDS"
JAVA_ARGS="\$JAVA_ARGS  --naf-file \$TMPFIL''
java -Xmx1812m -cp \$CLASSPATH \$JAVASCRIPT \$JAVA_ARGS


@% java -Xmx812m -cp ../lib/ontotagger-1.0-jar-with-dependencies.jar eu.kyotoproject.main.KafPredicateMatrixTagger --mappings "fn;mcr;ili;eso" --key odwn-eq --version 1.1 --predicate-matrix "../resources/PredicateMatrix_nl_lu_withESO.v0.2.role.txt" --grammatical-words "../resources/grammaticals/Grammatical-words.nl" --naf-file "../example/test.srl.lexicalunits.naf" > "../example/test.srl.lexicalunits.pm.naf"


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
chmod 775  m4_bindir/m4_ontoscript
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
@< activate the python environment @>
iconv -t utf-8//IGNORE | python \$HEIDELDIR/HeidelTime_NafKaf.py \$HEIDELDIR/heideltime-standalone/ \$TEMPDIR
@| @}

@d make scripts executable @{@%
chmod 775  m4_bindir/m4_heidelscript
@| @}

\subsection{Semantic Role labelling}
\label{sec:SRL}

\subsubsection{Module}
\label{sec:SRL-module}

@d install the srl module @{@%
@< install from github @(srl@,m4_srldir@,m4_srlgit@) @>
@%cp -r m4_asnapshotroot/m4_srldir m4_amoddir/
@| @}


\subsubsection{Script}
\label{sec:SRLscript}


First:
\begin{enumerate}
\item set the correct environment. The module needs python and timble.
\item  create a tempdir and in that dir a file to store the input and a (\textsc{scv}) file with the feature-vector.
\end{enumerate}

@o m4_bindir/m4_srlscript @{@%
#!/bin/bash
ROOT=m4_aprojroot
SRLDIR=m4_amoddir/m4_srldir
TEMPDIR=`mktemp -d -t SRLTMP.XXXXXX`
cd \$SRLDIR
@< set local bin directory @>
@< activate the python environment @>
INPUTFILE=$TEMPDIR/inputfile
FEATUREVECTOR=$TEMPDIR/csvfile
TIMBLOUTPUTFILE=$TEMPDIR/timblpredictions
@| @}

Create a feature-vector.

@o m4_bindir/m4_srlscript @{@%
cat | tee  \$INPUTFILE | python nafAlpinoToSRLFeatures.py > \$FEATUREVECTOR
@| @}

Run the trained model on the feature-vector.

@o m4_bindir/m4_srlscript @{@%
timbl -mO:I1,2,3,4 -i e-mags_mags_press_newspapers.wgt -t \$FEATUREVECTOR -o \$TIMBLOUTPUTFILE >/dev/null 2>/dev/null
@| @}

Insert the \textsc{srl} values into the \textsc{naf} file.

@o m4_bindir/m4_srlscript @{@%
python timblToAlpinoNAF.py \$INPUTFILE \$TIMBLOUTPUTFILE
@| @}


Clean up.

@o m4_bindir/m4_srlscript @{@%
rm -rf \$TEMPDIR
@| @}


@d make scripts executable @{@%
chmod 775  m4_bindir/m4_srlscript
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
TESTDIR=$ROOT/test
BIND=$ROOT/bin
mkdir $TESTDIR
cd $TESTDIR
cat $ROOT/nuweb/testin.naf | $BIND/tok > $TESTDIR/test.tok.naf
cat test.tok.naf | $BIND/mor > $TESTDIR/test.mor.naf
cat test.mor.naf | $BIND/alpinohack > $TESTDIR/test.alh.naf
cat test.mor.naf | $BIND/nerc > $TESTDIR/test.nerc.naf
@% cat $TESTDIR/test.nerc.naf | $BIND/corefgraph > $TESTDIR/test.crg.naf
cat $TESTDIR/test.nerc.naf | $BIND/wsd > $TESTDIR/test.wsd.naf
cat $TESTDIR/test.wsd.naf | $BIND/onto > $TESTDIR/test.onto.naf
@% cat $TESTDIR/test.wsd.naf | $BIND/lu2synset > $TESTDIR/test.l2s.naf
@% cat $TESTDIR/test.l2s.naf | $BIND/ned > $TESTDIR/test.ned.naf
@% cat $TESTDIR/test.ned.naf | $BIND/heideltime > $TESTDIR/test.times.naf
@% cat $TESTDIR/test.times.naf | $BIND/srl  > $TESTDIR/test.srl.naf

@% #!/bin/bash
@% ROOT=m4_aprojroot
@% BIND=\$ROOT/bin
@% echo "De hond eet jus." | \$BIND/tok | \$BIND/mor | \
@% \$BIND/m4_alpinohackscript | \$BIND/m4_nercscript  | \$BIND/m4_wsdscript | \
@% \$BIND/m4_ontoscript  > \$ROOT/test.onto
@% cat \$ROOT/test.onto | \$BIND/m4_heidelscript  > \$ROOT/test.heidel
@% cat \$ROOT/test.heidel | \$BIND/m4_srlscript  > \$ROOT/test.srl
@% cat \$ROOT/test.srl | \$BIND/m4_srlscript  > \$ROOT/test.srl
@% @% \$BIND/m4_ontoscript | \$BIND/m4_heidelscript | \$BIND/m4_srlscrip  > \$ROOT/test.out
@| @}

@d make scripts executable @{@%
chmod 775  m4_bindir/test
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

The location where treetager comes from and the location where it is going to reside:

@d install the treetagger utility @{@%
TREETAGDIR=m4_treetagdir
TREETAG_BASIS_URL=m4_treetag_base_url
TREETAGURL=m4_treetag_base_url
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

Run the install-script:

@d install the treetagger utility @{@%
chmod 775 \$TREETAG_INSTALLSCRIPT
./\$TREETAG_INSTALLSCRIPT
@| @}

Make the treetagger utilities available for everbody.

@d install the treetagger utility @{@%
chmod o+x m4_amoddir/\$TREETAGDIR/bin
chmod o+x m4_amoddir/\$TREETAGDIR/cmd
chmod o+x m4_amoddir/\$TREETAGDIR/doc
chmod o+x m4_amoddir/\$TREETAGDIR/lib
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

\section{Testing}
\label{sec:testing}



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

@% @d parameters in Makefile @{@%
@% NUWEB=m4_nuwebbinary
@% @| @}


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


\subsection{Get Nuweb}
\label{sec:getnuweb}

An annoying problem is, that this program uses nuweb, a utility that
is seldom installed on a computer. Therefore, we are going to install
that first if it is not present. Unfortunately, nuweb is hosted on
sourceforge and it is difficult to achieve automatic downloading from
that repository. Therefore I copied one of the versions on a location
from where it can be downloaded with a script.

@d parameters in Makefile @{@%
NUWEB=m4_bindir/nuweb
@| NUWEB @}

@d expliciete make regels @{@%
$(NUWEB): m4_projroot/m4_nuwebsource
	cd m4_projroot/m4_nuwebsource && make nuweb
	cp m4_projroot/m4_nuwebsource/nuweb $(NUWEB)

@| @}

@d expliciete make regels @{@%
m4_projroot/m4_nuwebsource:
	cd m4_projroot && wget m4_nuweb_download_url
	cd m4_projroot &&  tar -xzf m4_nuwebsource<!!>.tgz

@| @}



@% @d rule to make nuweb @{@%
@% nuweb-exists := \$(shell which nuweb)
@% 
@% install-nuweb:
@% ifdef nuweb-exists
@% 
@% else
@% 	cd m4_aprojroot &&  wget m4_nuweb_download_url
@%         cd m4_aprojroot &&  tar -xzf m4_nuwebsource<!!>.tgz
@%         cd m4_aprojroot/m4_nuwebsource && make nuweb
@%         mv m4_nuwebsource/nuweb m4_bindir
@% 
@% endif
@% 
@% @| @}


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
\$(W2PDF) : m4_progname.w \$(NUWEB)
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
NUWEB=m4_nuwebbinary
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
m4_htmlbibfil : m4_nuwebdir/m4_progname.bib
	cp m4_nuwebdir/m4_progname.bib m4_htmlbibfil

@| @}



Make a dvi file with \texttt{w2html} and then run
\texttt{htlatex}. 

@d expliciete make regels @{@%
m4_htmltarget : m4_htmlsource m4_4htfildest \$(HTML_PS_FIG_NAMES) \$(HTML_PST_NAMES) m4_htmlbibfil
	cp w2html m4_bindir
	cd m4_bindir && chmod 775 w2html
	cd m4_htmldocdir && m4_bindir/w2html m4_progname.w

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
sources : m4_progname.w \$(DIRS) \$(NUWEB)
@%	cp ./createdirs m4_bindir/createdirs
@%	cd m4_bindir && chmod 775 createdirs
@%	m4_bindir/createdirs
	\$(NUWEB) m4_progname.w
	@< make scripts executable @>

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
