m4_include(inst.m4)m4_dnl
m4_sinclude(local.m4)m4_dnl
\documentclass[twoside,oldtoc]{artikel3}
@% \documentclass[twoside]{article}
\pagestyle{headings}
\usepackage{pdfswitch}
\usepackage{figlatex}
\usepackage{makeidx}
\renewcommand{\indexname}{General index}
\makeindex
\newcommand{\thedoctitle}{m4_doctitle}
\newcommand{\theauthor}{m4_author}
\newcommand{\thesubject}{m4_subject}
\newcommand{\AWK}{\textsc{awk}}
\newcommand{\CLTL}{\textsc{cltl}}
\newcommand{\EHU}{\textsc{ehu}}
\newcommand{\NAF}{\textsc{naf}}
\newcommand{\NED}{\textsc{ned}}
\newcommand{\NER}{\textsc{ner}}
\newcommand{\NLP}{\textsc{nlp}}
\newcommand{\SRL}{\textsc{srl}}
\def\CaptionTextFont{\small\slshape}
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
of the newsreader~\footnote{http://www.newsreader-project.eu} project. 

Apart from describing the pipeline set-up, the document actually
constructs the pipeline. Currently, the pipeline has been succesfully
implemented on a specific supercomputer (Lisa, Surfsara,
Amsterdam~\footnote{https://surfsara.nl/systems/lisa}) and on
computers running Ubuntu and Centos. 

The installation has been parameterised. The locations and names that
you read (and that will be used to build the pipeline) have been read
from variables in file \texttt{inst.m4} in the nuweb directory.  


\subsection{List of the modules to be installed}
\label{sec:moduleslist}

\newcommand{\dref}[1]{\hyperref[#1]{\ref{#1}}}

Table~\ref{tab:modulelist}
\begin{table}[hbtp]
  \centering
  \begin{footnotesize}
    \begin{tabular}{llllll}
     \textbf{Module}   & \textbf{Section}     & \textbf{Source} &  \textbf{Commit} & \textbf{Script} \\
       \href{m4_tokenizergit}{Tokenizer}          
                       & \dref{sec:installtokenizer}         & \href{m4_tokenizergit}{Github} & m4_tokenizer_commitname & \texttt{m4_tokenizerscript}  \\
@%       \href{m4_tokenizergit}{Tokenizer}          
@%                       & \dref{sec:installtokenizer}           &  snapshot          & m4_tokenizer_commitname & \texttt{m4_tokenizerscript}  \\
       \href{m4_morphpargit}{morphosyntactic parser} 
                       & \dref{sec:install-morphsynt-parser} & \href{m4_morphpargit}{Github}  & m4_morphpar_commitname  & \verb|m4_morphparscript|     \\
       \href{m4_nercgit}{\textsc{nerc}} 
                       & \dref{sec:nerc}                     & \href{m4_nercgit}{Gith.}/snap      & m4_nerc_commitname   & m4_nercscript      \\
       \href{m4_wsdgit}{\textsc{wsd}}
                       & \dref{sec:wsd}                       & \href{m4_wsdgit}{Gith.}/snap      & m4_wsd_commitname   & m4_wsdscript       \\
       \hyperref[sec:onto]{Onto-tagger}
                       & \dref{sec:onto}                                     & snapshot       &                      & m4_ontoscript      \\
       \href{m4_heidelgit}{Heideltime}
                       & \dref{sec:heideltime}              & \href{m4_heidelgit}{Gith.}/snap.     & m4_heidel_commitname  & m4_heidelscript   \\
       \href{m4_srlgit}{\textsc{srl}}
                       & \dref{sec:SRL}                        & \href{m4_srlgit}{Github}     & m4_srl_commitname   & m4_srlscript       \\
       \href{m4_srlgit}{\textsc{srl-post}}
                       & \dref{sec:srlpost}                                  & snapshot        &                    & m4_postsrlscript       \\
       \href{m4_nedgit}{\textsc{ned}}
                       & \dref{sec:ned}                        & \href{m4_nedgit}{Github}     & m4_ned_commitname   & m4_nedscript       \\
       \href{m4_corefbasegit}{Nom. coref}
                       & \dref{sec:nomcorefgraph}       & \href{m4_corefbasegit}{Github}      & m4_corefbase_commitname   & m4_ncorefscript   \\  
       \href{m4_evcorefscript}{Ev. coref}
                       & \dref{sec:eventcoref}                                & snapshot      &                           &  m4_evcorefscript  \\  
       \hyperref[]{Opinion miner}
                       & \dref{sec:opinimin}   & \href{m4_opinigit}{Github} &           &  m4_opiniscript   & \\  
       \hyperref[sec:framesrl]{Framenet SRL} 
                       & \dref{sec:framesrl}                                  & snapshot      &                            &  m4_fsrlscript   \\  
       \hyperref[sec:dbpedia-ner]{Dbpedia\_ner} 
                       & \dref{sec:dbpedia-ner}                                  &  \href{m4_dbpnergit}{Github}       &  m4_dbpner_commitname                          &  m4_dbpnerscript   \\  
@%     \hyperref[sec:install-alpino]{Alpino             & \verb|m4_alpinodir|    & \textsc{rug} & m4_Alpinoscript  & \\
@%     \hyperref[]{Ticcutils          & \verb|m4_ticcdir|      & \textsc{ilk} & & \\
@%     \hyperref[]{Timbl              & \verb|m4_timbldir|     & \textsc{ilk} & & \\
@%     \hyperref[]{Treetagger         &                        &              & & \\
    \end{tabular}
  \end{footnotesize}
  \caption{List of the modules to be installed. Column description:
    \textbf{directory:} Name of the subdirectory below subdirectory \texttt{modules} in
    which it is installed; \textbf{source:} From where the module has
    been obtained; \textbf{commit:} Commit-name or version-tag \textbf{script:} Script to be included in a pipeline. \textbf{Note:} The tokenizer module has been temporarily obtained from the snapshot, because the commit that we used has disappeared from the Github repository.}
  \label{tab:modulelist}
\end{table}
lists the modules in the pipeline. The column \emph{source} indicates
the origin of the module. The modules are obtained in one of the following ways:


\begin{enumerate}
\item If possible, the module is directly obtained from an open-source repository like Github.
\item Some modules have not been officially published in a
  repository. These modules have been packed in a tar-ball that can be
  obtained by the author. In table~\ref{tab:modulelist} this has been indicated as \textsc{snapshot}.
\end{enumerate}

The modules themselves use other utilities like dependency-taggers and
POS taggers. These utilities are listed in
table~\ref{tab:utillist}.
\begin{table}[hbtp]
  \centering
  \begin{tabular}{llll}
   \textbf{Module}  & \textbf{Version}    & \textbf{Section}   & \textbf{Source}                           \\
     \href{m4_kafnafgit}{KafNafParserPy}     
                    & Feb 1, 2015   & \dref{sec:KafNafParserPy}  & \href{m4_kafnafgit}{Github}       \\
     \href{m4_alpino_desc_url}{Alpino}
                    &  m4_alpino_version  & \dref{sec:install-alpino}  & \href{m4_alpinourl}{\textsc{rug}} \\
     \href{m4_ticc_desc_url}{Ticcutils}
                    & m4_ticcutilsversion   & \dref{sec:timbl}    & \href{m4_ticcurl}{\textsc{ilk}}          \\
     \href{m4_ticc_desc_url}{Timbl}
                    & m4_timblversion   & \dref{sec:timbl}   & \href{m4_timblurl}{\textsc{ilk}}          \\
     \href{http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/}{Treetagger}
                    & m4_treetag_version   & \dref{sec:installtreetagger} & \href{m4_treetag_base_url}{Uni. München}   \\
     \href{m4_spotlighturl}{Spotlight server}
                    & m4_spotlightjarversion   & \dref{sec:spotlight} & \href{spotlight.dbpedia.org}{Spotlight}   \\
  \end{tabular}
  \caption{List of the modules to be installed. Column description:
    \textbf{directory:} Name of the subdirectory below \texttt{mod} in
    which it is installed; \textbf{Source:} From where the module has
    been obtained; \textbf{script:} Script to be included in a pipeline.}
  \label{tab:utillist}
\end{table}


@%Table~\ref{tab:modulesources} lists the source of the modules and
@%utilities that can be installed from an open source.
@%\begin{table}[hbtp]
@%  \centering
@%  \begin{footnotesize}
@%  \begin{tabular}{lll}
@%   \textbf{module} & \textbf{source} & {\small\textbf{URL}}  \\
@%   Tokenizer          & Github & m4_tokenizergit \\
@%   Morphosynt. p. & Github & \verb|m4_morphpargit| \\
@%   heideltime. & Github & \verb|m4_morphpargit| \\
@%   Alpino             & \textsc{rug}  & \verb|m4_alpinosrc| \\
@%   Ticcutils          & \textsc{ilk}  & m4_ticcsrc \\
@%   Timble            & \textsc{ilk} & m4_timblsrc \\
@%  \end{tabular}
@%  \end{footnotesize}
@%  \caption{Sources of the modules}
@%  \label{tab:modulesources}
@%\end{table}


\subsection{File-structure of the pipeline}
\label{sec:filestructure}

The files that make up the pipeline are organised in set of
directories as shown in figure~\ref{fig:directorystructure}. %
\begin{figure}[hbtp]
  \centering
%  \includegraphics{directorystructure.pdf}
   \input{directorystructure.pdftex_t}
  \caption{Directory-structure of the pipeline (see text). }
  \label{fig:directorystructure}
\end{figure}%
The directories have the follosing functions.

\begin{description}
\item[socket:] The directory in the host where the pipeline is to be implemented.
\item[root:] The root of the pipeline directory-structure.
\item[nuweb:] This directory contains this document and everything to
  create the pipeline from the open sources of the modules.
\item[modules:] Contains subdirectories with the \textsc{nlp} modules that can be applied in the pipeline.
\item[bin:] Contains for each of the applicable modules a script that
  reads \NAF{} input, passes it to the module in the \texttt{modules}
  directory and produces the output on standard out. Furthermore, the
  subdirectory contains the script \texttt{m4_module_installer} that
  performs the installation, and a script \texttt{test} that shows
  that the pipeline works in a trivial case.
\item[env:] The programming environment. It contains a.o. the Java
  development kit, Python, the Python virtual environment
  (\texttt{venv}), libraries and binaries.
\end{description}

@d directories to create @{m4_moddir @| @}
@d directories to create @{m4_bindir m4_envbindir @| @}
@d directories to create @{m4_envlibdir @| @}
@d directories to create @{m4_envetcdir @| @}
@%@d directories to create @{m4_envdir/python @| @}

The following macro defines variable \verb|piperoot| and makes it to
point to the root directory in
figure~\ref{fig:directorystructure}. Next it defines variables that
point to other directories in the figure. The value-setting of
\verb|piperoot| can be overruled by defining the variable before
running any of the script. In this way the directory tree can be moved
to another location, even to another computer, after successful installation.

@d set variables that point to the directory-structure @{@%
if 
  [ "$piperoot" == "" ]
then
  export piperoot=m4_aprojroot
fi
export pipesocket=${piperoot%%/nlpp}
export nuwebdir=$piperoot/nuweb
export envdir=$piperoot/env
export envbindir=$envdir/bin
export envlibdir=$envdir/lib
export modulesdir=$piperoot/modules
export pipebin=$piperoot/bin
export javadir=$envdir/java
export jarsdir=$javadir/jars
@| @}

Add the environment \verb|bin| directory to \verb|PATH|:

@d set variables that point to the directory-structure @{@%
export PATH=\$envbindir:$PATH
@| PATH @}

@% While setting variables, \emph{source} a scripts that sets variables
@% for directories of which we do not yet know where they are, e.g.{}
@% paths to Python and Java that we may have to set up dynamically.

Put the macro to set variables in a script that can later be sourced by the scripts of the pipeline modules.

@%@d set variables that point to the directory-structure @{@%
@%source \$envbindir/progenv
@%@| @}

@o m4_envbindir/progenv @{@%
#!/bin/bash
@< set variables that point to the directory-structure @>
@| @}

\section{How to obtain modules and other material}
\label{sec:downloadmethods}

As illustrated in tables~\ref{tab:modulelist} and~\ref{tab:utillist},
most of the modules are obtained as source-code from Github, some of
the modules or parts of some modules are downloaded from a snapshot,
and some of the utilities are obtained in binary form from the
supplier.

This section builds standardised methods to obtain modules and utilities from Github or from the snapshot.

\subsection{Location-dependency}
\label{sec:location-dependency}

The basic way of installation is, to clone this repository from Github
on the intended location in the file-system of the target computer and
then run the install-scripts. However, it may be advantageous to be
able to transplant a complete installation to another location in
another computer. This could be done by making all path-descriptions
in all scripts relative to anchorpoints within the installation, while
it may be hard to find such anchorpoints in advance. Therefore, we
take another approach in which we supply a script that repairs
paths-descriptions after the transplantation (section~\ref{sec:paths-restore}).



\subsection{Reversible update}
\label{sec:reversible_update}

This script might be used to update an existing installation. To
minimize the risk that the ``update'' acually ruins an existing
installation, move existing modules away before installing the latest
version. When the new modules has been installed succesfully, the
moved module will be removed. The following macro's help to achieve this:

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

The following macro can be used to install a module from Github. Before issuing this macro, the following four variables must be set:
\begin{description}
\item[MODNAM:] Name of the module.
\item[DIRN:] Name of the root directory of the module.
\item[GITU:] Github \URL{} to clone from.
\item[GITC:] Github commit-name or version tag.
\end{description}


@d install from github @{@%
@% MODNAM=@1
@% DIRN=@2
@% GITU=@3
@% GITC=@4
cd \$modulesdir
@< move module @(\$DIRN@) @>
git clone $GITU
if
  [ $? -gt 0 ]
then
  @< logmess @(Cannot install current $MODNAM version@) @>
  @< re-instate old module @(\$DIRN@) @>
else
  @< remove old module @(\$DIRN@) @>
  cd $modulesdir/$DIRN
  git checkout $GITC
fi

@| @}

@% @d install from github t @{@%
@% MODNAM=@1
@% DIRN=@2
@% GITU=@3
@% cd \$modulesdir
@% @% @< cd to the modules directory @>
@% @< move module @(\$DIRN@) @>
@% git clone $GITU
@% if
@%   [ $? -gt 0 ]
@% then
@%   @< logmess @(Cannot install current $MODNAM version@) @>
@%   @< re-instate old module @(\$DIRN@) @>
@% else
@%   @< remove old module @(\$DIRN@) @>
@% fi
@% 
@% @| @}

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
@% FULLDIR=\$modulesdir/$DIRN
@% LEAVE=${FULLDIR##*/}
@% TREE=${FULLDIR%%\$LEAVE}
@% @| @}


\subsection{Installation from the snapshot}
\label{sec:snapshotinstall}

The snapshot can be accessed over \texttt{scp} on \textsc{url}
\url{m4_repo_user@@m4_repo_url}. Access is protected by a
public/private key system. So, a private key is needed and this
program expects to to find the key as \verb|\$pipesocket/nrkey|. The
key can be obtained from the author. Let us check whether we indeed do
have the key: 

@d check this first @{@%
if
@%   [ ! -e m4_snapshotkeyfile ]
  [ ! -e \$pipesocket/m4_snapshotkeyfilename ]
then
  echo "No key to connect to snapshot!"
  exit 1
fi
@| @}


Use the following macro to download a resource if it is not already present
in the ``socket'' directory. It turns out that sometimes there is a
time-out for unknown reasons. In that case we will try it multiple times.

@d get or have @{@%
counter=0
while
  [ ! -e \$pipesocket/@1 ]
do
@%   @< have an SSH key or die @>
  cd \$pipesocket
  scp -i "m4_snapshotkeyfile" m4_repo_user<!!>@@<!!>m4_repo_url:m4_repo_path/@1 .
  if
    [ $? -gt 0 ]
  then
    counter=$((counter+1))
    if
      [ $counter -gt 3 ]
    then
       echo "Cannot contact snapshot server"
       exit 1
    fi
  fi
done

@| @}


@%@d get or have @{@%
@%if
@%  [ ! -e \$pipesocket/@1 ]
@%then
@%  @< have an SSH key or die @>
@%  cd \$pipesocket
@%  scp -i "m4_snapshotkeyfile" m4_repo_user<!!>@@<!!>m4_repo_url:m4_repo_path/@1 .
@%  if
@%    [ $? -gt 0 ]
@%  then
@%    echo "Cannot contact snapshot server"
@%    exit 1
@%  fi
@%fi
@%
@%@| @}



@% tarball with snapshots that can
@%be obtained from the author. Let us first check whether we have the
@%snapshot and complain if we don't. We expect the file
@%\verb|m4_aprojroot/m4_snapshot_tarball|.


@%@d unpack snapshots or die @{@%
@%cd m4_aprojroot
@%if
@%  [ -e m4_snapshot_tarball ]
@%then
@%  tar -zxf m4_snapshot_tarball
@%fi
@%if
@%  [ ! -e m4_snapshotdir ]
@%then
@%  echo "No module snapshots"
@%  exit 1
@%fi
@%@| @}



\section{Java and Python environment}
\label{sec:environment}

To be independent from the software environment of the host computer
and to perform reproducible processing, the pipeline features its own
Java and Python environment. The costs of this feature are that the
pipeline takes more disk-space by reproducing infra-structure that is
already present in the system and that installation takes more time.

The following macro generates a script that specifies the programming
environment. Initially it is empty, because we have to create the
programming environment first.

@d create javapython script @{@%
echo '<!#!>!/bin/bash' > m4_aenvbindir/javapython
@| @}

Cause the module scripts to read the javapython script.

@o m4_envbindir/progenv @{@%
source $envbindir/javapython
@| @}


@% @o m4_envbindir/progenv @{@%
@% #!/bin/bash
@% @% @< set up java environment in scripts@>
@% @% @< activate the python environment @>
@% @| @}

@% @d set up programming environment @{@%
@% source \$envbindir/progenv
@% @| @}


\subsection{Java}
\label{sec:java}

To install Java, download \texttt{m4_javatarball} from
\url{m4_javatarballurl}. Find it in the root directory and unpack it
in a subdirectory of \texttt{envdir}.

@d directories to create @{m4_javadir @| @}


@%@d check this first @{@%
@%if
@%  [ ! -e m4_aprojroot/m4_javatarball ]
@%then
@%  echo "Cannot find  m4_aprojroot/m4_javatarball"
@%  exit 4
@%fi
@%@| @}

@d set up java @{@%
@< get or have @(m4_javatarball@) @>
cd \$envdir/java
tar -xzf \$pipesocket/m4_javatarball
@% rm \$pipesocket/m4_javatarball
@| @}

Remove the java-ball when cleaning up:

@d clean up @{@%
rm -rf \$pipesocket/m4_javatarball
@| @}


@d set up java @{@%
echo 'export JAVA_HOME=\$envdir/java/m4_javajdk' >> m4_aenvbindir/javapython
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> m4_aenvbindir/javapython
export JAVA_HOME=\$envdir/java/m4_javajdk
export PATH=$JAVA_HOME/bin:$PATH
@| @}


@% @d set up java environment in scripts @{@%
@% export JAVA_HOME=\$envdir/java/m4_javajdk
@% export PATH=$JAVA_HOME/bin:$PATH
@% @| JAVA_HOME @}

Put jars in the jar subdirectory of the java directory:

@d directories to create @{m4_jardir @| @}

@% @d set up java environment in scripts @{@%
@% export JARDIR=\$envdir/java/jars
@% @| @}




\subsection{Maven}
\label{sec:Maven}

Some Java-based modules can best be compiled with
\href{m4_mavenurl}{Maven}. 

@d directories to create @{m4_mavendir @| @}


@d install maven @{@%
cd \$envdir
wget m4_maventarballurl
tar -xzf m4_maventarball
rm m4_maventarball
@| @}

@d install maven @{@%
export MAVEN_HOME=\$envdir/m4_mavensubdir
export PATH=${MAVEN_HOME}/bin:${PATH}
@| @}

When the installation has been done, remove maven, because it is no longer needed.

@d clean up @{@%
rm -rf m4_mavendir
@| @}



\subsection{Python}
\label{sec:python}

Set up the environment for Python (version 2.7). I could not find an easy way to set
up Python from scratch. Therefore we wil use Python 2.7 if is has been
installed on the host. Otherwise, we will use a binary distribution
obtained from \href{m4_activepythonurl}{ActiveState}. A tarball of
ActivePython can be obtained from the snapshot.

In order to be independent of the software on the host, we generate a
virtual Python environment. In the virtual environment we will install KafNafParserPy and other
Python packages that are needed.


@d set up python @{@%
@< check/install the correct version of python @>
@< create a virtual environment for Python @>
@< activate the python environment @>
@< install kafnafparserpy @>
@< install python packages @>
@| @}


@d check/install the correct version of python @{@%
pythonok=`python --version 2>&1 | gawk '{if(match($2, "2.7")) print "yes" ; else print "no" }'`
if
  [ "$pythonok" == "no" ]
then
  @< install ActivePython @>
fi
@| pythonok @}


Unpack the tarball in a temporary directory and install active python
in the \texttt{env} subdirectory of nlpp. It turns out that you must
upgrade pip, virtualenv and setuptools after the installation (see
\url{https://github.com/ActiveState/activepython-docker/commit/10fff72069e51dbd36330cb8a7c2f0845bcd7b38}
and \url{https://github.com/ActiveState/activepython-docker/issues/1}).


@d install ActivePython  @{@%
@< get or have @(m4_activepythonball@) @>
pytinsdir=`mktemp -d -t activepyt.XXXXXX`
cd $pytinsdir
tar -xzf \$pipesocket/m4_activepythonball
acdir=`ls -1`
cd $acdir
@%./install.sh -I m4_ausrlocaldir
./install.sh -I \$envdir
cd \$piperoot
rm -rf \$pytinsdir
pip install -U pip virtualenv setuptools
@| @}

\subsubsection{Transplant ActivePython}
\label{sec:transplantactivepython}

Activepython produces scripts in \verb|env/bin| that contain
``shabangs'' with absolute path. Furthermore, activePython seems to
have an implicit pythonpath with an absolute path. So, when
transplanting the directorytree to another location we have to solve
these two problems.

While doing this, we also modify the scripts in the Python Virtenv
binary directory (see~\ref{sec:pythonvirtenv}).

Modify the scripts as follows:

\begin{enumerate}
\item Create a temporary directory.
\item Generate an \AWK{} script that replaces the shabang line with a
  correct one.
\item Generate a script that moves a script from \verb|env/bin| to the
  temporary directory and then applies the \AWK{} script.
\item Apply the generated script on the scripts in \verb|env/bin|.
\end{enumerate}

@d set paths after transplantation @{@%
transdir=`mktemp -d -t trans.XXXXXX`
cd $transdir
@< write script tran @>
@< write script chasbang.awk @>
@< apply script tran on the scripts in @($envbindir@) @>
@< apply script tran on the scripts in @($envdir/venv/bin@) @>
@% find $envbindir -type f -exec file {} + | grep script | gawk '{print $1}' FS=':' | xargs -iaap ./tran aap
cd $projroot
rm -rf $transdir
@| @}

@d write script tran @{@%
cat <<EOF >tran
workfil=\$1
mv \$workfil ./wor
gawk -f chasbang.awk ./wor >$workfil 
EOF
chmod 775 ./tran
@| @}

@d write script chasbang.awk @{@%
cat <<EOF >chasbang.awk
#!/usr/bin/gawk -f
BEGIN { shabang="#!$envbindir/python"}

/^\#\!.*python.*/ { print shabang
                    next
                   }
{print}
EOF
@| @}

The following looks complicated. The \texttt{find} command applies the
\texttt{file} command on the files in the \verb|env/bin|
directory. The grep command filters out the names of the files that
are scripts. it produces a filename, followed by a colon, followed by
a description of the type of the file. The \texttt{gawk} command
prints the filenames only and the \texttt{xargs} command applies the
\verb|tran| script on the file.  

@d apply script tran on the scripts in  @{@%
find @1 -type f -exec file {} + | grep script | gawk '{print $1}' FS=':' | xargs -iaap ./tran aap
@| @}


Add \texttt{env/lib/python2.7} to the \texttt{PYTHONPATH} variable.

@d set paths after transplantation @{@%
echo export PYTHONPATH=\\$envdir/lib/python2.7:\\$PYTHONPATH >> $envbindir/javapython
export PYTHONPATH=\\$envdir/lib/python2.7:\\$PYTHONPATH 
@| @}



\subsubsection{Virtual environment}
\label{sec:pythonvirtenv}

Create a virtual environment. To begin this, we need the Python module
virtualenv on the host.

@d create a virtual environment for Python @{@%
@< test whether virtualenv is present on the host @>
cd \$envdir
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
source \$envdir/venv/bin/activate
echo 'source \$envdir/venv/bin/activate' >> m4_aenvbindir/javapython
@|activate @}

@% @d de-activate the python environment @{@%
@% deactivate
@% @| @}

Subdirectory \verb|\$envdir/python| will contain general Python
packages like KafnafParserPy.

@d directories to create @{m4_envdir/python @| @}

Activation of Python include pointing to the place where Python
packages are:

@d activate the python environment @{@%
echo export 'PYTHONPATH=\$envdir/python:\$PYTHONPATH' >> m4_aenvbindir/javapython
export PYTHONPATH=\$envdir/python:\$PYTHONPATH
@|PYTHONPATH @}

\subsubsection{Transplant the virtual environment}
\label{sec:transplant_virt_env}

It turns out that the script ``activate'' to engage the virtual
environment contains an absolute path, in the definition of \verb|VIRTUAL_ENV|

@d set paths after transplantation @{@%
transdir=`mktemp -d -t trans.XXXXXX`
cd $transdir
cat <<EOF >redef.awk
#!/usr/bin/gawk -f
BEGIN { envd="$envdir/venv"}

/^VIRTUAL_ENV=/ { print "VIRTUAL_ENV=\"" envd "\""
                  next
                }
{print}
EOF

mv \$envdir/venv/bin/activate .
gawk -f redef.awk ./activate > \$envdir/venv/bin/activate 
cd $projroot
rm -rf $transdir
@| @}


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
feature of this module that you cannot install it with \textsc{pip}, but that
you can add it to your \texttt{PYTHONPATH}.


@d install kafnafparserpy @{@%
@% cd m4_pythonmoddir
cd \$envdir/python
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



\section{Installation of the modules}
\label{sec:install}

This section describes how the modules are obtained from their
(open-)source and installed. 

\subsection{The installation script}
\label{sec:installscript}

The installation is performed by script
\verb|m4_module_installer|. The first part of the script installs the utilities:


@o m4_bindir/m4_module_installer @{@%
#!/bin/bash
echo Set up environment
@% @< create progenv script @>
@< set variables that point to the directory-structure @>
@< variables of m4_module_installer @>
@< check this first @>
@%@< unpack snapshots or die @>
@< create javapython script @>
echo ... Java
@< set up java @>
@% @< set up java environment in scripts @>
@< install maven @>
echo ... Python
@< set up python @>
echo ... Alpino
@< install Alpino @>
echo ... Spotlight
@< install the Spotlight server @>
echo ... Treetagger
@< install the treetagger utility @>
echo ... Ticcutils and Timbl
@< install the ticcutils utility @>
@< install the timbl utility @>
echo ... VUA-pylib, SVMlight, CRFsuite
@< install VUA-pylib @>
@< install SVMLight @>
@< install CRFsuite @>

@| @}

Next, install the modules:

@o m4_bindir/m4_module_installer @{@%
echo Install modules
echo ... Tokenizer
@< install the tokenizer @>
echo ... Morphosyntactic parser
@< install the morphosyntactic parser @>
echo ... NERC
@< install the NERC module @>
echo ... Coreference base
@< install coreference-base @>
echo ... WSD
@< install the WSD module @>
echo ... Ontotagger
@< install the onto module @>
echo ... Heideltime
@< install the heideltime module @>
@% @< install the new heideltime module @>
echo ... SRL
@< install the srl module @>
echo ... NED
@< install the \NED{} module @>
echo ... Event-coreference
@< install the event-coreference module @>
echo ... lu2synset
@< install the lu2synset converter @>
echo ... dbpedia-ner
@< install the dbpedia-ner module @>
echo ... nominal event
@< install the nomevent module @>
@< install the post-SRL module @>
@< install the opinion-miner @>

echo Final
@| @}

@%@o m4_bindir/m4_module_installer @{@%
@%@< remove maven @>
@%@| @}

@d make scripts executable @{@%
chmod 775  m4_bindir/m4_module_installer
@| @}

\subsection{Check availability of resources}
\label{sec:check-availability}

Test for some resources that we need and that may not be available on this host.

@d check this first @{@%
@< check whether mercurial is present @>
@| @}

@d check whether mercurial is present @{@%
which hg
if
  [ $? -ne 0 ]
then
  echo Please install Mercurial.
  exit 1
fi
@|hg @}




\subsection{Install utilities and resources}
\label{sec:utilitiesandresources}

\subsubsection{Alpino}
\label{sec:install-alpino}

Binary versions of Alpino can be obtained from the
\href{http://www.let.rug.nl/vannoord/alp/Alpino/}{official Alpino
  website} of Gertjan van Noort. However, it seems that older versions
are not always retained there, or the location of older versions
change. Therefore we have a copy in the snapshot.

\paragraph{Module}
\label{sec:installalpinomodule}

@d install Alpino @{@%
@< get or have @(m4_alpinosrc@) @>
@% SUCCES=0
cd \$modulesdir
tar -xzf \$pipesocket/m4_alpinosrc
@% @< move module @(Alpino@) @>
@% wget m4_alpinourl
@% SUCCES=\$?
@% if
@%   [ \$SUCCES -eq 0 ]
@% then
@%   tar -xzf m4_alpinosrc
@%   SUCCES=\$?
@%   rm -rf m4_alpinosrc
@% fi
@% if
@%   [ $SUCCES -eq 0 ]
@% then
@< logmess @(Installed Alpino@) @>
@%   @< remove old module @(Alpino@) @>
@% else
@%   @< re-instate old module @(Alpino@) @>
@% fi
@| @}

Currently, alpino is not used as a pipeline-module on its own, but it
is included in other pipeline-modules. Modules that use Alpino should
set the following variables:

@d set alpinohome @{@%
export ALPINO_HOME=\$modulesdir/Alpino
@| ALPINO_HOME @}

Remove the tarball when cleaning up:

@d clean up @{@%
rm -rf \$pipesocket/m4_alpinosrc
@| @}



\subsubsection{Treetagger}
\label{sec:installtreetagger}

Installation of Treetagger goes as follows (See
\href{http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/}{Treetagger's homepage}):

\begin{enumerate}
\item Download and unpack the Treetagger tarball. This generates the
  subdirectories \verb|bin|, \verb|cmd| and \verb|doc|
\item Download and unpack the tagger-scripts tarball
\end{enumerate}

The location where Treetagger comes from and the location where it is going to reside:

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
mkdir -p \$modulesdir/\$TREETAGDIR
cd \$modulesdir/\$TREETAGDIR
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

Make the treetagger utilities available for everybody.

@d install the treetagger utility @{@%
chmod -R o+rx \$modulesdir/\$TREETAGDIR/bin
chmod -R o+rx \$modulesdir/\$TREETAGDIR/cmd
chmod -R o+r \$modulesdir/\$TREETAGDIR/doc
chmod -R o+rx \$modulesdir/\$TREETAGDIR/lib
@% ./\$TREETAG_INSTALLSCRIPT
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

\subsubsection{Timbl and Ticcutils}
\label{sec:timbl}

Timbl and Ticcutils are installed from their source-tarballs. The
installation is not (yet?) completely reproducibe because it uses the
C-compiler that happens to be available on the host. Installation involves:

\begin{enumerate}
\item Download the tarball in a temporary directory.
\item Unpack the tarball.
\item cd to the unpacked directory and perform \verb|./configure|,
  \verb|make| and \verb|make install|. Note the argument that causes
  the files to be installed in the \texttt{lib} and the \texttt{bin} sub-directories of the
  \texttt{env} directory.
\end{enumerate}

@d install the ticcutils utility @{@%
URL=m4_ticcurl
TARB=m4_ticcsrc
DIR=m4_ticcdir
@< unpack ticcutils or timbl @>
@| @}

@d install the timbl utility @{@%
@% URL=m4_timblurl
TARB=m4_timblsrc
DIR=m4_timbldir
@< unpack ticcutils or timbl @>
@| @}


@d unpack ticcutils or timbl @{@%
@< get or have @(\$TARB@) @>
SUCCES=0
ticbeldir=`mktemp -t -d tickbel.XXXXXX`
cd \$ticbeldir
tar -xzf \$pipesocket/\$TARB
cd \$DIR
./configure --prefix=\$envdir
make 
make install
cd \$piperoot
rm -rf \$ticbeldir
@% @% wget \$URL
@% SUCCES=\$?
@% if
@%   [ \$SUCCES -eq 0 ]
@% then
@%   tar -xzf \$TARB
@%   SUCCES=\$?
@%   rm -rf \$TARB
@% fi
@% if
@%   [ \$SUCCES -eq 0 ]
@% then
@%   cd \$DIR
@%   ./configure --prefix=\$envdir
@%   make
@%   make install
@% fi
@% cd \$piperoot
@% rm -rf \$ticbeldir
@% if
@%   [ \$SUCCES -eq 0 ]
@% then
@%   @< logmess @(Installed \$DIR@) @>
@% else
@%   @< logmess @(NOT installed \$DIR@) @>
@% fi
@| @}

When the installation has been transplanted, Timbl and Ticcutils have
to be re-installed.

@d  re-install modules after the transplantation @{@%
@< install the ticcutils utility @>
@< install the timbl utility @>
@| @}





\subsubsection{Spotlight}
\label{sec:spotlight}

@% Install Spotlight as described on the readme of \texttt{ixa-pipe-ned}.

Install Spotlight in the way that  Itziar Aldabe (\url{mailto:itziar.aldabe@@ehu.es}) described:

\begin{quotation}
The NED module works for English, Spanish, Dutch and Italian. The
module returns multiple candidates and correspondences for all the
languages. If you want to integrate it in your Dutch or Italian
pipeline, you will need:

\begin{enumerate}
\item The jar file with the dbpedia-spotlight server. You need the
  version that Aitor developed in order to correctly use the "candidates"
  option. You can copy it from the English VM. The jar file name is
  \verb|dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar|
\item The Dutch/Italian model for the dbpedia-spotlight. You can download them from:
    \url{http://spotlight.sztaki.hu/downloads/}
\item The jar file with the NED module:
    \verb|ixa-pipe-ned-1.0.jar|. You can copy it from the English VM
    too.
\item The file: \verb|wikipedia-db.v1.tar.gz|. You can download it
  from:
  \url{http://ixa2.si.ehu.es/ixa-pipes/models/wikipedia-db.v1.tar.gz}. This
  file contains the required information to do the mappings between
  the wikipedia-entries. The zip file contains three files:
  wikipedia-db, wikipedia-db.p and wikipedia-db.t
\end{enumerate}

To start the dbpedia server:
Italian server: 

\begin{verbatim}
java -jar -Xmx8g dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar \
    it http://localhost:2050/rest 

\end{verbatim}

Dutch server:  

\begin{verbatim}
java -jar -Xmx8g dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar nl http://localhost:2060/rest 

\end{verbatim}

We set 8Gb for the English server, but the Italian and Dutch Spotlight will require less memory. 
\end{quotation}


So, let's do that. 

@d install the Spotlight server @{@%
@< get or have @(m4_spotlightball@) @>
@%mkdir -p m4_aspotlightdir
cd \$envdir
tar -xzf \$pipesocket/m4_spotlightball
@% rm -rf \$pipesocket/m4_spotlightball
cd \$envdir/spotlight
@%cp m4_asnapshotroot/spotlight/m4_spotlightjar .
@% wget m4_spotlight_download_url/m4_spotlightjar
wget m4_spotlight_download_url/m4_spotlight_nl_model_ball
tar -xzf m4_spotlight_nl_model_ball
rm m4_spotlight_nl_model_ball
@%wget m4_spotlight_download_url/m4_spotlight_en_model_ball
@%tar -xzf m4_spotlight_en_model_ball
@%rm m4_spotlight_en_model_ball
@% MVN_SPOTLIGHT_OPTIONS="-Dfile=m4_spotlightjar"
@% MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -DgroupId=ixa"
@% MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -DartifactId=dbpedia-spotlight"
@% MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -Dversion=m4_spotlightjarversion"
@% MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -Dpackaging=jar"
@% MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -DgeneratePom=true"
@% mvn install:install-file -Dfile=dbpedia-spotlight-0.7.jar -DgroupId=ixa -DartifactId=dbpedia-spotlight -Dversion=0.7 -Dpackaging=jar -DgeneratePom=true 
@% mvn install:install-file $MVN_SPOTLIGHT_OPTIONS
@| @}

We choose to put the Wikipedia database in the spotlight directory.

@d install the Spotlight server @{@%
cd \$envdir/spotlight
wget m4_wikipediadb_url
tar -xzf m4_wikipediadb_tarball
rm  m4_wikipediadb_tarball
@| @}


@d start the Spotlight server @{@%
cd m4_aspotlightdir
@% java  -Xmx8g -jar m4_spotlightjar nl http://localhost:m4_spotlight_nl_port/rest
java -jar -Xmx8g dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar nl http://localhost:2060/rest  &
@% java -jar -Xmx8g dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar nl http://localhost:2060/rest  &
@| @}

We start the spotlight-server only in case it is not already running. Assume that Spotlight runs when something listens on port~m4_spotlight_nl_port of localhost:

@d check/start the Spotlight server @{@%
spottasks=`netstat -an | grep :m4_spotlight_nl_port | wc -l`
if
  [ $spottasks -eq 0 ]
then
  @< start the Spotlight server @>
  sleep 60
fi
@| @}


\subsubsection{VUA-pylib}
\label{sec:vua-pylib}

Module VUA-pylib is needed for the opinion-miner. Install it in the Python library

@d install VUA-pylib @{@%
cd \$envdir/python
git clone m4_vuapylibgit
@| @}


\subsubsection{SVMLight}
\label{sec:svmlight}

SVMlight supplies a Support Vector Machine. It is used by the
opinion-miner. SVMlight can be obtaied from 
\href{m4_SVMlightsite}{the site} where it is documented.

Installation goes like this:

@d install SVMLight @{@%
tempdir=`mktemp -d -t SVMlight.XXXXXX`
cd $tempdir
wget m4_SVMlightball_url
tar -xzf m4_SVMlightball
make all
cp svm_classify m4_aenvbindir/
cp svm_learn m4_aenvbindir/
cd m4_aprojroot
rm -rf \$tempdir
@| @}


\subsubsection{CRFsuite}
\label{sec:crfsuite}

CRFsuite is an implementation of Conditional Random Fields
(\textsc{crf}). 

@d install liblblbfgs @{@%
tempdir=`mktemp -d -t liblblbfgs.XXXXXX`
cd \$tempdir
git clone m4_liblblbfgs_git
cd lblblfgs
./autogen.sh
./configure --prefix=\$envdir
make
make install
cd m4_aprojroot
rm -rf \$tempdir
@| @}

@d install CRFsuite @{@%
@< install liblblbfgs @>
tempdir=`mktemp -d -t crfsuite.XXXXXX`
cd \$tempdir
wget m4_CRFsuiteball_url
tar -xzf m4_CRFsuiteball
cd m4_CRFsuitedir
./configure --prefix=\$envdir
make
make install
cd m4_aprojroot
rm -rf \$tempdir
@| @}




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

To install the tokenizer, we proceed as follows:

\begin{enumerate}
\item Clone the source from github into a temporary directory.
\item Compile to produce the jar file with the tokenizer.
\item move the jar file into the jar directory.
\item remove the tempdir with the sourcecode.
\end{enumerate}

@d install the tokenizer @{@%
@% @< install from github t @(tokenizer@,m4_tokenizerdir@,m4_tokenizergit@) @>
tempdir=`mktemp -d -t tok.XXXXXX`
cd \$tempdir
git clone m4_tokenizergit
cd m4_tokenizerdir
git checkout m4_tokenizer_commitname
mvn clean package
mv target/m4_tokenizerjar \$jarsdir
cd \$piperoot
rm -rf \$tempdir
@| @}

@% Unfortunately the above macro does no longer work because the commit
@% that we used seems to have been disappeared from the Github
@% repository. Therefore, we will use a jar that we have generated
@% before and that has been stored in the snapshot tarball.
@% 
@% @d install the tokenizer @{@%
@% cp m4_asnapshotroot/ixa-pipe-tok/m4_tokenizerjar m4_ajardir
@% @| @}
@% 
@% @% @d install the tokenizer @{@%
@% @% cd \$modulesdir
@% @% @< move module @(m4_tokenizerdir@) @>
@% @% git clone m4_tokenizergit
@% @% if
@% @%   [ $? -gt 0 ]
@% @% then
@% @%   @< logmess @(Cannot install current tokenizer version@) @>
@% @%   @< re-instate old module @(m4_tokenizerdir@) @>
@% @% else
@% @%   @< remove old module @(m4_tokenizerdir@) @>
@% @% fi
@% @% @| @} 

\paragraph{Script}
\label{par:tokenizerscript}

The script runs the tokenizerscript.

@o m4_bindir/m4_tokenizerscript @{@%
#!/bin/bash
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
@% @< set up programming environment @>
JARFILE=\$jarsdir/m4_tokenizerjar
java -Xmx1000m  -jar \$JARFILE tok -l nl --inputkaf
@| @}

@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_tokenizerscript
@%@| @}



\subsubsection{Morphosyntactic parser}
\label{sec:install-morphsynt-parser}


\paragraph{Module}
\label{sec:install-morphosyntmodule}

@d install the morphosyntactic parser @{@%
MODNAM=morphsynparser
DIRN=m4_morphpardir
GITU=m4_morphpargit
GITC=m4_morphpar_commitname
@< install from github @>
cd \$modulesdir/m4_morphpardir
git checkout m4_morphpar_commitname
@| @}


@% @d install the morphosyntactic parser @{@%
@% cd \$modulesdir
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
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
@% @< set up programming environment @>
ROOT=\$piperoot
MODDIR=\$modulesdir/<!!>m4_morphpardir<!!>
@< set alpinohome @>
cat | python \$MODDIR/core/morph_syn_parser.py
@| @}

@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_morphparscript
@%@| @}

@% \subsubsection{Alpino hack}
@% \label{sec:alpinohack}
@% 
@% Install a hack that removes output from Alpino that cannot be
@% interpreted by following modules. It is just a small python
@% script. Actually, it may no longer be necessary.
@% 
@% \paragraph{Module}
@% \label{par:install_alpinohack}
@% 
@% @d directories to create @{m4_moddir/m4_alpinohackdir @| @}
@% 
@% @o m4_moddir/m4_alpinohackdir/m4_alpinohackpythonscript @{@%
@% #!/usr/bin/python
@% import sys
@% 
@% input = sys.stdin
@% 
@% output = ''
@% 
@% for line in input:
@%     line = line.replace('"--','"#')
@%     line = line.replace('--"','#"')
@%     output += line
@% 
@% print output
@% 
@% @| @}
@% 
@% \paragraph{Script}
@% \label{par:alpinohack-script}
@% 
@% @o m4_bindir/m4_alpinohackscript @{@%
@% #!/bin/bash
@% ROOT=m4_aprojroot
@% HACKDIR=\$modulesdir/m4_alpinohackdir
@% cat | python  \$HACKDIR/clean_hack.py 
@% 
@% @| @}

@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_alpinohackscript
@%@| @}


\subsubsection{Nominal coreference-base}
\label{sec:nomcorefgraph}

Get this thing from Github
(\url{https://github.com/opener-project/coreference-base/}) and apply
the instruction of
\url{https://github.com/opener-project/coreference-base/blob/master/core/README.md}. We
implement it, but it does not work yet, because it is too picky on the
structure of the ~NAF~ format.


\paragraph{Module}

@d install coreference-base @{@%
MODNAM=coreference-base
DIRN=m4_corefbasedir
GITU=m4_corefbasegit
GITC=m4_corefbase_commitname
@< install from github @>
@% pip install --upgrade --user hg+https://bitbucket.org/Josu/pykaf#egg=pykaf
@% pip install --upgrade --user networkx
pip install --upgrade  hg+https://bitbucket.org/Josu/pykaf#egg=pykaf
pip install --upgrade  networkx
@| @}


\paragraph{Script}

@o m4_bindir/m4_corefbasescript @{@%
#!/bin/bash
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
@% @< set up programming environment @>
cd $modulesdir/m4_corefbasedir/core
cat | python -m corefgraph.process.file --language nl --singleton --sieves NO
@| @}

@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_corefbasescript
@%@| @}


\subsubsection{Named entity recognition (NERC)}
\label{sec:nerc}

\paragraph{Module}
\label{sec:nercmodule}

The  Nerc program can be installed from Github
(\url{m4_nercgit}). However, the model that is needed is not publicly
available. Therefore, models have been put in the snapshot-tarball.


@d install the NERC module @{@%
@< compile the nerc jar @>
@% @< get the nerc jar @>
@< get the nerc models @>

@% cp -r m4_asnapshotroot/m4_nercdir  \$modulesdir/
@| @}

@% The current version of nerc in Github (\texttt{m4_nercgit}, version
@% m4_nercversion) produces a run-time error and the version that we used
@% previously (version 1.3.6) can no longer be compiled because the
@% correct version of opennlp-tools does no longer exist. Therefore, we
@% just copy an existing jar into the directory for the jars:
@% 
@% @d get the nerc jar @{@%
@% @< get or have @(m4_nercjar@) @>
@% cp \$pipesocket/m4_nercjar \$jarsdir
@% @| @}
@% 

The nerc module is a Java program that is contained in a jar. Put the
source from Github in a temporary directory, compile the jar with java
and move the jar to the jars directory.

@d compile the nerc jar  @{@%
TEMPDIR=`mktemp -d -t nerc.XXXXXX`
cd $TEMPDIR
git clone m4_nercgit
cd ixa-pipe-nerc/
git checkout m4_nerc_commitname
mvn clean package
mv target/m4_nercjar \$jarsdir/
cd \$nuwebdir
rm -rf $TEMPDIR
@| @}




The current version of the pipeline uses the following models, that
have been made avaiable by Rodrigo Agerri on march 2, 2015. Rodrigo
wrote:

\begin{alltt}
  I have recently trained new models for Dutch using both the CoNLL 2002
and the Sonar corpora. These models are better than the one currently
being used in the Dutch Newsreader pipeline. They are not yet in the
resources of the ixa pipes (no public yet) but in the meantime they
might be useful if you plan to do some processing in Dutch.

\end{alltt}

\begin{alltt}
For CoNLL 2002, the new model obtains 83.46 F1, being the previously
best published result 77.05 on that dataset.
The Sonar model is trained on the full corpus, and evaluated using
random 10 fold cross validation. The only previous result I know of
obtains 80.71 F1 wrt to our model which obtains 87.84. However,
because it is not evaluated on a separate test partition I do not take
these results too seriously.

\end{alltt}

\begin{alltt}
You will need to update the ixa-pipe-nerc module. The CoNLL 2002 model
runs as before but to use the Sonar model you need to add the extra
parameter --clearFeatures yes, like this:

\end{alltt}

\begin{alltt}
Sonar model: cat file.pos.naf | java -jar ixa-pipe-nerc-1.3.6.jar tag
-m $nermodel --clearFeatures yes
CoNLL model: cat file.pos.naf | java -jar ixa-pipe-nerc-1.3.6.jar tag
-m $nermodel

http://www.lt3.ugent.be/en/publications/fine-grained-dutch-named-entity-recognition/

\end{alltt}

\begin{alltt}
[..]
In any case, here are the models.

http://ixa2.si.ehu.es/ragerri/dutch-nerc-models.tar.gz

\end{alltt}

The tarball \verb|dutch-nerc-models.tar.gz| contains the models
\verb|m4_nercmodelconll02| and \verb|m4_nercmodelsonar| Both models
have been placed in subdirectory \verb|/m4_nercdir/m4_nercmodeldir/nl| of
the snapshot.

@d get the nerc models @{@%
@< get or have @(m4_nercmodelsball@) @>
mkdir -p \$modulesdir/m4_nercdir
cd \$modulesdir/m4_nercdir
tar -xzf \$pipesocket/m4_nercmodelsball
@% rm \$pipesocket/m4_nercmodelsball
@% cp -r m4_asnapshotroot/m4_nercdir/m4_nercmodeldir \$modulesdir/m4_nercdir/
chmod -R 775 \$modulesdir/m4_nercdir
@| @}



\paragraph{Script}
\label{sec:nercscript}

Make a script that uses the conll02 model and a script that uses the
Sonar model

@% Unfortunately, this module does not accept
@% the \NAF{} version that the previous module supplies. 
@% 
@% @d gawk script to patch NAF for nerc module @{@%
@% patchscript='{gsub("wf id=", "wf wid="); gsub("term id=", "term tid="); print}'
@% @| @}


@o m4_bindir/m4_nerc_conll02_script @{@%
#!/bin/bash
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
@% @< set up programming environment @>
MODDIR=$modulesdir/m4_nercdir
JAR=$jarsdir/m4_nercjar
MODEL=m4_nercmodelconll02
cat | java -Xmx1000m -jar \$JAR tag -m $MODDIR/nl/$MODEL
@| @}


@% It seems that version 1.5.2 does not contain the Sonar model.
@% 
@% @o m4_bindir/m4_nerc_sonar_script @{@%
@% #!/bin/bash
@% source m4_aenvbindir/progenv
@% @% @< set variables that point to the directory-structure @>
@% @% @< set up programming environment @>
@% MODDIR=$modulesdir/m4_nercdir
@% JAR=$jarsdir/m4_nercjar
@% MODEL=m4_nercmodelsonar
@% cat | java -Xmx1000m -jar \$JAR tag -m $MODDIR/m4_nercmodeldir/nl/$MODEL --clearFeatures yes
@% #cat| java           -jar ixa-pipe-nerc-1.3.6.jar tag -m $nermodel --clearFeatures yes
@% @| @}
@% 


@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_nercscript
@%@| @}


\subsubsection{Wordsense-disambiguation}
\label{sec:wsd}

Install WSD from its Github source (\url{m4_wsdgit}). According to
the \texttt{readme} of that module, the next thing to do is, to
execute install-script \texttt{install.sh} or
\texttt{install\_naf.sh}. The latter script installs a
``Support-Vector-Machine'' (\textsc{svm}) module, ``Dutch-SemCor''
(\textsc{dsc}) models and KafNafParserPy.  


\paragraph{Module}
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
MODNAM=wsd
DIRN=m4_wsddir
GITU=m4_wsdgit
GITC=m4_wsd_commitname
@< install from github @>
cd \$modulesdir/m4_wsddir
@< install svm lib @>
@< download svm models @>


@| @}


This part has been copied from \verb|install_naf.sh| in the \textsc{wsd} module.

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

This part has also been copied from \verb|install_naf.sh| in the \textsc{wsd} module.

@d download svm models @{@%
@< get or have @(m4_wsd_snapball@) @>
cd \$modulesdir
tar -xzf \$pipesocket/m4_wsd_snapball
@% rm \$pipesocket/m4_wsd_snapball
@%cp -r m4_aprojroot/m4_snapshotdir/svm_wsd/models .
@% echo 'Downloading models...(could take a while)'
@% wget --user=cltl --password='.cltl.' kyoto.let.vu.nl/~izquierdo/models_wsd_svm_dsc.tgz 2> /dev/null
@% echo 'Unzipping models...'
@% tar xzf models_wsd_svm_dsc.tgz
@% rm models_wsd_svm_dsc.tgz
@% echo 'Models installed in folder models'

@| @}




\paragraph{Script}
\label{sec:wsdscript}

@o m4_bindir/m4_wsdscript @{@%
#!/bin/bash
# WSD -- wrapper for word-sense disambiguation
# 8 Jan 2014 Ruben Izquierdo
# 16 sep 2014 Paul Huygen
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
@% @< set up programming environment @>
WSDDIR=$modulesdir/m4_wsddir
WSDSCRIPT=dsc_wsd_tagger.py
cat | python $WSDDIR/$WSDSCRIPT --naf 
@| @}

@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_wsdscript
@%@| @}

@% \subsubsection{Script}
@% \label{sec:wsdscript}
@% 
@% @o m4_bindir/m4_wsdscript @{@%
@% #!/bin/bash
@% # WSD -- wrapper for word-sense disambiguation
@% # 8 Jan 2014 Ruben Izquierdo
@% # 16 sep 2014 Paul Huygen
@% ROOT=m4_aprojroot
@% WSDDIR=\$modulesdir/m4_wsddir
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


@% We do not yet have a source-repository of the wsd module. Therefore,
@% install from a snapshot on Lisa.
@% 
@% \subsubsection{Module}
@% \label{sec:wsd-module}
@% 
@% @d install the WSD module @{@%
@% @%cp -r m4_asnapshotroot/m4_wsddir \$modulesdir/
@% cp -r m4_aprojroot/m4_snapshotdir/m4_wsddir \$modulesdir/
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
@% WSDDIR=\$modulesdir/m4_wsddir
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

\subsubsection{Lexical-unit converter}
\label{sec:lu2synset}

\paragraph{Module}
\label{sec:lu2synsetinstaller}

There is not an official repository for this module yet, so copy the
module from the tarball.

@d install the lu2synset converter @{@%
@< get or have @(m4_lu2synball@) @>
cd \$modulesdir
tar -xzf \$pipesocket/m4_lu2synball
@% rm \$pipesocket/m4_lu2synball
@| @}

\paragraph{Script}
\label{sec:lu2synsetscript}

@o m4_bindir/m4_lu2synsetscript  @{@%
#!/bin/bash
@% @< set variables that point to the directory-structure @>
source m4_aenvbindir/progenv
ROOT=\$piperoot
JAVALIBDIR=\$modulesdir/m4_lu2syndir/lib
RESOURCESDIR=\$modulesdir/m4_lu2syndir/resources
JARFILE=WordnetTools-1.0-jar-with-dependencies.jar
java -Xmx812m -cp  $JAVALIBDIR/$JARFILE vu.wntools.util.NafLexicalUnitToSynsetReferences \
   --wn-lmf "\$RESOURCESDIR/cornetto2.1.lmf.xml" --format naf 
@| @}



\subsubsection{NED}
\label{sec:ned}

The \NED{} module is rather picky about the structure of the \NAF{} file. In any case, it does not accept a file that has been produced by the ontotagger. Hence, in a pipeline \NED{} should be executed before the ontotagger.


The \NED{} module wants to consult the Dbpedia Spotlight server, so
that one has to be installed somewhere. For this moment, let us
suppose that it has been installed on localhost.




@% \subsubsection{Installation of the spotlight server}
@% \label{sec:spotlightinstall}

@% Itziar Aldabe (\url{mailto:itziar.aldabe@@ehu.es}) wrote:
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
@%     \url{http://spotlight.sztaki.hu/downloads/}
@% \item The jar file with the NED module:
@%     \verb|ixa-pipe-ned-1.0.jar|. You can copy it from the English VM
@%     too.
@% \item The file: \verb|wikipedia-db.v1.tar.gz|. You can download it
@%   from:
@%   \url{http://ixa2.si.ehu.es/ixa-pipes/models/wikipedia-db.v1.tar.gz}. This
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



\paragraph{Module}
\label{sec:ned-module}

@% @d install the \NED{} module @{@%
@% cp m4_asnapshotroot/m4_neddir/m4_nedjar m4_ajardir/
@% mkdir -p \$modulesdir/m4_neddir
@% cd \$modulesdir/m4_neddir
@% wget http://ixa2.si.ehu.es/ixa-pipes/models/wikipedia-db.v1.tar.gz
@% tar -xzf wikipedia-db.v1.tar.gz
@% @| @}

@d install the \NED{} module @{@%
@< put spotlight jar in the Maven repository @>
MODNAM=ned
DIRN=m4_neddir
GITU=m4_nedgit
GITC=m4_ned_commitname
@< install from github @>
cd \$modulesdir/m4_neddir
mvn -Dmaven.compiler.target=m4_maven_javaversion -Dmaven.compiler.source=m4_maven_javaversion clean package
mv target/ixa-pipe-ned-<!!>m4_ned_version.jar \$jarsdir/
@% cp m4_asnapshotroot/m4_neddir/m4_nedjar m4_ajardir/
@% @% mkdir -p \$modulesdir/m4_neddir
@% wget http://ixa2.si.ehu.es/ixa-pipes/models/wikipedia-db.v1.tar.gz
@% tar -xzf wikipedia-db.v1.tar.gz
@| @}

\NED{} needs to have m4_simple_spotlightjar in the local Maven
repository. That is a different jar than the jar that we use to start Spotlight.

@d put spotlight jar in the Maven repository @{@%
echo Put Spotlight jar in the Maven repository.
tempdir=`mktemp -d -t simplespot.XXXXXX`
cd $tempdir
wget m4_spotlight_download_url/m4_simple_spotlightjar
wget m4_spotlight_download_url/m4_spotlight_nl_model_ball
tar -xzf m4_spotlight_nl_model_ball
@% wget m4_spotlight_download_url/m4_spotlight_en_model
@% tar -xzf m4_spotlight_en_model
MVN_SPOTLIGHT_OPTIONS="-Dfile=m4_simple_spotlightjar"
MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -DgroupId=ixa"
MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -DartifactId=dbpedia-spotlight"
MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -Dversion=m4_spotlightjarversion"
MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -Dpackaging=jar"
MVN_SPOTLIGHT_OPTIONS="$MVN_SPOTLIGHT_OPTIONS -DgeneratePom=true"
@% mvn install:install-file -Dfile=dbpedia-spotlight-0.7.jar -DgroupId=ixa -DartifactId=dbpedia-spotlight -Dversion=0.7 -Dpackaging=jar -DgeneratePom=true 
mvn install:install-file $MVN_SPOTLIGHT_OPTIONS

cd $PROJROOT
rm -rf $tempdir
@| @}



\paragraph{Script}
\label{sec:nedscript}

@o m4_bindir/m4_nedscript @{@%
#!/bin/bash
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
@% @< set up programming environment @>
ROOT=\$piperoot
JARDIR=\$jarsdir
@< check/start the Spotlight server @>
cat | java -Xmx1000m -jar \$jarsdir/m4_nedjar  -p 2060 -e candidates -i \$envdir/spotlight/wikipedia-db -n nlEn
@% cat | java -jar \$jarsdir/m4_nedjar  -p 2060  -n nl
@| @}


@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_nedscript
@%@| @}



\subsubsection{Ontotagger}
\label{sec:onto}

We do not yet have a source-repository of the Ontotagger module. Therefore,
install from a snapshot (\texttt{m4_ontotarball}).

\paragraph{Module}
\label{sec:ontotagger-module}

@d install the onto module @{@%
@< get or have @(m4_ontotarball@) @>
@%cp -r m4_asnapshotroot/m4_ontodir \$modulesdir/
cd \$modulesdir
tar -xzf \$pipesocket/m4_ontotarball
rm \$pipesocket/m4_ontotarball
chmod -R o+r \$modulesdir/m4_ontodir
@| @}


\paragraph{Script}
\label{sec:ontoscript}

@o m4_bindir/m4_ontoscript @{@%
#!/bin/bash
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
@% @< set up programming environment @>
ROOT=\$piperoot
ONTODIR=$modulesdir/m4_ontodir
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
@% JAVA_ARGS=\$JAVA_ARGS " -cp \$jarsdir/ontotagger-1.0-jar-with-dependencies.jar"
@% JAVA_ARGS=\$JAVA_ARGS " eu.kyotoproject.main.KafPredicateMatrixTagger"
@% JAVA_ARGS="--mappings \"fn;pb;nb\" "
MAPPINGS="fn;mcr;ili;eso"
JAVA_ARGS="--mappings $MAPPINGS"
JAVA_ARGS="\$JAVA_ARGS  --key odwn-eq"
JAVA_ARGS="\$JAVA_ARGS  --version 1.1"
JAVA_ARGS="\$JAVA_ARGS  --predicate-matrix \$PREDICATEMATRIX"
JAVA_ARGS="\$JAVA_ARGS  --grammatical-words \$GRAMMATICALWORDS"
JAVA_ARGS="\$JAVA_ARGS  --naf-file \$TMPFIL"
java -Xmx1812m -cp \$CLASSPATH \$JAVASCRIPT \$JAVA_ARGS
@% java -Xmx812m -cp ../lib/ontotagger-1.0-jar-with-dependencies.jar eu.kyotoproject.main.KafPredicateMatrixTagger --mappings "fn;mcr;ili;eso" --key odwn-eq --version 1.1 --predicate-matrix "../resources/PredicateMatrix_nl_lu_withESO.v0.2.role.txt" --grammatical-words "../resources/grammaticals/Grammatical-words.nl" --naf-file "../example/test.srl.lexicalunits.naf" > "../example/test.srl.lexicalunits.pm.naf"
@% @< onto javacommand @>
@% java \$JAVA_ARGS
@% java -Xmx1812m -cp $jarsdir/ontotagger-1.0-jar-with-dependencies.jar \
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



@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_ontoscript
@%@| @}


\subsubsection{Framenet SRL}
\label{sec:framesrl}

The framenet \SRL{} is part of the package that contains the ontotagger. We only need a different script.


\paragraph{Script}
\label{sec:framesrlscript}

The script contains a hack, because the framesrl script produces
spurious lines containining ``frameMap.size()=...''. A \textsc{gawk}
script removes these lines.

@o m4_bindir/m4_framesrlscript @{@%
#!/bin/bash
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
@% @< set up programming environment @>
ONTODIR=$modulesdir/m4_ontodir
JARDIR=\$ONTODIR/lib
RESOURCESDIR=\$ONTODIR/resources
@% PREDICATEMATRIX="\$RESOURCESDIR/PredicateMatrix.v1.1/PredicateMatrix.v1.1.role.nl-1.merged"
PREDICATEMATRIX="\$RESOURCESDIR/PredicateMatrix_nl_lu_withESO.v0.2.role.txt"
GRAMMATICALWORDS="\$RESOURCESDIR/grammaticals/Grammatical-words.nl"
TMPFIL=`mktemp -t framesrl.XXXXXX`
cat >$TMPFIL

CLASSPATH=\$JARDIR/ontotagger-1.0-jar-with-dependencies.jar
JAVASCRIPT=eu.kyotoproject.main.SrlFrameNetTagger

JAVA_ARGS="--naf-file \$TMPFIL"
JAVA_ARGS="\$JAVA_ARGS  --format naf"
JAVA_ARGS="\$JAVA_ARGS  --frame-ns fn:"
JAVA_ARGS="\$JAVA_ARGS   --role-ns fn-role:;pb-role:;fn-pb-role:;eso-role:"
JAVA_ARGS="\$JAVA_ARGS   --ili-ns mcr:ili"
JAVA_ARGS="\$JAVA_ARGS   --sense-conf 0.25"
JAVA_ARGS="\$JAVA_ARGS   --frame-conf 70"

java -Xmx1812m -cp \$CLASSPATH \$JAVASCRIPT \$JAVA_ARGS  | gawk '/^frameMap.size()/ {next}; {print}'
@% java -Xmx1812m -cp ../lib/ontotagger-1.0-jar-with-dependencies.jar eu.kyotoproject.main.SrlFrameNetTagger --naf-file "../example/test.srl.lexicalunits.pm.naf" --format naf --frame-ns "fn:" --role-ns "fn-role:;pb-role:;fn-pb-role:;eso-role:" --ili-ns "mcr:ili" --sense-conf 0.25 --frame-conf 70 > "../example/test.srl.lexicalunits.pm.fn.naf"
rm -rf \$TMPFIL

@| @}


@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_framesrlscript
@%@| @}


\subsubsection{Heideltime}
\label{sec:heideltime}

\paragraph{Module}
\label{sec:heideltimmodule}

The code for Heideltime can be found in
\href{https://github.com/HeidelTime/heideltime}{Github}. However, we
use a compiled Heideltime Jar, compiled by Antske Fokkens, because
some bugs have been repaired in that version.

Use Heideltime via a wrapper, \texttt{ixa-pipe-time}, obtained from
\href{https://github.com/ixa-ehu/ixa-pipe-time}{Github}.

Heideltime uses treetagger. It expects to find the location of
treetagger in a variable \texttt{TreetaggerHome} in config-file
\verb|config.props|.




@d install the heideltime module @{@%
moduledir=m4_amoddir/m4_heideldir
@< clone the heideltime wrapper @>
@< put Antske's material in the heideltime wrapper @>
@< compile the heideltime wrapper @>
@| @}


@d clone the heideltime wrapper @{@%
MODNAM=heideltime
DIRN=m4_heideldir
GITU=m4_heidelgit
GITC=m4_heidel_commitname
@< install from github @(m4_heidelndir@) @>
mkdir $moduledir/lib
@| @}

In the wrapper we need the following extra material:
\begin{itemize}
\item A debugged version of the Heidelberg jar.
\item A configuration file \texttt{config.props}, although it does not seem to be actually used.
\item Another configuration file: \texttt{alpino-to-treetagger.csv}
\end{itemize}
The extra material has been provided by Antske Fokkens.


@d put Antske's material in the heideltime wrapper @{@%
@< get or have @(m4_heidelantske@) @>
cd $modulesdir/$DIRN
tar -xzf m4_asocket/m4_heidelantske
mv antske_heideltime_stuff/m4_heidelstandalonejar lib/
mv antske_heideltime_stuff/config.props .
mv antske_heideltime_stuff/alpino-to-treetagger.csv .
rm -rf antske_heideltime_stuff
@| @}

Compile the Heideltime wrapper according to the \href{m4_heidelhtml}{instruction} on Github.

@d compile the heideltime wrapper @{@%
@< get jvntextpro-2.0.jar @>
@< activate the install-to-project-repo utility @>
cd m4_amoddir/$DIRN
mvn clean install
@| @}

@d get jvntextpro-2.0.jar @{@%
cd  m4_amoddir/$DIRN/lib
wget http://ixa2.si.ehu.es/%7Ejibalari/jvntextpro-2.0.jar
@| @}

@d activate the install-to-project-repo utility @{@%
cd m4_amoddir/$DIRN/
git clone git@@github.com:carchrae/install-to-project-repo.git
mv install-to-project-repo/install-to-project-repo.py .
rm -rf install-to-project-repo
python ./install-to-project-repo.py
@| @}

@% 
@% One of the elements of Heideltime (the jar
@% \verb|de.unihd.dbs.heideltime.standalone.jar| in
@% \verb|NAF-HeidelTime/heideltime-standalone| has been updated and the
@% Github version is outdated. Therefore, get the latest version from the snapshot.
@% 
@% @d install the heideltime module @{@%
@% @< update the heideltime jar @>
@% @< adapt heideltime's config.props @>
@% @| @}
@% 
@% @d adapt heideltime's config.props @{@%
@% CONFIL=\$modulesdir/m4_heideldir/config.props
@% tempfil=`mktemp -t heideltmp.XXXXXX`
@% mv $CONFIL \$tempfil
@% @% MODDIR=\$modulesdir
@% TREETAGDIR=m4_treetagdir
@% AWKCOMMAND='/^treeTaggerHome/ {\$0="treeTaggerHome = '\$modulesdir'/m4_treetagdir"}; {print}'
@% gawk "\$AWKCOMMAND" \$tempfil >\$CONFIL
@% rm -rf $tempfil
@% @| @}
@% 
@% @d update the heideltime jar @{@%
@% standalonejar=m4_heidelstandalonejar
@% replstandalonejar=m4_replace_heidelstandalonejar
@% cd \$modulesdir/m4_heideldir/heideltime-standalone
@% rm -f \$standalonejar
@% scp -i "\$pipesocket/m4_snapshotkeyfilename" m4_repo_user<!!>@@<!!>m4_repo_url:m4_repo_path/\$replstandalonejar ./\$standalonejar
@% @| @}
@% 
@% 
@% 
@% When the installation has been transplanted, \verb|config.props| must be updated:
@% 
@% @d set paths after transplantation @{@%
@% @< adapt heideltime's config.props @>
@% @| @}

@% \paragraph{New module}
@% \label{sec:heideltimenewmodule}
@% 
@% Heideltime has been updated. In princple the Heideltim module ought to be installed as described in the following message from Itziar Aldabe:
@% 
@% \begin{verbatim}
@% 
@% I managed to get everything ready, except for the README in github. I'll update it next
@% week but I think I can give you some simple steps that should be enough to correctly
@% use the module 
@% 
@% 1.- Download the code: git clone https://github.com/ixa-ehu/ixa-pipe-time.git
@% 
@% 2.- In the ixa-pipe-time create the lib directory
@% 
@% 3.- Download the HeidelTimeStandalone jar file from https://code.google.com/p/heideltime/
@% 
@%   If you download the heideltime-standalone-1.7 zip file, you will find two files that you need:
@%   - de.unihd.dbs.heideltime.standalone.jar
@%   - config.props => you will need this file to correctly execute the new time module
@% 
@%   move the jar file to the lib directory
@% 
@% 4.- Download a copy of JVnTextPro from http://ixa2.si.ehu.es/~jibalari/jvntextpro-2.0.jar
@% 
@%   move the jar file to the lib directory
@% 
@% 5.- Download the following script https://github.com/carchrae/install-to-project-repo/blob/master/install-to-project-repo.py
@% 
@% 6.- Execute the script within the ixa-pipe-time directory
@% 
@%    => It will create the repo directory and two dependencies that you don't need to copy in the pom.xml file. It is necessary to run the scrip to correctly create the repo directory. Don't copy the anything in the pom file.
@% 
@% 7.- Download the mappings file: http://ixa2.si.ehu.es/~jibalari/eagles-to-treetager.csv
@% 
@% 8.- Create the jar file for the time module
@%     mvn clean install
@% 
@% 9.- Test the module
@% 
@%    cat pos.naf | java -jar ${dirToJAR}/ixa.pipe.time.jar -m ${dirToFile}/eagles-to-treetager.csv -c ${dirToFile}/config.props
@% 
@% 
@%    I think everything needed is included in the list of steps. Let me know if something is not clear.
@% 
@% 
@% Regards,
@% Itziar
@% 
@% 
@% \end{verbatim}
@% 
@% Unfortunately, this procedure does not always seem to work. On the test-computer (Ubuntu Linux version 14.04) the instruction 
@% \verb|mvn clean package| results in the following error message:
@% 
@% \begin{verbatim}
@% (venv)paul@@klipperaak:~/projecten/cltl/pipelines/nlpp/modules/ixa-pipe-time$ mvn clean package
@% [INFO] Scanning for projects...
@% [INFO]                                                                         
@% [INFO] ------------------------------------------------------------------------
@% [INFO] Building IXAPipeHeidelTime 1.0.1
@% [INFO] ------------------------------------------------------------------------
@% [WARNING] The POM for local:de.unihd.dbs.heideltime.standalone:jar:1.0 is missing, no dependency information available
@% [INFO] ------------------------------------------------------------------------
@% [INFO] BUILD FAILURE
@% [INFO] ------------------------------------------------------------------------
@% [INFO] Total time: 0.650s
@% [INFO] Finished at: Wed Jul 15 09:40:39 CEST 2015
@% [INFO] Final Memory: 7M/232M
@% [INFO] ------------------------------------------------------------------------
@% [ERROR] Failed to execute goal on project time: Could not resolve dependencies for project ixa.pipe:time:jar:1.0.1: Failure to find local:de.unihd.dbs.heideltime.standalone:jar:1.0 in file:///home/paul/projecten/cltl/pipelines/nlpp/modules/ixa-pipe-time/repo was cached in the local repository, resolution will not be reattempted until the update interval of heideltime-local-dependency-repo has elapsed or updates are forced -> [Help 1]
@% [ERROR] 
@% [ERROR] To see the full stack trace of the errors, re-run Maven with the -e switch.
@% [ERROR] Re-run Maven using the -X switch to enable full debug logging.
@% [ERROR] 
@% [ERROR] For more information about the errors and possible solutions, please read the following articles:
@% [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/DependencyResolutionException
@% 
@% \end{verbatim}
@% 
@% 
@% Therefore we have compiled the module in a computer where it worked and put the result in the snapshot.
@% 
@% @d install the new heideltime module @{@%
@% @< get or have @(m4_heidelnball@) @>
@% cd \$modulesdir
@% tar -xzf \$pipesocket/m4_heidelnball
@% @| @}



@% \begin{enumerate}
@% \item Download the code: \verb|git clone https://github.com/ixa-ehu/ixa-pipe-time.git|
@% \item Get the heideltime stand-alone jar from 
@% \end{enumerate}
@% 
@% @d install the new heideltime module @{@%
@% MODNAM=m4_heidelndir
@% DIRN=m4_heidelndir
@% GITU=m4_heidelngit
@% GITC=m4_heidelncommitname
@% @< install from github @>
@% @< get the heideltime standalone jar and config.props @>
@% @< get and execute m4_installtoprojectpy @>
@% @< download the mappings file @>
@% @< create the jar file for the time module @>
@% @| @}
@% 
@% @d get the heideltime standalone jar and config.props @{@%
@% cd \$modulesdir/m4_heidelndir
@% mkdir lib
@% wget m4_heidelnstandaloneurl
@% tar -zxf m4_heidelnstandaloneball
@% mv heideltime-standalone/m4_heidelnstandalonejar lib/
@% mv heideltime-standalone/config.props .
@% cd lib
@% wget  http://ixa2.si.ehu.es/~jibalari/jvntextpro-2.0.jar
@% cd ..
@% @| @}
@% 
@% @d get and execute m4_installtoprojectpy @{@%
@% cd \$modulesdir/m4_heidelndir
@% git clone https://github.com/carchrae/install-to-project-repo.git
@% python m4_installtoprojectpy
@% 
@% wget  m4_installtoprojectpyurl
@% @| @}
@% 
@% @d download the mappings file @{@%
@% wget m4_mappingsfileurl
@% @| @}
@% 
@% @d create the jar file for the time module @{@%
@% mvn clean install
@% @| @}



\paragraph{Script}
\label{sec:heideltime-script}

@o m4_bindir/m4_heidelscript @{@%
#!/bin/bash
source m4_aenvbindir/progenv
HEIDELDIR=\$modulesdir/m4_heideldir
cd $HEIDELDIR
iconv -t utf-8//IGNORE | java -jar target/ixa.pipe.time.jar -m alpino-to-treetagger.csv -c config.props
@| @}

@% @o m4_bindir/m4_heidelscript @{@%
@% #!/bin/bash
@% source m4_aenvbindir/progenv
@% @% @< set variables that point to the directory-structure @>
@% @% @< set up programming environment @>
@% @% ROOT=m4_aprojroot
@% HEIDELDIR=\$modulesdir/m4_heideldir
@% TEMPDIR=`mktemp -t -d heideltmp.XXXXXX`
@% cd $HEIDELDIR
@% @% @< activate the python environment @>
@% iconv -t utf-8//IGNORE | python \$HEIDELDIR/HeidelTime_NafKaf.py \$HEIDELDIR/heideltime-standalone/ \$TEMPDIR
@% rm -rf $TEMPDIR
@% @| @}

@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_heidelscript
@%@| @}

\subsubsection{Semantic Role labelling}
\label{sec:SRL}

\paragraph{Module}
\label{sec:SRL-module}

@d install the srl module @{@%
MODNAM=srl
DIRN=m4_srldir
GITU=m4_srlgit
GITC=m4_srl_commitname
@< install from github @>
@%cp -r m4_asnapshotroot/m4_srldir \$modulesdir/
@| @}


\paragraph{Script}
\label{sec:SRLscript}


First:
\begin{enumerate}
\item set the correct environment. The module needs python and timble.
\item  create a tempdir and in that dir a file to store the input and a (\textsc{scv}) file with the feature-vector.
\end{enumerate}

@o m4_bindir/m4_srlscript @{@%
#!/bin/bash
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
ROOT=$piperoot
SRLDIR=\$modulesdir/m4_srldir
TEMPDIR=`mktemp -d -t SRLTMP.XXXXXX`
cd \$SRLDIR
@% @< set local bin directory @>
@% @< activate the python environment @>
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
timbl -mO:I1,2,3,4 -i 25Feb2015_e-mags_mags_press_newspapers.wgt -t \$FEATUREVECTOR -o \$TIMBLOUTPUTFILE >/dev/null 2>/dev/null
@| @}

Insert the \textsc{srl} values into the \textsc{naf} file.

@o m4_bindir/m4_srlscript @{@%
python timblToAlpinoNAF.py \$INPUTFILE \$TIMBLOUTPUTFILE
@| @}


Clean up.

@o m4_bindir/m4_srlscript @{@%
rm -rf \$TEMPDIR
@| @}

\subsubsection{SRL postprocessing}
\label{sec:srlpost}

In addition to the Semantic Role Labeling there is hack that finds additional semantic roles. 

\paragraph{Module}

Find the (Python) module in the snapshot and unpack it.

@d install the post-SRL module @{@%
@< get or have @(m4_postsrlball@) @>
cd \$modulesdir
tar -xzf \$pipesocket/m4_postsrlball
@| @}

@d clean up @{@%
rm -rf \$pipesocket/m4_postsrlball
@| @}

\paragraph{Script}

@o m4_bindir/m4_postsrlscript @{@%
#!/bin/bash
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
MODDIR=\$modulesdir/<!!>m4_postsrldir
cat | python \$MODDIR/m4_postsrlpy
@| @}



@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_srlscript
@%@| @}

\subsubsection{Event coreference}
\label{sec:eventcoref}

\paragraph{Module}
\label{sec:event-coref-module}

Install the module from the snapshot.

@d install the event-coreference module @{@%
@< get or have @(m4_evcoreftarball@) @>
cd \$modulesdir
tar -xzf \$pipesocket/m4_evcoreftarball
cd m4_evcorefdir
cp lib/m4_evcorefjar \$jarsdir
@| @}



\paragraph{Script}
\label{sec:evcorefscript}

@o m4_bindir/m4_evcorefscript @{@%
#!/bin/bash
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
@% @< set up programming environment @>
MODROOT=$modulesdir/m4_evcorefdir
RESOURCESDIR=$MODROOT/resources
JARFILE=\$jarsdir/m4_evcorefjar

JAVAMODULE=eu.newsreader.eventcoreference.naf.EventCorefWordnetSim
JAVAOPTIONS="--method leacock-chodorow"
JAVAOPTIONS="$JAVAOPTIONS  --wn-lmf $RESOURCESDIR/cornetto2.1.lmf.xml"
JAVAOPTIONS="$JAVAOPTIONS  --sim 2.0"
JAVAOPTIONS="$JAVAOPTIONS  --relations XPOS_NEAR_SYNONYM#HAS_HYPERONYM#HAS_XPOS_HYPERONYM"

@% #### Within document event coreference wordnet sim
@% #rootDir=/home/newsreader/components/VUA-eventcoref.v21/
@% rootDir=/Tools/nwr-dutch-pipeline/vua-eventcoreference_v2/

java -Xmx812m -cp \$JARFILE \$JAVAMODULE  $JAVAOPTIONS

@% java -Xmx812m -cp "$rootDir/lib/m4_evcorefjar" \$JAVAMODULE  --method leacock-chodorow --wn-lmf "$rootDir/resources/cornetto2.1.lmf.xml" --sim 2.0 —relations XPOS_NEAR_SYNONYM#HAS_HYPERONYM#HAS_XPOS_HYPERONYM
@| @}

@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_evcorefscript
@%@| @}

\subsubsection{Dbpedia-ner}
\label{sec:dbpedia-ner}

Dbpedia-ner finds more named entities thatn NER, because it checks
DBpedia for the candidate NE-'s.


\paragraph{Module}
\label{sec:dbpedia-ner-module}

@d install the dbpedia-ner module @{@%
MODNAM=dbpedia_ner
DIRN=m4_dbpnerdir
GITU=m4_dbpnergit
GITC=m4_dbpner_commitname
@< install from github @>
@| @}

\paragraph{Script}
\label{par:dbpnerscript}

The main part of the module is a Python script. The \verb|README.md| file of the Github repo lists the options that
can be applied. One of the options is about the \textsc{url} of the
Spotlight server.

@o m4_bindir/m4_dbpnerscript @{@%
#!/bin/bash
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
@< check/start the Spotlight server @>
MODDIR=\$modulesdir/<!!>m4_dbpnerdir<!!>
cat | iconv -f ISO8859-1 -t UTF-8 | $MODDIR/dbpedia_ner.py -url http://localhost:2060/rest/candidates
@| @}


\subsubsection{Nominal events}
\label{sec:nomevents}

The module ``postprocessing-nl'' adds nominal events to the srl
annotations. It has been obtained directly from the author (Piek
Vossen). It is not yet available in a public repo. Probably in future
versions the jar from the ontotagger module can be used for this module.


\paragraph{Module}
\label{sec:nemeventmodule}

@d install the nomevent module @{@%
@< get or have @(m4_nomeventball@) @>
cd \$modulesdir
unzip -q \$pipesocket/m4_nomeventball
@| @}

\paragraph{Script}
\label{par:dbpnerscript}

@o m4_bindir/m4_nomeventscript @{@%
#!/bin/bash
source m4_aenvbindir/progenv
@% @< set variables that point to the directory-structure @>
MODDIR=\$modulesdir/<!!>m4_nomeventdir<!!>
LIBDIR=\$MODDIR/lib
RESOURCESDIR=\$MODDIR/resources

JAR=\$LIBDIR/ontotagger-1.0-jar-with-dependencies.jar
JAVAMODULE=eu.kyotoproject.main.NominalEventCoreference
cat | iconv -f ISO8859-1 -t UTF-8 | java -Xmx812m -cp $JAR $JAVAMODULE --framenet-lu $RESOURCESDIR/nl-luIndex.xml
@| @}


\subsubsection{Opinion miner}
\label{sec:opinimin}

To run the opinion-miner, the following things are needed:

\begin{itemize}
\item SVMlight
\item crfsuite
\item vua-pylib
\end{itemize}

\paragraph{Module}

The module can be cloned from Github. However, currently there are
problems with the Github installation. Therefore we borrow the opinion
miner from the English \textsc{nwr} pipeline.

@d install the opinion-miner @{@%
@< get or have @(m4_opini_temp_ball@) @>
cd m4_amoddir
tar -xzf m4_asocket/m4_opini_temp_ball
@| @}

The opinion-miner needs a configuration file that is located in the
directory where the model-data resides. In this pipeline we will use
model-data derived from news-articles. An alternative model, derived
from hotel evaluations can also be used. Put the configuration file in
the \texttt{etc} subdir and copy it to its proper location during the
installation of the opinion-miner.

@o m4_envetcdir/m4_opini_nl_conf @{@%
[general]
output_folder = m4_amoddir/m4_opinidir/final_models/nl/news_cfg1

[crfsuite]
path_to_binary = m4_aenvbindir/crfsuite

[svmlight]
path_to_binary_learn = m4_aenvbindir/svm_learn
path_to_binary_classify = m4_aenvbindir/svm_classify
@| @}

@d install the opinion-miner @{@%
cd m4_opinidir
cp m4_aenvetcdir/m4_opini_nl_conf \$modulesdir/m4_opinidir/m4_opini_dutchmodel_subdir/config.cfg
@| @}



@% It must be completed with
@%trained models and a configuration file that tells where things
@%can be found.
@%
@%@d install the opinion-miner @{@%
@%MODNAM=opiniminer
@%DIRN=m4_opinidir
@%GITU=m4_opinigit
@%GITC=m4_opini_commitname
@%@< install from github @>
@%cd m4_amoddir/m4_opinidir
@%@< get or have @(m4_opini_trained_models_ball@) @>
@%tar -xzf m4_asocket/m4_opini_trained_models_ball
@%
@%@| @}
@%
@% @o m4_envetcdir/m4_opini_nl_conf @{@%
@% [general]
@% output_folder = m4_amoddir/m4_opinidir/final_models/nl/news_cfg1
@% 
@% 
@% [crfsuite]
@% path_to_binary = m4_aenvbindir/crfsuite
@% 
@% [svmlight]
@% path_to_binary_learn = m4_aenvbindir/svm_learn
@% path_to_binary_classify = m4_aenvbindir/svm_classify
@% @| @}

\paragraph{Script}

@o m4_bindir/m4_opiniscript @{@%
#!/bin/bash
source m4_aenvbindir/progenv
rootDir=\$modulesdir/m4_opinidir
cd $rootDir
export PATH=$PATH:.
python classify_kaf_naf_file.py -m \$rootDir/final_models/nl/news_cfg1


@| @}

@% @o m4_bindir/m4_opiniscript @{@%
@% #!/bin/bash
@% source m4_aenvbindir/progenv
@% cd m4_amoddir/m4_opinidir
@% python classify_kaf_naf_file.py m4_aenvetcdir/m4_opini_nl_conf
@% @| @}


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
mkdir -p $TESTDIR
cd $TESTDIR
cat \$ROOT/nuweb/testin.naf    | \$BIND/tok                    > \$TESTDIR/test.tok.naf
cat test.tok.naf              | \$BIND/mor                    > \$TESTDIR/test.mor.naf
@% cat test.mor.naf | $BIND/nerc > $TESTDIR/test.nerc.naf
cat test.mor.naf              | \$BIND/m4_nerc_conll02_script > \$TESTDIR/test.nerc.naf
cat \$TESTDIR/test.nerc.naf    | \$BIND/wsd                    > \$TESTDIR/test.wsd.naf
cat \$TESTDIR/test.wsd.naf     | \$BIND/ned                    > \$TESTDIR/test.ned.naf
cat \$TESTDIR/test.ned.naf     | \$BIND/heideltime             > \$TESTDIR/test.times.naf
cat \$TESTDIR/test.times.naf   | \$BIND/onto                   > \$TESTDIR/test.onto.naf
cat \$TESTDIR/test.onto.naf    | \$BIND/srl                    > \$TESTDIR/test.srl.naf
cat \$TESTDIR/test.srl.naf     | \$BIND/m4_evcorefscript       > \$TESTDIR/test.ecrf.naf
cat \$TESTDIR/test.ecrf.naf    | \$BIND/m4_framesrlscript      > \$TESTDIR/test.fsrl.naf
cat \$TESTDIR/test.fsrl.naf    | \$BIND/m4_dbpnerscript        > \$TESTDIR/test.dbpner.naf
cat \$TESTDIR/test.dbpner.naf  | \$BIND/m4_nomeventscript      > \$TESTDIR/test.nomev.naf
cat \$TESTDIR/test.nomev.naf   | \$BIND/postsrl                > \$TESTDIR/test.psrl.naf
cat \$TESTDIR/test.psrl.naf    | \$BIND/m4_opiniscript         > \$TESTDIR/test.opin.naf
@| @}

@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/test
@%@| @}







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
cd \$modulesdir
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

Macro's can be defined on different places. They can contain other macro's.

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
  \input{fileschema.pdftex_t}
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


\subsection{The Makefile for this project.}
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

@d make targets @{@%
clean:
	@< clean up @>

@| @}



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

Put the nuweb binary in the nuweb subdirectory, so that it can be used before the directory-structure has been generated.

@% @d parameters in Makefile @{@%
@% NUWEB=./nuweb
@% @| NUWEB @}

@d expliciete make regels @{@%

nuweb: $(NUWEB)

$(NUWEB): m4_projroot/m4_nuwebsource
	mkdir -p m4_envbindir
	cd m4_projroot/m4_nuwebsource && make nuweb
	cp m4_projroot/m4_nuwebsource/nuweb $(NUWEB)

@| @}

@d clean up @{@%
rm -rf m4_projroot/m4_nuwebsource
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
FIGFILES=fileschema directorystructure

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



@% Note, that in the following \texttt{make} construct, the implicit rule
@% \verb|.w.pdf| is not used. It turned out, that make did not calculate
@% the dependencies correctly when I did use this rule.
@% 
@% @d  impliciete make regels@{@%
@% @%.w.pdf :
@% %.pdf : %.w \$(W2PDF)  \$(PDF_FIG_NAMES) \$(PDFT_NAMES)
@% 	chmod 775 \$(W2PDF)
@% 	\$(W2PDF) \$*
@% 
@% @| @}

@% Unfortunately, the above rule does not seem to work as expected. When
@% the Makefile is invoked while  \texttt{nlpp.pdf} doens not exists,
@% make produces the following message:
@% 
@% \begin{verbatim}
@% paul@@klipperaak:/mnt/sdb1/pipelines/testnlpp/nlpp/nuweb$ make pdf
@% make: *** No rule to make target `nlpp.pdf', needed by `pdf'.  Stop.
@% 
@% \end{verbatim}
@% 
@% Therefore we add the following explicit rule:


@d make targets @{@%
nlpp.pdf : nlpp.w \$(W2PDF)  \$(PDF_FIG_NAMES) \$(PDFT_NAMES)
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
NUWEB=m4_anuwebbinary
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

To create a \textsc{html} doc, we do the following:

\begin{enumerate}
\item Create a directory \texttt{m4_htmldocdir} for the \textsc{html} document.
\item Put the nuweb source in it, together with style-files that are needed (see variable \texttt{HTMLSOURCE}).
\item Put the script \texttt{w2html} in it and make it executable.
\item Execute the script \texttt{w2html}.
\end{enumerate}

Make a list of the entities that we mentioned above:

@d parameters in Makefile @{@%
htmldir=m4_htmldocdir
htmlsource=m4_progname<!!>.w m4_progname<!!>.bib m4_html_style m4_4ht_template w2html
htmlmaterial=\$(foreach fil, \$(htmlsource), \$(htmldir)/\$(fil))
htmltarget=$(htmldir)/m4_progname<!!>.html
@| @}

Make the directory:

@d expliciete make regels @{@%
$(htmldir) : 
	mkdir -p $(htmldir)

@| @}

The rule to copy files in it:

@d impliciete make regels  @{@%
$(htmldir)/% : % $(htmldir)
	cp $< $(htmldir)/

@| @}

Do the work:

@d expliciete make regels @{@%
$(htmltarget) : $(htmlmaterial) $(htmldir) 
	cd $(htmldir) && chmod 775 w2html
	cd $(htmldir) && ./w2html nlpp.w

@| @}

Invoke:

@d  make targets @{@%
htm : $(htmldir) $(htmltarget)

@| @}



@% Nuweb creates a \LaTeX{} file that is suitable
@% for \verb|latex2html| if the source file has \verb|.hw| as suffix instead of
@% |.w|. However, this feature is not compatible with tex4ht.
@% 
@% To generate \texttt{html} we need a directory with the following:
@% \begin{itemize}
@% \item Source file \texttt{m4_progname<!!>.w} and bib file \texttt{m4_progname<!!>.bib} 
@% \item Style files \texttt{m4_html_style} and \texttt{m4_4ht_template}.
@% \item Script \texttt{w2html} that generates the \textsc{html} document.
@% @% \item Files with the images (\texttt{.pstex}) and \texttt{pstex_t})
@% \end{itemize}
@% 


@% @d parameters in Makefile @{@%
@% _PS_FIG_NAMES=\$(foreach fil,\$(FIGFILES), m4_htmldocdir/\$(fil).pstex)
@% HTML_PST_NAMES=\$(foreach fil,\$(FIGFILES), m4_htmldocdir/\$(fil).pstex_t)
@% @| @}



@% @d impliciete make regels @{@%
@% m4_htmldocdir/%.pstex : %.pstex
@% 	cp  \$< \$@@
@% 
@% m4_htmldocdir/%.pstex_t : %.pstex_t
@% 	cp  \$< \$@@
@% 
@% @| @}
@% 

@% The author prefers a non-standard \LaTeX{} document-class
@% (i.e. \texttt{artikel3}) above the standard. However, \texttt{htlatex}
@% needs a kind of class file with the same name as tje documentclass,
@% but with extension \texttt{.4ht}. So, let us provide such a thing.
@% 
@% @d expliciete make regels @{@%
@% html/m4_4ht_template : m4_4ht_template
@% 	cp m4_4htfilsource m4_4htfildest
@% 
@% @| @}



@% \texttt{htlatex} cannot handle this documentstyle
@% correctly. Therefore, copy the nuweb file into the \texttt{html}
@% subdirectory, but change the documentstyle with the following
@% \textsc{awk} script.
@% 
@% @d parameters in Makefile @{@%
@% HTMLKLUDGE='/\\documentclass/ {$0 = "\\documentclass{article}"}; {print}'
@% @| @}


@% @d expliciete make regels @{@%
@% m4_htmlsource : m4_progname.w
@% 	cp m4_progname m4_htmlsource
@% 
@% @| @}
@% 
@% Copy the bibliography.
@% 
@% @d expliciete make regels  @{@%
@% m4_htmlbibfil : m4_nuwebdir/m4_progname.bib
@% 	cp m4_nuwebdir/m4_progname.bib m4_htmlbibfil
@% 
@% @| @}



@% Make a dvi file with \texttt{w2html} and then run
@% \texttt{htlatex}. 
@% 
@% @d expliciete make regels @{@%
@% m4_htmltarget : m4_htmlsource m4_4htfildest \$(HTML_PS_FIG_NAMES) \$(HTML_PST_NAMES) m4_htmlbibfil
@% 	cp w2html m4_bindir
@% 	cd m4_bindir && chmod 775 w2html
@% 	cd m4_htmldocdir && m4_bindir/w2html m4_progname.w
@% 
@% @| @}
@% 
Create a script that performs the translation.

@%m4_<!!>opencompilfil(m4_htmldocdir/,`w2dvi',`latex')m4_dnl


@o w2html @{@%
#!/bin/bash
# w2html -- make a html file from a nuweb file
# usage: w2html [filename]
#  [filename]: Name of the nuweb source file.
<!#!> m4_header
echo "translate " \$1 >w2html.log
NUWEB=m4_anuwebbinary
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


\subsection{Create the program sources}
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

@d make scripts executable @{@%
chmod -R 775  m4_bindir/*
chmod -R 775  m4_envbindir/*
@| @}



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

\subsection{Restore paths after transplantation}
\label{sec:paths-restore}

When an existing installation has been transplanted to another
location, many path indications have to be adapted to the new
situation. The scripts that are generated by nuweb can be repaired by
re-running nuweb. After that, configuration files of some modules must
be modified.

@d make targets @{@%
transplant :
	touch a_<!!>m4_progname<!!>.w
	$(MAKE) sources
	m4_envbindir/transplant

@| @}


In order to work as expected, the following script must be re-made
after a transplantation.

@o m4_envbindir/transplant @{@%
#!/bin/bash
LOGLEVEL=1
@< set variables that point to the directory-structure @>
@< set paths after transplantation @>
@< re-install modules after the transplantation @>

@| @}



\section{References}
\label{sec:references}

\subsection{Literature}
\label{sec:literature}

\bibliographystyle{plain}
\bibliography{m4_progname}

@% \subsection{URL's}
@% \label{sec:urls}
@% 
@% \begin{description}
@% \item[Nuweb:] \url{m4_nuwebURL}
@% \item[Apache Velocity:] \url{m4_velocityURL}
@% \item[Velocitytools:] \url{m4_velocitytoolsURL}
@% \item[Parameterparser tool:] \url{m4_parameterparserdocURL}
@% \item[Cookietool:] \url{m4_cookietooldocURL}
@% \item[VelocityView:] \url{m4_velocityviewURL}
@% \item[VelocityLayoutServlet:] \url{m4_velocitylayoutservletURL}
@% \item[Jetty:] \url{m4_jettycodehausURL}
@% \item[UserBase javadoc:] \url{m4_userbasejavadocURL}
@% \item[VU corpus Management development site:] \url{http://code.google.com/p/vucom} 
@% \end{description}

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
