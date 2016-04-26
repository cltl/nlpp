m4_include(inst.m4)m4_dnl
m4_dnl m4_sinclude(../../local.m4)m4_dnl
m4_sinclude(/tmp/local.m4)m4_dnl
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
\newcommand{\MOR}{\textsc{mor}}
\newcommand{\NAF}{\textsc{naf}}
\newcommand{\NERC}{\textsc{nerc}}
\newcommand{\NED}{\textsc{ned}}
\newcommand{\NLP}{\textsc{nlp}}
\newcommand{\POS}{\textsc{pos}}
\newcommand{\SRL}{\textsc{srl}}
\newcommand{\UKB}{\textsc{ukb}}
\newcommand{\WSD}{\textsc{wsd}}
\newcommand{\XML}{\textsc{xml}}
\def\CaptionTextFont{\small\slshape}
\title{\thedoctitle}
\author{\theauthor}
\date{m4_docdate}
m4_include(texinclusions.m4)m4_dnl
\begin{document}
\maketitle
\begin{abstract}
  This is a description and documentation of the installation of an
  instrument to annotate Dutch or English documents with \NLP{} tags.
\end{abstract}
\tableofcontents
\section{Introduction}
\label{sec:Introduction}

This document describes the current set-up of a pipeline that annotates
texts in order to extract knowledge. The pipeline has been set
up by the Computational Lexicology an Terminology Lab
(\CLTL{}~\footnote{\url{http://wordpress.let.vupr.nl}}) as part
of the newsreader~\footnote{http://www.newsreader-project.eu}
project. It accepts and produces texts in the \NAF{} (Newsreader
Annotation Format) format. 

Apart from describing the pipeline set-up, the document actually
constructs the pipeline. The pipeline has been installed on a (Ubuntu) Linux computer.
@% Currently, the pipeline has been succesfully
@% implemented on a specific supercomputer (Lisa, Surfsara,
@% Amsterdam~\footnote{https://surfsara.nl/systems/lisa}) and on
@% computers running Ubuntu and Centos. 

The installation has been parameterised. The locations and names that
you read (and that will be used to build the pipeline) have been read
from variables in file \texttt{inst.m4} in the nuweb directory.  

The pipeline is bi-lingual. It is capable to annotate Dutch and
English texts. It recognizes the language from the ``lang'' attribute
of the \verb|NAF| element of the document.

The aim is, to install the pipeline from open-source modules that can
e.g. be obtained from Github. However, that aim is only partially
fulfilled. Some of the modules still contain elements that are not
open-source ot data that are not freely available. Because of lack of
time, the current version of the installer installs the English
pipeline from a frozen repository of the Newsreader Project.


\subsection{List of the modules to be installed}
\label{sec:moduleslist}
@% Table~\ref{tab:installed_modules}%
@% \begin{table}[hbtp]
@%   \centering
@%   \begin{small}
@%     \begin{tabular}{llll}
@%       \textbf{Module}    &  \textbf{NL}         &  \textbf{EN} &  \textbf{EN component} \\    
@%       Tokenizer        & m4_tokenizertex  & m4_tokenizertex    &                           \\
@%       Topic detection  &                  & m4_topictooltex    & \verb|m4_topictooldir|    \\
@%       \POS{}/\MOR{}    & m4_morphpartex   & m4_postex          & \verb|m4_posdir|          \\
@%       Constit. parser  &                  & m4_conspartex      & \verb|m4_conspardir|      \\
@%       \NERC{}          & m4_nerctex       & m4_nerctex         &                           \\
@%       \UKB{}           &                  & m4_ukbtex          & \verb|m4_ukbdir|          \\
@%       \WSD{}           & m4_wsdtex        & m4_ewsdtex         & \verb|m4_ewsddir|         \\
@%       \NED{}           & m4_nedtex        & m4_nedname         &                           \\
@%       Heideltime       & m4_heideltex     &                    &                           \\
@%       FBK-time         &                  & m4_fbktimetex      & \verb|m4_fbktimedir|      \\
@%       FBK-temprel      &                  & m4_fbktempreltex   & \verb|m4_fbktempreldir|   \\
@%       FBK-causalrel    &                  & m4_fbkcausalreltex & \verb|m4_fbkcausalreldir| \\
@%       Onto-tagger      & m4_ontotex       &                    &                           \\
@%       \textsc{srl}     & m4_nl_srltex     & m4_en_srltex       & \verb|m4_en_srldir|       \\
@%       Nominal event det. & m4_nomeventtex &                    &                           \\
@%       \NED{}-reranker  &                  & m4_nedrertex       & \verb|m4_nedrerdir|       \\
@%       Wikify           &                  & m4_wikifyname      & \verb|m4_wikifydir|       \\
@%       factuality       &                  &                    & \verb|m4_factualitydir|   \\
@% @%      Corefgraph       &                  &                    & \verb|m4_corefdir|        \\
@%       Opinion-miner    & m4_opinitex      & m4_opinitex        & \\
@%       Eventcoref       & m4_evcoreftex    & m4_evcoreftex      & \\
@%     \end{tabular}
@%   \end{small}
@%   \caption{List of modules to be installed.
@%            \textbf{Module}: functional name of the module;
@%            \textbf{NL}:     modules used in Dutch pipeline; 
@%            \textbf{EN}: modules used in English pipeline;
@%            \textbf{EN components} Name of the module in the \textsc{ehu} repository.}
@%   \label{tab:installed_modules}
@% \end{table}
@% lists the modules that are installed. Some of the modules are used for
@% both languages (Dutch and English), some for only one of them.




@% \subsection{Notes}
@% \label{sec:notes}
@% 
@% \begin{itemize}
@% \item The Onto-tagger is a Java program in a jar named
@%   \verb|ontotagger-1.0-jar-with-dependencies.jar|. It uses a
@%   predicate-matrix named \verb|PredicateMatrix.v1.3.txt.role.odwn|
@%   that can be found in the \verb|resources| subdirectory of module
@%   \verb|vua-ontotagger-v1.0| that can be obtained from the snapshot.
@% \item The Nominal Event Detector is also a Java program in the jar
@%   named  \verb|ontotagger-1.0-jar-with-dependencies.jar|. It uses a
@%   resource named \verb|nl-luIndex.xml| that is located in the
@%   \verb|resources| subdirectory of the module
@%   \verb|vua-nominal-event-detection-nl| that can be obtained from the
@%   snapshot. The Nominal Event Detector uses results from the Onto-tagger.
@% \item The SRL postprocessor is a Python script in module
@%   \verb|vua-srl-postprocess| that can be cloned from Github. It uses
@%   results from the nominal event detector.
@% \item Event coref Detector is a Java program inside Jar
@%   \verb|EventCoreference-1.0-SNAPSHOT-jar-with-dependencies.jar| that
@%   can be found in module \verb|vua-eventcoreference_v2| from the
@%   snapshot. 
@% \item The Onto-tagger for Framenet-SRL is a program in the jar named
@%   \verb|ontotagger-1.0-jar-with-dependencies.jar|. It uses results
@%   from the SRL postprocessor and the event coref detector.
@% \item 
@% \end{itemize}


\newcommand{\dref}[1]{\hyperref[#1]{\ref{#1}}}

Table~\ref{tab:modulelist}
\begin{table}[hbtp]
  \centering
  \begin{footnotesize}
    \begin{tabular}{lllllll}
     \textbf{Module}              & \textbf{Source}        & \textbf{Section}                     & \textbf{Commit}         & \textbf{Script}              & \textbf{language} \\
        Tokenizer                 & \url{m4_tokenizergit}  & \dref{sec:installtokenizer}          & m4_tokenizer_commitname & \texttt{m4_tokenizerscript}  & en/nl  \\
        Topic detection           & snapshot               & \dref{sec:topic-install}             &  \ldots                 & \verb|m4_topicscript|        & en     \\
        Morpho-syntactic parser   & \url{m4_morphpargit}   & \dref{sec:install-morphsynt-parser}  & m4_morphpar_commitname  & \verb|m4_morphparscript|     & nl     \\
        \textsc{pos}-tagger       & snapshot               & \dref{sec:postagger}                 &  \ldots                 & \verb|m4_postagscript|       & en     \\
        Named-entity rec/class    & \url{m4_nercgit}       & \dref{sec:nerc}                      & m4_nerc_commitname      & \verb|m4_nercscript|         & en/nl  \\
        Constituent parser        & snapshot               & \dref{sec:constparser}               &  \ldots                 & \verb|m4_consparscript|      & en     \\
        Word-sense disamb. nl     & \url{m4_wsdgit}        & \dref{sec:wsd}                       & m4_wsd_commitname       & \verb|wsd|                   & nl     \\
        Word-sense disamb. en     & snapshot               & \dref{sec:IMS-WSD}                   &  \ldots                 & \verb|ewsd|                  & en     \\
        Named entity/DBP          & snapshot               & \dref{sec:ned-module}                &  \ldots                 & \verb|ned|                   & en/nl  \\
        NED reranker              & snapshot               & \dref{sec:nedrer}                    &  \ldots                 & \verb|nedrerscript|          & en     \\
        Wikify                    & snapshot               & \dref{sec:wikify}                    &  \ldots                 & \verb|m4_wikify|             & en     \\
        \UKB{}                    & snapshot               & \dref{sec:ukb}                       &  \ldots                 & \verb|m4_ukbscript|          & en     \\
        Coreference-base          & snapshot               & \dref{sec:nomcorefgraph}             &  \ldots                 & \verb|m4_corefbasescript|    & en     \\
        Heideltime                & \url{m4_heidelgit}     & \dref{sec:heideltime}                & m4_heidel_commitname    & \verb|m4_heidelscript|       & nl     \\
        Onto-tagger               & \url{m4_ontogit}       & \dref{sec:onto}                      & m4_ontocommitname      & \verb|m4_ontoscript|         & nl     \\
        Semantic Role labeling nl & \url{m4_srlgit}        & \dref{sec:SRL-module}                & m4_srl_commitname       & \verb|m4_srlcript|           & nl     \\
        Semantic Role labeling en & snapshot               & \dref{sec:srlserver}                 &  \ldots                 & \verb|m4_esrlcript|          & en     \\
        Nominal Event ann.        & \url{m4_ontogit}       & \dref{sec:onto}                      & m4_ontocommitname      & \verb|m4_nomeventscript|     & nl     \\
        SRL dutch nominals        & \url{m4_srl_dn_git}    & \dref{sec:srl-dn}                    & m4_srl_dn_commitname    & \verb|m4_srl_dn_script|      & nl     \\
        Framenet-SRL              & \url{m4_ontogit}       & \dref{sec:onto}                      & m4_ontocommitname      & \verb|m4_framesrlscript|     & nl     \\
        FBK-time                  & snapshot               & \dref{sec:fbktime}                   & \ldots                  & \verb|m4_fbktimescript|      & en     \\
        FBK-temprel               & snapshot               & \dref{sec:FBK-temprel}               & \ldots                  & \verb|m4_fbktimerelscript|   & en     \\
        FBK-causalrel             & snapshot               & \dref{sec:FBK-causalrel}             & \ldots                  & \verb|m4_fbkcausalrelscript| & en     \\
        Opinion-miner             & \url{m4_opinigit}      & \dref{sec:opinimin}                  & m4_opini_commitname     & \verb|m4_opiniscript|        & en/nl  \\
        Event-coref               & snapshot               & \dref{sec:event-coref-module}        & \ldots                  & \verb|m4_evcorefscript|      & en/nl  \\
        Factuality tagger         & snapshot               & \dref{sec:factuality}                & \ldots                  & \verb|m4_factualityscript|   & en     \\
    \end{tabular}
  \end{footnotesize}
   \caption{List of the modules to be installed. Column description:
     \textbf{directory:} Name of the subdirectory below subdirectory \texttt{modules} in
     which it is installed; \textbf{source:} From where the module has
     been obtained; \textbf{commit:} Commit-name or version-tag \textbf{script:} Script to be included in a pipeline. \textbf{Note:} The tokenizer module has been temporarily obtained from the snapshot, because the commit that we used has disappeared from the Github repository.}
   \label{tab:modulelist}
\end{table}
@% \begin{table}[hbtp]
@%   \centering
@%   \begin{footnotesize}
@%     \begin{tabular}{llllll}
@%      \textbf{Module}   & \textbf{Section}     & \textbf{Source} &  \textbf{Commit} & \textbf{Script} \\
@%        \href{m4_tokenizergit}{Tokenizer}          
@%                        & \dref{sec:installtokenizer}         & \href{m4_tokenizergit}{Github} & m4_tokenizer_commitname & \texttt{m4_tokenizerscript}  \\
@% @%       \href{m4_tokenizergit}{Tokenizer}          
@% @%                       & \dref{sec:installtokenizer}           &  snapshot          & m4_tokenizer_commitname & \texttt{m4_tokenizerscript}  \\
@%        \href{m4_morphpargit}{morphosyntactic parser} 
@%                        & \dref{sec:install-morphsynt-parser} & \href{m4_morphpargit}{Github}  & m4_morphpar_commitname  & \verb|m4_morphparscript|     \\
@%        \href{m4_nercgit}{\textsc{nerc}} 
@%                        & \dref{sec:nerc}                     & \href{m4_nercgit}{Gith.}/snap      & m4_nerc_commitname   & m4_nercscript      \\
@%        \href{m4_wsdgit}{\textsc{wsd}}
@%                        & \dref{sec:wsd}                       & \href{m4_wsdgit}{Gith.}/snap      & m4_wsd_commitname   & m4_wsdscript       \\
@%        \hyperref[sec:onto]{Onto-tagger}
@%                        & \dref{sec:onto}                                     & snapshot       &                      & m4_ontoscript      \\
@%        \href{m4_heidelgit}{Heideltime}
@%                        & \dref{sec:heideltime}              & \href{m4_heidelgit}{Gith.}/snap.     & m4_heidel_commitname  & m4_heidelscript   \\
@%        \href{m4_srlgit}{\textsc{srl}}
@%                        & \dref{sec:SRL}                        & \href{m4_srlgit}{Github}     & m4_srl_commitname   & m4_srlscript       \\
@%        \href{m4_srlgit}{\textsc{srl-post}}
@%                        & \dref{sec:srlpost}                                  & snapshot        &                    & m4_postsrlscript       \\
@%        \href{m4_nedgit}{\textsc{ned}}
@%                        & \dref{sec:ned}                        & \href{m4_nedgit}{Github}     & m4_ned_commitname   & m4_nedscript       \\
@%        \href{m4_corefbasegit}{Nom. coref}
@%                        & \dref{sec:nomcorefgraph}       & \href{m4_corefbasegit}{Github}      & m4_corefbase_commitname   & m4_ncorefscript   \\  
@%        \href{m4_evcorefscript}{Ev. coref}
@%                        & \dref{sec:eventcoref}                                & snapshot      &                           &  m4_evcorefscript  \\  
@%        \hyperref[sec:vua-pylib]{Opinion miner}
@%                        & \dref{sec:opinimin}   & \href{m4_opinigit}{Github} &           &  m4_opiniscript   & \\  
@%        \hyperref[sec:framesrl]{Framenet SRL} 
@%                        & \dref{sec:framesrl}                                  & snapshot      &                            &  m4_fsrlscript   \\  
@%        \hyperref[sec:dbpedia-ner]{Dbpedia\_ner} 
@%                        & \dref{sec:dbpedia-ner}                                  &  \href{m4_dbpnergit}{Github}       &  m4_dbpner_commitname                          &  m4_dbpnerscript   \\  
@% @%     \hyperref[sec:install-alpino]{Alpino             & \verb|m4_alpinodir|    & \textsc{rug} & m4_Alpinoscript  & \\
@% @%     \hyperref[]{Ticcutils          & \verb|m4_ticcdir|      & \textsc{ilk} & & \\
@% @%     \hyperref[]{Timbl              & \verb|m4_timbldir|     & \textsc{ilk} & & \\
@% @%     \hyperref[]{Treetagger         &                        &              & & \\
@%     \end{tabular}
@%   \end{footnotesize}
@%   \caption{List of the modules to be installed. Column description:
@%     \textbf{directory:} Name of the subdirectory below subdirectory \texttt{modules} in
@%     which it is installed; \textbf{source:} From where the module has
@%     been obtained; \textbf{commit:} Commit-name or version-tag \textbf{script:} Script to be included in a pipeline. \textbf{Note:} The tokenizer module has been temporarily obtained from the snapshot, because the commit that we used has disappeared from the Github repository.}
@%   \label{tab:modulelist}
@% \end{table}
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

\subsection{The things that are not open-source yet}
\label{sec:non-open}

The aim is, that the pipeline-system is completely open-sourced, so
that anybody can install it from sources like Github. Howver, a lot of
elements are not yet open-sourced, but need private kludges. The
following is a list of not-yet open things.


\subsection{Multi-linguality}
\label{sec:multiling}

Thi version of the pipeline is multi-lingual, i.e. it can annotate
Dtutsch as well as English documents. It finds the language of the
document in the \verb|language| attribute of the \verb|NAF|
element. Actually, the current version is bi-lingual, because it is
only able to process Dutch or English documents.


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
export progenvset=0
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

The sources for the non-open parts of the pipeline are collected in
directory \verb|m4_snapshotdirectory|. They can be accessed via
\textsc{ssh} from url \verb|m4_snapshotURL|. Before
installing the pipeline download the snapshot on top of directory
\verb|snapshotsocket|.

@d set variables that point to the directory-structure @{@%
if 
  [ ! $snapshotsocket ]
then
  export snapshotsocket=m4_snapshotsocket
fi
@| @}


The snapshot can be accessed over \texttt{scp} on \textsc{url}
\url{m4_repo_user@@m4_repo_url}. Access is protected by a
public/private key system. So, a private key is needed and this
program expects to to find the key as \verb|\$pipesocket/nrkey|. The
key can be obtained from the author. Let us check whether we indeed do
have the key: 

@d check this first @{@%
if
  [ ! -e m4_snapshotkeyfile ]
@%   [ ! -e \$pipesocket/m4_snapshotkeyfilename ]
then
  echo "No key to connect to snapshot!"
  exit 1
fi
@| @}

Update the local snapshot repository.

@d get the snapshot @{@%
cd $snapshotsocket
@% rsync -e "ssh -i \$HOME/m4_snapshotkeyfilename" -rLt m4_snapshotrootURL:m4_snapshotdirectory .
rsync -e "ssh -i m4_snapshotkeyfile" -rLt m4_snapshotrootURL:m4_snapshotdirectory .
@| @}




@% Use the following macro to download a resource if it is not already present
@% in the ``socket'' directory. It turns out that sometimes there is a
@% time-out for unknown reasons. In that case we will try it multiple times.
@% 
@% @d get or have @{@%
@% counter=0
@% while
@%   [ ! -e \$pipesocket/@1 ]
@% do
@% @%   @< have an SSH key or die @>
@%   cd \$pipesocket
@%   scp -i "m4_snapshotkeyfile" m4_repo_user<!!>@@<!!>m4_repo_url:m4_repo_path/@1 .
@%   if
@%     [ $? -gt 0 ]
@%   then
@%     counter=$((counter+1))
@%     if
@%       [ $counter -gt 3 ]
@%     then
@%        echo "Cannot contact snapshot server"
@%        exit 1
@%     fi
@%   fi
@% done
@% 
@% @| @}


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


@% \subsection{Installation from the Newsreader repository}
@% \label{sec:newsreaderinstall}
@% 
@% Copy the newsreader-repo in the snapshotsocket
@% 
@% @d get the newsreader-repo @{@%
@% cd $snapshotsocket
@% rsync -e "ssh -i $HOME/nrkey -p m4_enrepo_port" -zrLt m4_enrepo_user@@m4_enrepo_url:m4_enrepo_dir .
@% @| @}

\section{Shared libraries}
\label{sec:sharedlibs}

When we do not want to rely on what the host can present to us, we need to make our own shared libraries. For the present, we will
generate the shared libraries \verb|libxslt| and \verb|libxml2|. We do the following:

\begin{enumerate}
\item install autoconf, needed to compile the libs.
\item install libxslt
\item install libxml2
\end{enumerate}


\subsection{Autoconf}
\label{sec:autoconf}

Gnu autoconf is a system to help configure the Makefiles for a software package. Softwarepackages that use this,
supply a file \verb|configure|, \verb|configure.in| or \verb|configure.ac|. To compile and install a package from source we
can then perform 1) \verb|./configure --prefix=<environment>|; 2) \verb|make|; 3) \verb|make install|.

Install autoconf:


@d install shared libs @{
autoconfdir=`mktemp -d -t autoconf.XXXXXX`
cd $autoconfdir
wget m4_autoconf_url
tar -xzf m4_autoconf_ball
cd autoconf-<!!>m4_autoconf_version
./autogen.sh --prefix=$envdir
make
make install
cd $piperoot
rm -rf $autoconfdir
@| @}

\subsection{libxml2 and libxslt}
\label{sec:libxml2}

Compilation and installation of \verb|libxml2| and \verb|libxslt| goes similar, according to the following template:

@d install libxml2 or libxslt @{
shtmpdir=`mktemp -d -t shl.XXXXXX`
cd $shtmpdir
git clone @1
packagedir=`ls -1`
cd $packagedir
@% autoreconf --install
@% ./configure --prefix=$envdir
./autogen.sh --prefix=$envdir
make
make install
cd $piperoot
rm -rf $shtmpdir

@| @}


@d install shared libs @{
@< install libxml2 or libxslt @(m4_libxml2git@)@>
@< install libxml2 or libxslt @(m4_lxsltgit@)@>
@| @}



\section{Java, Python en Perl}
\label{sec:environment}

To be independent from the software environment of the host computer
and to perform reproducible processing, the pipeline features its own
Java, Perl and Python environments. The costs of this feature are that the
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
@< begin conditional install @(java_installed@) @>
  cd \$envdir/java
  tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_javatarball
@< end conditional install @(java_installed@) @>
@| @}

Remove the java-ball when cleaning up:

@d clean up @{@%
rm -rf \$pipesocket/m4_javatarball
@| @}

Set variables for Java.

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

@d set variables that point to the directory-structure @{@%
export MAVEN_HOME=\$envdir/m4_mavensubdir
export PATH=${MAVEN_HOME}/bin:${PATH}
@| @}

When the installation has been done, remove maven, because it is no longer needed.

@d clean up @{@%
rm -rf m4_mavendir
@< remove installed-variable @(maven_installed@) @>
@| @}


\subsection{Java 1.6}
\label{sec:Java-1.6}

Java 1.7 is able to run nearly all the modules of the pipeline that
are based on Java. However, there is one exception, i.e. the
\verb|ims-wsd| module, that needs Java version 1.6. So, we have to
install that version of Java as well. 

@d install Java 1.6 @{@%
cd \$envdir/java
\$snapshotsocket/m4_snapshotdirectory/m4_java16ball
@| @}

Insert the following macro in scripts that need to run Java 1.6.

@d set up Java 1.6 @{@%
export JAVA_HOME=\$envdir/java/m4_java16name
export PATH=$JAVA_HOME/bin:$PATH
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
@< update pip @>
@< install python packages @>
@< install kafnafparserpy @>
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
pytinsdir=`mktemp -d -t activepyt.XXXXXX`
cd $pytinsdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_activepythonball
acdir=`ls -1`
cd $acdir
@%./install.sh -I m4_ausrlocaldir
./install.sh -I \$envdir
cd \$piperoot
rm -rf \$pytinsdir
pip install -U virtualenv setuptools
@| @}

@% \subsubsection{Transplant ActivePython}
@% \label{sec:transplantactivepython}
@% 
@% Activepython produces scripts in \verb|env/bin| that contain
@% ``shabangs'' with absolute path. Furthermore, activePython seems to
@% have an implicit pythonpath with an absolute path. So, when
@% transplanting the directorytree to another location we have to solve
@% these two problems.
@% 
@% While doing this, we also modify the scripts in the Python Virtenv
@% binary directory (see~\ref{sec:pythonvirtenv}).
@% 
@% Modify the scripts as follows:
@% 
@% \begin{enumerate}
@% \item Create a temporary directory.
@% \item Generate an \AWK{} script that replaces the shabang line with a
@%   correct one.
@% \item Generate a script that moves a script from \verb|env/bin| to the
@%   temporary directory and then applies the \AWK{} script.
@% \item Apply the generated script on the scripts in \verb|env/bin|.
@% \end{enumerate}
@% 
@% @d set paths after transplantation @{@%
@% transdir=`mktemp -d -t trans.XXXXXX`
@% cd $transdir
@% @< write script tran @>
@% @< write script chasbang.awk @>
@% @< apply script tran on the scripts in @($envbindir@) @>
@% @< apply script tran on the scripts in @($envdir/venv/bin@) @>
@% @% find $envbindir -type f -exec file {} + | grep script | gawk '{print $1}' FS=':' | xargs -iaap ./tran aap
@% cd $projroot
@% rm -rf $transdir
@% @| @}
@% 
@% @d write script tran @{@%
@% cat <<EOF >tran
@% workfil=\$1
@% mv \$workfil ./wor
@% gawk -f chasbang.awk ./wor >$workfil 
@% EOF
@% chmod 775 ./tran
@% @| @}
@% 
@% @d write script chasbang.awk @{@%
@% cat <<EOF >chasbang.awk
@% #!/usr/bin/gawk -f
@% BEGIN { shabang="#!$envbindir/python"}
@% 
@% /^\#\!.*python.*/ { print shabang
@%                     next
@%                    }
@% {print}
@% EOF
@% @| @}
@% 
@% The following looks complicated. The \texttt{find} command applies the
@% \texttt{file} command on the files in the \verb|env/bin|
@% directory. The grep command filters out the names of the files that
@% are scripts. it produces a filename, followed by a colon, followed by
@% a description of the type of the file. The \texttt{gawk} command
@% prints the filenames only and the \texttt{xargs} command applies the
@% \verb|tran| script on the file.  
@% 
@% @d apply script tran on the scripts in  @{@%
@% find @1 -type f -exec file {} + | grep script | gawk '{print $1}' FS=':' | xargs -iaap ./tran aap
@% @| @}
@% 
@% 
@% Add \texttt{env/lib/python2.7} to the \texttt{PYTHONPATH} variable.
@% 
@% @d set paths after transplantation @{@%
@% echo export PYTHONPATH=\\$envdir/lib/python2.7:\\$PYTHONPATH >> $envbindir/javapython
@% export PYTHONPATH=\\$envdir/lib/python2.7:\\$PYTHONPATH 
@% @| @}



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


Activate the virtual environment immediately in the installation-script, and add the activation-instruction
to the initialisation-script.

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

We will use home-brewed shared libraries in Python, e.g.{} libxml2 and libxslt:

@d activate the python environment @{@%
echo export 'LD_LIBRARY_PATH=\$envlibdir:\$LD_LIBRARY_PATH' >> m4_aenvbindir/javapython
export LD_LIBRARY_PATH=\$envdir/python:\$LD_LIBRARY_PATH
@|LD_LIBRARY_PATH @}


Update pip in the virtual environment, because otherwise it keeps
complaining about outdated versions

@d update pip @{@%
pip install --upgrade pip
@| @}


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
\href{https://github.com/cltl/KafNafParserPy}{KafNafParserPy}. Currently
it is extremely easy installed:
@% It is a
@% feature of this module that you cannot install it with \textsc{pip}, but that
@% you can add it to your \texttt{PYTHONPATH}.


@d install kafnafparserpy @{@%
pip install KafNafParserPy
@| @}

@% @d install kafnafparserpy @{@%
@% @% cd m4_pythonmoddir
@% cd \$envdir/python
@% DIRN=KafNafParserPy
@% @< move module @($DIRN@) @>
@% git clone m4_kafnafgit
@% if
@%   [ $? -gt 0 ]
@% then
@%   @< logmess @(Cannot install current $DIRN version@) @>
@%   @< re-instate old module @(\$DIRN@) @>
@% else
@%   @< remove old module @(\$DIRN@) @>
@% fi
@% @| @}


\subsubsection{Python packages}
\label{sec:pypacks}

Install python packages:

\begin{description}
\item[lxml:]
\item[pyyaml:] for coreference-graph
\item[pynaf:]
\item[requests:] for networkx
\item[networkx:] for corefbase. 
\end{description}


@d install python packages @{@%
pip install lxml
pip install pyyaml
pip install --upgrade m4_pynaf_gitpip_url
pip install --upgrade requests
pip install --upgrade networkx
@| lxml pyyaml networkx@}


\subsection{Perl}
\label{sec:perl}

Install Perl locally, to be certain that Perl is available and to enable to install
packages that we need (in any case: \verb|XML::LibXML|).

@d install perl @{@%
tempdir=`mktemp -d -t perl.XXXXXX`
cd $tempdir
wget m4_perl_url
tar -xzf m4_perl_ball 
cd m4_perl_ddir
./Configure -des -Dprefix=$envdir/perl
make
make test
make install
cd $progroot
rm -rf $tempdir 

@| @}

Make sure that modules use the correct Perl

@d install perl @{@%
echo 'export PERL_HOME=$envdir/perl' >> m4_aenvbindir/javapython
echo 'export PATH=$PERL_HOME/bin:$PATH' >> m4_aenvbindir/javapython
export PERL_HOME=$envdir/perl
export PATH=$PERL_HOME/bin:$PATH
@| @}

Install what is called \verb|XML::XMLLib| in the Perl world.

@d install perl @{@%
perl -MCPAN -e 'install XML::LibXML'
@| @}


\section{Installation of the modules}
\label{sec:install}

This section describes how the modules are obtained from their
(open-)source and installed. 

\subsection{Conditional installation of the modules}
\label{sec:conditional-install}

Next section generates a script that installs everything. 

Installation is very time-intensive. To prevent that everything is
re-installed every time that the module-installer is run, there is a
list of variables, the \emph{modulelist}, that are set when a module has been installed. To
re-install that module, remove the variable from the list and then
re-run the installer. It maintains a list of the modules and
utilitie that is has installed and installs only modules and utilities
that are not on the list. So in order to re-install a module that has
already been installed, remove it from the list and then re-run the
module-installer.

The modulelist is in fact a script named \verb|m4_modulelist| that
sets Bash variables. It ought to be sourced if it is present. 

Initially the list is not present. When a module or a utility has been
installed, an instruction to set a variable is written in or appended
to the list.

@d read the list of installed modules @{@%
if
  [ -e m4_modulelist ]
then
  source m4_modulelist
fi
@| @}


@d begin conditional install @{@%
if
  [ ! \$@1 ]
then
@| @}

@d else conditional install @{@%
else
@| @}


@d end conditional install @{@%
  echo "export @1=0" >> m4_modulelist
fi
@| @}

Remove a variable from the list of installed modules, e.g. after a
clean-up.

@d remove installed-variable @{@%
cd \$piperoot
mv m4_modulelist old.modulelist
cat old.modulelist | gawk '/@1/ {next}; {print}' >m4_modulelist
@| @}


\subsection{The installation script}
\label{sec:installscript}

The installation is performed by script
\verb|m4_module_installer|. 


The first part of the script installs the utilities:


@o m4_bindir/m4_module_installer @{@%
#!/bin/bash
echo Set up environment
@% @< create progenv script @>
@< set variables that point to the directory-structure @>
@< read the list of installed modules @>
@< check this first @>
@< begin conditional install @(repo_installed@) @>
  @< get the snapshot @>
@%   @< get the newsreader-repo @>
@< end conditional install @(repo_installed@) @>
@< variables of m4_module_installer @>
@%@< unpack snapshots or die @>
@< begin conditional install @(shared_libs@) @>
  @< install shared libs @>
@< end conditional install @(shared_libs@) @>
@< create javapython script @>
echo ... Java
@< set up java @>
@< begin conditional install @(maven_installed@) @>
  @< install maven @>
@< end conditional install @(maven_installed@) @>
@< begin conditional install @(java16_installed@) @>
  @< install Java 1.6 @>
@< end conditional install @(java16_installed@) @>

echo ... Python
if
  [ \$python_installed ]
then
  @< activate the python environment @>
fi
@< begin conditional install @(python_installed@) @>
  @< set up python @>
@< end conditional install @(python_installed@) @>
@< begin conditional install @(perl_installed@) @>
  @< install perl @>
@< end conditional install @(perl__installed@) @>

@< begin conditional install @(sematree_installed@) @>
  @< install sematree @>
@< end conditional install @(sematree_installed@) @>
echo ... Alpino
@< begin conditional install @(alpino_installed@) @>
  @< install Alpino @>
@< end conditional install @(alpino_installed@) @>
echo ... Spotlight
@< begin conditional install @(spotlight_installed@) @>
  @< install the Spotlight server @>
@< end conditional install @(spotlight_installed@) @>
echo ... Treetagger
@< begin conditional install @(treetagger_installed@) @>
  @< install the treetagger utility @>
@< end conditional install @(treetagger_installed@) @>
echo ... Ticcutils and Timbl
@< begin conditional install @(ticctimbl_installed@) @>
  @< install the ticcutils utility @>
  @< install the timbl utility @>
@< end conditional install @(ticctimbl_installed@) @>
echo ... Boost
@< begin conditional install @(boost_installed@) @>
  @< install boost @>
@< end conditional install @(boost_installed@) @>

echo ... VUA-pylib, SVMlight, CRFsuite
@< begin conditional install @(miscutils_installed@) @>
  @< install VUA-pylib @>
  @< install SVMLight @>
  @< install CRFsuite @>
@< end conditional install @(miscutils_installed@) @>

@| @}

Next, install the modules:


@o m4_bindir/m4_module_installer @{@%
echo Install modules
@< begin conditional install @(tokenizer_installed@) @>
  echo ... Tokenizer
  @< install the tokenizer @>
@< end conditional install @(tokenizer_installed@) @>
@< begin conditional install @(topic_installed@) @>
  echo ... Topic detector
  @< install the topic analyser @>
@< end conditional install @(topic_installed@) @>
@< begin conditional install @(morpar_installed@) @>
  echo ... Morphosyntactic parser
  @< install the morphosyntactic parser @>
@< end conditional install @(morpar_installed@) @>
@< begin conditional install @(pos_installed@) @>
  echo "... Pos tagger (for english docs)"
  @< install the pos tagger @>
@< end conditional install @(pos_installed@) @>
@| @}

@o m4_bindir/m4_module_installer @{@%
@< begin conditional install @(constparse_installed@) @>
  echo "... Constituent parser (for english docs)"
  @< install the constituents parser @>
@< end conditional install @(constparse_installed@) @>
@< begin conditional install @(nerc_installed@) @>
  echo ... NERC
  @< install the NERC module @>
@< end conditional install @(nerc_installed@) @>
@< begin conditional install @(ned_installed@) @>
  echo ... NED
  @< install the \NED{} module @>
@< end conditional install @(ned_installed@) @>
@< begin conditional install @(nedrer_installed@) @>
  echo ...NED reranker
  @< install the \NED-reranker module @>
@< end conditional install @(nedrer_installed@) @>
@< begin conditional install @(wikify_installed@) @>
  echo ...WIKIfy module
  @< install the wikify module @>
@< end conditional install @(wikify_installed@) @>
@| @}
@o m4_bindir/m4_module_installer @{@%
@< begin conditional install @(UKB_installed@) @>
  echo ... UKB module
 cd \$modulesdir
 tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_ukbball
@%  @< install the UKB module @>
@< end conditional install @(UKB_installed@) @>
@< begin conditional install @(ims_wsd_installed@) @>
  echo ...ims-wsd module
  @< install the ims-wsd module @>
@< end conditional install @(ims_wsd_installed@) @>
@< begin conditional install @(srl_server_installed@) @>
  echo ...srl-server module
  @< install the srl-server module @>
@< end conditional install @(srl_server_installed@) @>
@< begin conditional install @(srl_dutch_nominals_installed@) @>
  echo ...srl-dutch-nominal module
  @< install the srl-dutch-nominals module @>
@< end conditional install @(srl_dutch_nominals_installed@) @>
@| @}

@o m4_bindir/m4_module_installer @{@%
@< begin conditional install @(FBK_time_installed@) @>
  echo ... FBK-time module
  @< install the FBK-time module @>
@< end conditional install @(FBK_time_installed@) @>
@< begin conditional install @(FBK_temprel_installed@) @>
  echo ... FBK-temprel module
  @< install the FBK-temprel module @>
@< end conditional install @(FBK_temprel_installed@) @>
@< begin conditional install @(FBK_causalrel_installed@) @>
  echo ... FBK-causalrel module
  @< install the FBK-causalrel module @>
@< end conditional install @(FBK_causalrel_installed@) @>
@< begin conditional install @(factuality_installed@) @>
  echo ... factuality module
  @< install the factuality module @>
@< end conditional install @(factuality_installed@) @>
@| @}
@o m4_bindir/m4_module_installer @{@%
@< begin conditional install @(corefb_installed@) @>
  echo ... Coreference base
  @< install coreference-base @>
@< end conditional install @(corefb_installed@) @>
@< begin conditional install @(wsd_installed@) @>
  echo ... WSD
  @< install the WSD module @>
@< end conditional install @(wsd_installed@) @>
@< begin conditional install @(ontojar_installed@) @>
  echo ... Ontotagger
  @< install the ontotagger repository @>
@< end conditional install @(ontojar_installed@) @>
@| @}
@o m4_bindir/m4_module_installer @{@%
@< begin conditional install @(heidel_installed@) @>
  echo ... Heideltime
  @< install the heideltime module @>
@% @< install the new heideltime module @>
@< end conditional install @(heidel_installed@) @>
@< begin conditional install @(SRL_installed@) @>
   echo ... SRL
   @< install the srl module @>
@< end conditional install @(SRL_installed@) @>
@< begin conditional install @(eventcoref_installed@) @>
   echo ... Event-coreference
   @< install the event-coreference module @>
@< end conditional install @(eventcoref_installed@) @>
@< begin conditional install @(lu2synset_installed@) @>
   echo ... lu2synset
   @< install the lu2synset converter @>
@< end conditional install @(lu2synset_installed@) @>
@| @}
@o m4_bindir/m4_module_installer @{@%
@< begin conditional install @(dbpner_installed@) @>
  echo ... dbpedia-ner
  @< install the dbpedia-ner module @>
@< end conditional install @(dbpner_installed@) @>
@% @< begin conditional install @(nomevent_installed@) @>
@%    echo ... nominal event
@%    @< install the nomevent module @>
@% @< end conditional install @(nomevent_installed@) @>
@< begin conditional install @(post_SRL_installed@) @>
   echo ... post-SRL
   @< install the post-SRL module @>
@< end conditional install @(post_SRL_installed@) @>
@| @}
@o m4_bindir/m4_module_installer @{@%
@< begin conditional install @(opimin_installed@) @>
   echo ... opinion-miner
   @< install the opinion-miner @>
@< end conditional install @(opimin_installed@) @>

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
@< check whether program is present @(git@) @>
@< check whether program is present @(tar@) @>
@< check whether program is present @(unzip@) @>
@< check whether program is present @(tcsh@) @>
@< check whether mercurial is present @>
@| @}

@d check whether program is present @{@%
which @1
if
  [ $? -ne 0 ]
then
  echo Please install @1.
  exit 1
fi
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

\subsection{Parameters in module-scripts}
\label{sec:modulescriptparameters}

Some modules need parameters. All modules need a language
specification. The language can be passed as exported variable
\verb|naflang|, but it can also be passed as argument
\verb|-l|. Furthermore, some modules need contact with a Spotlight
server. With the arguments \verb|-h| and \verb|-b| the host and port
of a running Spotlight-server can be passed.

The code to obtain command-line arguments in Bash has been obtained
from
\href{http://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash}{Stackoverflow}. The
following fragment reads the arguments \verb|-l language|, 
\verb|-h spotlighthost| and \verb|-p spotlightport|:



@d get commandline-arguments @{@%
while [[ $# > 1 ]]
do
  key="$1"

  case $key in
    -l|--language)
      naflang="$2"
      shift # past argument
    ;;
    -h|--spothost)
      spotlighthost="$2"
      shift # past argument
    ;;
    -p|--spotport)
    spotlightport="$2"
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
  esac
  shift # past argument or value
done
@| @}

@% Nearly every modulescript needs to know the language. It would be
@% possible to extract the language from the \XML{} code, but that is
@% complicated and time-consuming. Therefore, if the language is not
@% present as exported variable or as argument, abort execution.
@% 
@% @d get commandline-arguments @{@%
@% @< abort when the language is not English or Dutch @>
@% @| @}




\subsection{Install utilities and resources}
\label{sec:utilitiesandresources}

\subsubsection{Process synchronisation}
\label{sec:syncronisation}

We will see that we sometimes have to install
server-applications. However, it is possible that multiple processes
are running pipeline modules in parallel, and then it may occur that
two instances of a module try to install the same
server-application. Therefore, we must make sure that only one
application at a time is able to start the server.

The program \verb|sematree|, found at \url{m4_sematree_website}
enables to do this. When invoked with argument ``acquire'', the name
of a ``lockfile''  and a time
to wait (-1 means ``wait an indefinite time''), it checks whether the
lockfile exists. If that is the case, it either waits or
fails. When the lockfile is not (or no longer) present, sematree
creates the lockfile.

When installing Sematree, set the default directory for lock-files. We
set this as a subdirectory of the \verb|env| tree. However, in some
cases, notably when running in a node in Lisa, we need a directory on
the filesystem of the node itself.

@d install sematree @{@%
cat \$snapshotsocket/m4_snapshotdirectory/m4_sematree_script | \
  sed "s|/var/run|<!!>m4_asematreedir<!!>|g" \
> \$envbindir/sematree
@| @}



\subsubsection{Prefix of scripts that run modules}
\label{sec:runprefix}

Each module will be run by a Bash script located in subdirectory
\verb|bin|. The start of these scrips will have similar
content. Insert the following macro to include this similar content,
with the name of the module-directory as argument:

@d start of module-script @{@%
#!/bin/bash
@< get the path to the module-script @>
source m4_aenvbindir/progenv
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
ROOT=\$piperoot
MODDIR=\$modulesdir/<!!>@1<!!>
@< run in subshell when naflang is not known @>
@< run only if language is English or Dutch @>
@| @}

Set variable \verb|scriptpath| to the full path of the script that is
running, order to be able to re-run it. 

@d get the path to the module-script @{@%
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
scriptname=${0##*/}
scriptpath=$scriptdir/$scriptname
@|scriptpath @}



\subsubsection{Language detection}
\label{sec:detectlang}

The following script \verb|m4_envbindir/langdetect.py| discerns the language of a
\NAF{} document. If it cannot find that attribute it
prints \verb|unknown|.
The macro \verb|set the language variable| uses this
script to set variable \verb|naflang|. All pipeline modules expect that
this veriable has been set.


@o m4_envbindir/langdetect.py @{@%
#!/usr/bin/env python
# langdetect -- Detect the language of a NAF document.
#
import xml.etree.ElementTree as ET
import sys
import re
xmldoc = sys.stdin.read()
#print xmldoc
root = ET.fromstring(xmldoc)
# print root.attrib['lang']
lang = "unknown"
for k in root.attrib:
   if re.match(".*lang$", k):
     language = root.attrib[k]
print language
@| @}


The module-scripts depend on the existence of variable \verb|naflang|.
In most cases this is not a problem because the scripts run in a
surrounding script that sets \verb|naflang|. However, a users may
occasionally run a module-script stand-alone e.g. to debug. In that case, we can
read the language from the \NAF{}, set variable \verb|naflang|, and
then run the module-script in a subshell. We assume that variable
\verb|scriptpath| contains the path of the script itself. 

The macro does the following if \verb|naflang| has not been set:

\begin{enumerate}
\item Save the content of standard in to a temporary file.
\item Run \verb|langdetect| with the temporary file as input and set
  the \verb|naflang| variable.
\item Run the script \verb|\$scriptpath| (i.e. itself) with the
  temporary file as input.
\item Remove the temporary file.
\item Exit itself with the errorcode of the sub-script that it has run.
\end{enumerate}

@d run in subshell when naflang is not known @{@%
if
  [ "\$naflang" == "" ]
then
  naffile=`mktemp -t naf.XXXXXX`
  cat >$naffile
  naflang=`cat $naffile | python $envbindir/langdetect.py` 
  export naflang
  cat $naffile | $scriptpath
  result=$?
  rm $naffile
  exit $result
fi
@| @}

@d run only if language is English or Dutch @{@%
if
  [ ! "$naflang" == "nl" ] && [ ! "$naflang" == "en" ]
then
  exit m4_err_ill_language
fi
@| @}



@% @o m4_bindir/langdetect @{@%
@% @< start of module-script @(@) @>
@% echo `cat | python $envbindir/langdetect.py`
@% @| @}
@% 
@% @d make scripts executable @{@%
@% chmod 775 m4_abindir/langdetect
@% @| @}



@% Currently, the pipeline understands only English and Dutch. The
@% following macro aborts pipeline processing when the language is not
@% English or Dutch.
@% 
@% @d abort when the language is not English or Dutch @{@%
@% if
@%   [ ! "$naflang" == 'nl' ] && [ ! "$naflang" == "en" ]
@% then
@%   echo Language of NAF document not set. >&2
@%   echo Either set variable "naflang" to "en" of "nl" and try again, >&2
@%   echo or start with argument "-l <lang>" , >&2
@%   echo Aborting ':-(' >&2
@%   exit 4
@% fi
@% @| @}
 


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
if
  [ ! $alpino_installed ]
then
  cd \$modulesdir
  tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_alpinosrc
@%   @< logmess @(Installed Alpino@) @>
  echo "export alpino_installed=0" >> m4_modulelist
fi
@| @}

Currently, alpino is not used as a pipeline-module on its own, but it
is included in other pipeline-modules. Modules that use Alpino should
set the following variables:

@d set alpinohome @{@%
export ALPINO_HOME=\$modulesdir/Alpino
@| ALPINO_HOME @}

Remove the tarball when cleaning up:

@d clean up @{@%
rm -rf \$snapshotsocket/m4_snapshotdirectory/m4_alpinosrc
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
@% @< get or have @(\$TARB@) @>
SUCCES=0
ticbeldir=`mktemp -t -d tickbel.XXXXXX`
cd \$ticbeldir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/\$TARB
cd \$DIR
sh ./bootstrap.sh
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


\subsubsection{The Boost library}
\label{sec:boost}

Theoretically, it is possible to download a tarball with boost from
\href{m4_boost_src_url}{it's repository} and then install it. However,
I did not succeed in doing this. Therefore, I ripped the installed
boost from Surfsara's Hadoop installation and put it in the
\texttt{env} dir. 

@d install boost @{@%
cd \$envdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_ripped_boostball
@| @}


@% The tarball with boost in it could be downloaded from
@% \url{m4_boost_src_url}. However, it seems that this download is not
@% reproducible. One time I received as gzipped tar with the name
@% \texttt{download}, but another time I received the expected
@% file. Therefore, get the boost from the snapshot.
@% 
@% @d install boost @{@%
@% boostmp=`mktemp -d -t boost.XXXXXX`
@% cd \$boostmp
@% @% wget m4_boost_src_url
@% @% tar -xzf ./download
@% tar -xjf \$snapshotsocket/m4_snapshotdirectory/m4_boostsnaptarball
@% cd m4_boostname
@% ./bootstrap.sh
@% cp project-config.jam old.project-config.jam
@% cat old.project-config.jam | sed "s|/usr/local|$envdir|g" >project-config.jam
@% ./b2
@% ./b2 install 
@% cd \$piperoot
@% rm -rf \$boostmp
@% @| @}



\subsubsection{Spotlight}
\label{sec:spotlight}

A Spotlight server occupies a lot of memory and we need two of them,
one for each language. We may be lucky and have a spotlight server
running somewhere. Otherwise we have to install the server ourselves.

@% Install Spotlight as described on the readme of \texttt{ixa-pipe-ned}.

Install Spotlight in the way that  Itziar Aldabe (\url{mailto:itziar.aldabe@@ehu.es}) described:

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


So, let us do that:

@% @d select language-dependent features @{@%
@% if
@%   [ "\$naflang" == "nl" ]
@% then
@%   export spotlightport=m4_spotlight_nl_port
@% else
@%   export spotlightport=m4_spotlight_en_port
@% fi
@% @| @}


@d install the Spotlight server @{@%
cd \$envdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_spotlightball
cd \$envdir/spotlight
@< get spotlight model ball @(m4_spotlight_nl_model_ball@) @>
@< get spotlight model ball @(m4_spotlight_en_model_ball@) @>
@| @}

@d get spotlight model ball @{@%
if
  [ -e \$snapshotsocket/m4_snapshotdirectory/@1 ]
then
  tar -xzf \$snapshotsocket/m4_snapshotdirectory/@1
else
  wget m4_spotlight_download_url/@1
  tar -xzf @1
  rm @1
fi

@| @}



We choose to put the Wikipedia database in the spotlight directory.

@d install the Spotlight server @{@%
cd \$envdir/spotlight
wget m4_wikipediadb_url
tar -xzf m4_wikipediadb_tarball
rm  m4_wikipediadb_tarball
@| @}



The macro \verb|check/start spotlight| does the following:

\begin{enumerate}
\item Check whether spotlight runs on the default spotlighthost.
\item If that is not the case, and the defaulthost is not
  \verb|localhost|, check whether Spotlight runs on localhost.
\item If a running spotlightserver is still not found, start a
  spotlightserver on localhost.
@% \item If variable \verb|spotlighthost| exists, it checks whether
@%   Spotlight is already running on that host.
@% \item If Spotlight does not run on that host or if If variable
@%   \verb|spotlighthost| does not exist, it sets variable
@%   \verb|spotlighthost| to localhost and then checks whether Spotlight
@%   runs on localhost.
@% \item If Spotlight has not yet been found, install spotlight on localhost.
@% \item If a running spotlight has been found, set variable
@%   \verb|spotlightrunning| to 0.
\end{enumerate}

Start Spotlight if it doesn't run already. Spotlight ought to run on
localhost unless variable \verb|spotlighthost| exists. In that case,
check whether a Spotlight server can be contacted on that
host. Otherwise, change \verb|spotlighthost| to \verb|localhost| and
check whether a Spotlight server runs there. If that is not the case,
start up a Spotlight server on localhost.  

The following script, \verb|check_start_spotlight|, has the following three
optional arguments:

\begin{description}
\item[language:] Default is exported variable \verb|naflang| if it
  exists, or \verb|en|.
\item[spotlighthost:] Name of a host that probably runs a
  Spotlightserver. Default: exported variable \verb|spotlighthost| if
  it exists, or \verb|localhost|.
\item[spotlightport:] Default: exported variable \verb|spotlightport|
  if it exists or either m4_spotlight_en_port or m4_spotlight_nl_port for English resp. Dutch.
\end{description}

@o m4_bindir/check_start_spotlight @{@%
#!/bin/bash
source m4_aenvbindir/progenv
@< get commandline-arguments @>
@< set default arguments for Spotlight @>
@| @}

Fill in default values when they cannot be found in exported
variables nor in command-line arguments.

@d set default arguments for Spotlight @{@%
if
  [ "$spotlighthost" == "" ]
then
  spotlighthost=m4_spotlight_host
fi
if
  [ "$spotlightport" == "" ]
then
  if
    [ "$naflang" == "nl" ]
  then
      spotlightport=m4_spotlight_nl_port
  else
      spotlightport=m4_spotlight_en_port
  fi
fi
@| @}


@% @d set variables for check\_start\_spotlight @{@%
@% @< set local variable @(language@,1@,naflang@,en @>
@% @< set local variable @(spothost@,2@) @>
@% 
@% @| @}
@% 
@% @d set variable as argument or as default @{@%
@% local @1=@4
@% if
@%   [ ! "\$@3" == "" ]
@% then
@%   @1=\$@3
@% fi
@% if
@%   [ ! "\$@2" == "" ]
@% then
@%   @1=\$@2
@% fi
@% @| @}



@o m4_bindir/check_start_spotlight @{@%
@< check listener on host, port @($spotlighthost@,$spotlightport@) @>
if
  [ \$spotlightrunning -ne 0 ]
then
  if 
    [ ! "$spotlighthost" == "localhost" ]
  then
    export spotlighthost="localhost"
    @< check listener on host, port @($spotlighthost@,$spotlightport@) @>
  fi
fi
if
  [ \$spotlightrunning -ne 0 ]
then
  @< start the Spotlight server on localhost @>
fi
echo $spotlighthost:$spotlightport
@| @}

@d make scripts executable @{@%
chmod 775  m4_bindir/check_start_spotlight
@| @}

Use function \verb|check_start_spotlight| to find and exploit a
running Spotlight-server or to die (with exit code 5) if no server can be found or
created. The macro uses implicitly the exported variables
\verb|spotlighthost| and \verb|spotlightport| if they exist. 

@d find a spotlightserver or exit @{@%
spothostport=`m4_abindir/check_start_spotlight -l \$naflang`
export spotlighthost=`echo \$spothostport | gawk -F ":" '{print $1}'`
export spotlightport=`echo \$spothostport | gawk -F":" '{print $2}'`
echo "Spotlight server found on $spothostport." >&2 
if
  [ "\$spotlighthost" == "none" ]
then
  echo "No Spotlight-server found."
  exit 5
fi
@| @}




@% @d function to check/start spotlight @{@%
@% function check_start_spotlight {
@%   local oldd=`pwd`
@%   @< set variables for check\_start\_spotlight @>
@% 
@%   naflang=$1
@%   @< get spotlight language parameters @>
@%   spotlighthost=m4_spotlight_host
@%   @< check listener on host, port @($spotlighthost@,$spotlightport@) @>
@%   if
@%     [ \$spotlightrunning -ne 0 ]
@%   then
@%     if 
@%       [ ! "$spotlighthost" == "localhost" ]
@%     then
@%       export spotlighthost="localhost"
@%       @< check listener on host, port @($spotlighthost@,$spotlightport@) @>
@%     fi
@%   fi
@%   if
@%     [ \$spotlightrunning -ne 0 ]
@%   then
@%     @< start the Spotlight server on localhost @>
@%   fi
@%   export spotlighthost
@%   export spotlightrunning
@%   cd $oldd
@% }
@% @| @}


@% @o m4_bindir/start_spotlight @{@%
@% #!/bin/bash
@% # start_spotlight -- Check whether we can connect to a Spotlight server
@% #                    Start Spotlight server on localhost if this is not the case.
@% # Argument 1: "en" or "nl"
@% @< get spotlight language parameters @>
@% spotlight_host=
@% @| @}


Set the port-number and the language resource for Spotlight, dependent
of the language that the user gave as argument.

@d get spotlight language parameters @{@%
if
  [ "$naflang" == "nl" ]
then
   spotlightport=m4_spotlight_nl_port
@%   spotlightresource="nl"
else
  spotlightport=m4_spotlight_en_port
@%   spotlightresource="en_2+2"
fi
@| @}



@% @d check/start spotlight @{@%
@% if
@%  [ "$naflang" == "nl" ]
@% then
@%   export spotlightport=m4_spotlight_nl_port
@% else
@%   export spotlightport=m4_spotlight_en_port
@% fi
@% export spotlighthost=m4_spotlight_host
@% @< check listener on host, port @($spotlighthost@,$spotlightport@) @>
@% if
@%   [ \$spotlightrunning -ne 0 ]
@% then
@%   if 
@%     [ ! "$spotlighthost" == "localhost" ]
@%   then
@%     export spotlighthost="localhost"
@%     @< check listener on host, port @($spotlighthost@,$spotlightport@) @>
@%   fi
@% fi
@% if
@%   [ \$spotlightrunning -ne 0 ]
@% then
@%   @< start the Spotlight server on localhost @>
@%   @< check listener on host, port @($spotlighthost@,$spotlightport@) @>
@% fi
@% @% if 
@% @%   [ ! $spotlightrunning ]
@% @% then
@% @%   [ $spotlighthost ] || export spotlighthost=m4_spotlight_host
@% @%   @< try to obtain a running spotlightserver @>
@% @% fi
@% @| @}

The following macro has a hostname and a port-number as arguments. It
checks whether something in the host listens on the port and sets
variable \verb|success| accordingly:

@d check listener on host, port @{@%
exec 6<>/dev/tcp/@1/@2 2>/dev/null
spotlightrunning=\$?
exec 6<&-
exec 6>&-
@| @}



If variable \verb|spotlighthost| does not exist, set it to
localhost. Test whether a Spotlightserver runs on
\verb|spotlighthost|. If that fails and \verb|spotlighthost| did not
point to localhost, try localhost. 

If the previous attempts were not succesfull, start the
spotlightserver on localhost. 

If some spotlightserver has been contacted, set variable
\verb|spotlightrunning|. Otherwise exit. At the end variable
\verb|spotlighthost| ought to contain the address of the Spotlight-host.

@d try to obtain a running spotlightserver @{@%
@< test whether spotlighthost runs @($spotlighthost@) @>
if 
  [ ! $spotlightrunning ]
then
  if
    [ "$spotlighthost" != "localhost" ]
  then
    export spotlighthost=localhost
    @< test whether spotlighthost runs @($spotlighthost@) @>
  fi
fi
if
  [ ! $spotlightrunning ]
then
  @< start the Spotlight server on localhost @>
  @< test whether spotlighthost runs @($spotlighthost@) @>
fi
if
  [ ! $spotlightrunning ]
then
  echo "Cannot start spotlight"
  exit 4
fi
@| @}

Test whether the Spotlightserver runs on a given host. The
``spotlight-test'' does not really test Spotlight, but it tests
whether something is listening on the port and host where we expect
Spotlight. I found the test-construction that is used here on
\href{http://stackoverflow.com/questions/9609130/quick-way-to-find-if-a-port-is-open-on-linux}{Stackoverflow}.
If the test is positive, set variable \verb|spotlightrunning| to
0. Otherwise, unset that variable.


@d test whether spotlighthost runs @{@%
exec 6<>/dev/tcp/@1/m4_spotlight_nl_port
if
  [ $? -eq 0 ]
then
  export spotlightrunning=0
else
  spotlightrunning=
fi
exec 6<&-
exec 6>&-
@| @}

When trying to start the Spotlight-server on localhost, take care that
only one process does this. So we do this:

\begin{enumerate}
\item Try to acquire a lock without waiting for it.
\item If we got the lock, run the Spotlight java program in background.
\item If we got the lock, release it.
\item If we did not get the lock, wait for the lock to be released by
  the process that started the spotlight-server.
\end{enumerate}

But first, we specify the resources for the Spotlight-server.

@d start the Spotlight server on localhost @{@%
if
  [ "$naflang" == "nl" ]
then
  spotresource="nl"
else
  spotresource="en_2+2"
fi
spotlightjar=dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar 
@| @}


@d start the Spotlight server on localhost @{@%
local oldd=`pwd`
cd m4_aspotlightdir
\$envbindir/sematree acquire spotlock 0
gotit=\$?
if
  [ \$gotit == 0 ]
then
  java -jar -Xmx8g \$spotlightjar $spotresource \
       http://localhost:$spotlightport/rest  &
  @< wait until the spotlight server is up or faulty  @>
  \$envbindir/sematree release spotlock
else
  @< wait until the spotlight server is up or faulty  @>
fi
cd \$oldd
@% [ $progenvset ] || source m4_aenvbindir/progenv
@% cd m4_aspotlightdir
@% @% java  -Xmx8g -jar m4_spotlightjar nl http://localhost:m4_spotlight_nl_port/rest
@% java -jar -Xmx8g dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar nl http://localhost:2060/rest  &
@% @% java -jar -Xmx8g dbpedia-spotlight-0.7-jar-with-dependencies-candidates.jar nl http://localhost:2060/rest  &
@% sleep 60
@| @}

@% @d wait until the spotlight server is up @{@%
@% while
@%   @< check listener on host, port @($spotlighthost@,$spotlightport@) @>
@%   [ $spotlightrunning -ne 0 ]
@% do
@%   sleep 10
@% done
@% @| @}


When the Sportlight server has been started, it takes op to a minute
until it really listens on its port. When there is something wrong, it
will never listen, of course. Therefore, we give it three minutes. If
after that time still nothing listens, we set \verb|spotlighthost| to
\verb|none|, indicating that something has gone wrong. 

@d wait until the spotlight server is up or faulty @{@%
trial=0
maxtrials=12
while
  trial=$((trial+1))
  @< check listener on host, port @($spotlighthost@,$spotlightport@) @>
  [ $spotlightrunning -ne 0 ] && [ $trial -le $maxtrials ] 
do
  sleep 10
done
if
  [ spotlightrunning -ne 0 ]
then
 export spotlighthost="none"
fi
@| @}


Start the Spotlight if it is not already running. First find out what
the host is on which we may expect to find a listening Spotlight.

Variable \verb|spotlighthost| contains the address of the
host where we expect to find Spotlight. If the expectation does not
come true, and the Spotlighthost was not localhost, test whether
Spotlight can be found on localhost. If the spotlight-server cannot be
found, start it up on localhost.

@% @d check/start the Spotlight server @{@%
@% export spotlighthost=m4_spotlight_host
@% @< test whether spotlighthost runs @($spotlighthost@) @>
@% if
@%   [ $spotlightrunning -ne 0 ]
@% then
@%   if
@%     [ $spotlighthost != "localhost" ]
@%   then
@%     export spotlighthost="localhost"
@%     @< test whether spotlighthost runs @($spotlighthost@) @>
@%   fi
@% fi
@% @| @}
@% 
@% 
@% 
@% Start spotlight on localhost if we couldn't find one.
@% 
@% @d check/start the Spotlight server @{@%
@% if
@%   [ $spotlightrunning -ne 0 ]
@% then
@%   @< start the Spotlight server on localhost @>
@% fi
@% @| @}
@% 
@% 
@%  If
@% the expectation did not come true, start up Spotlight locally 



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
opinion-miner. SVMlight can be obtained from 
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

\href{http://www.chokkan.org/software/crfsuite}{CRFsuite} is an
implementation of Conditional Random Fields (\textsc{crf}). Module
\href{https://github.com/cltl/opinion_miner_deluxe}{opinion-miner-de-luxe}
needs it. It can be installed from it's sources, but I did not manage
to this. Therefore, currently we use a pre-compiled ball. 

@d install CRFsuite @{@%
@% @< get or have @(m4_CRFsuitebinball@) @>
tempdir=`mktemp -d -t crfsuite.XXXXXX`
cd $tempdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_CRFsuitebinball
cd crfsuite-0.12
cp -r bin/crfsuite $envbindir/
mkdir -p $envdir/include/
cp -r include/* $envdir/include/
mkdir -p $envdir/lib/
cp -r lib/* $envdir/lib/
cd m4_aprojroot
rm -rf $tempdir
@| @}



@% @d install liblblbfgs @{@%
@% tempdir=`mktemp -d -t liblblbfgs.XXXXXX`
@% cd \$tempdir
@% git clone m4_liblblbfgs_git
@% cd liblblfgs
@% ./autogen.sh
@% ./configure --prefix=\$envdir
@% make
@% make install
@% cd m4_aprojroot
@% rm -rf \$tempdir
@% @| @}
@% 
@% @d install CRFsuite @{@%
@% @< install liblblbfgs @>
@% tempdir=`mktemp -d -t crfsuite.XXXXXX`
@% cd \$tempdir
@% wget m4_CRFsuiteball_url
@% tar -xzf m4_CRFsuiteball
@% cd m4_CRFsuitedir
@% ./configure --prefix=\$envdir
@% make
@% make install
@% cd m4_aprojroot
@% rm -rf \$tempdir
@% @| @}





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
@< start of module-script @(\$jarsdir@)@>
@% @< abort when the language is not English or Dutch @>
JARFILE=\$jarsdir/m4_tokenizerjar
java -Xmx1000m  -jar \$JARFILE tok -l \$naflang --inputkaf
@| @}

@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_tokenizerscript
@%@| @}

\subsubsection{Topic analyser}
\label{sec:topic-install}

The English pipeline contains a topic analyser that seems not yet fit
for Dutch. Get it from the Newsreader repo and update the config file.

@d install the topic analyser @{@%
@% cp -r \$snapshotsocket/components/m4_topictooldir \$modulesdir/
cd $modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_topictoolball
cd \$modulesdir/m4_topictooldir
mv conf.prop old.conf.prop
gawk '{gsub("/home/newsreader/components", subs); print}' subs=$modulesdir old.conf.prop >conf.prop
@| @}


\paragraph{Script:}

@o m4_bindir/topic @{@%
@< start of module-script @(m4_topictooldir@) @>
@% @< abort when the language is not English or Dutch @>
@% rootDir=\$modulesdir/EHU-topic.v30
java -Xmx1000m -jar $MODDIR/ixa-pipe-topic-1.0.1.jar -p $MODDIR/conf.prop
@| @}



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

The morpho-syntactic module parses the sentences with Alpino. Alpino
takes a lot of time to handle long sentences. Therefore the
morpho-syntactic module has an option \verb|-t| to set a time-out (in minutes) for sentence
parsing. 

@o m4_bindir/m4_morphparscript @{@%
@< start of module-script @(m4_morphpardir@) @>
@< get the mor time-out parameter @>
@< set alpinohome @>
cat | python \$MODDIR/core/morph_syn_parser.py $timeoutarg
@| @}

Use \href{http://mywiki.wooledge.org/BashFAQ/035#getopts}{getopts} to
read the \verb|-t| option.

@d get the mor time-out parameter @{@%
OPTIND=1
stimeout=
timeoutarg=
while getopts "t:" opt; do
    case "$opt" in
    t)  stimeout=$OPTARG
        ;;
    esac
done
shift $((OPTIND-1))
if
  [ $stimeout ]
then
  timeoutarg="-t $stimeout"
fi
@| @}


\subsubsection{Pos tagger}
\label{sec:postagger}

In the Dutch pipeline the morpho-syntactic parser fulfills the role of
Pos tagger. In the English pipeline we use the pos-tagger from \EHU{}.

\paragraph{Module}
\label{sec:install-posmodule}

@d install the pos tagger @{@%
@% cp -r \$snapshotsocket/components/m4_posdir \$modulesdir/
cd $modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_posball
cd \$modulesdir/m4_topictooldir
@| @}

\paragraph{Script}
\label{sec:posmodule-script} 

@o m4_bindir/pos @{@%
@< start of module-script @(m4_posdir@) @>
java -Xmx1000m -jar ${MODDIR}/ixa-pipe-pos-1.4.3.jar tag -m ${MODDIR}/en-maxent-100-c5-baseline-dict-penn.bin
@| @}


\subsubsection{Constituent parser}
\label{sec:constparser}

\paragraph{Module}

@d install the constituents parser @{@%
@% cp -r \$snapshotsocket/components/m4_conspardir \$modulesdir/
cd $modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_consparball
cd \$modulesdir/conspardir
chmod 775 *.jar
chmod 775 *.bin
@| @}


\paragraph{Script}

@o m4_bindir/m4_consparscript @{@%
@< start of module-script @(m4_conspardir@) @>
java -Xmx1000m -jar ${MODDIR}/m4_consparname-m4_consparversion.jar parse -g sem -m ${MODDIR}/en-parser-chunking.bin
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

\subsubsection{NED-reranker}
\label{sec:nedrer}

\paragraph{Module}

@d install the \NED-reranker module @{@%
cd \$modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_nedrerball
@| @}



\paragraph{Script}

@o m4_bindir/m4_nedrerscript @{@%
@< start of module-script @(m4_nedrerdir@) @>
cd $MODDIR
python $MODDIR/domain_model.py
@| @}

\subsubsection{Wikify module}
\label{sec:wikify}

\paragraph{Module}

@d install the wikify module @{@%
cd \$modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_wikifyball
@| @}

\paragraph{Script}

The Wikify module needs DBpedia to generate ``markables''. 

@o m4_bindir/wikify @{@%
@< start of module-script @(m4_wikifydir@) @>
@% if
@%   [ "$naflang" == "nl" ]
@% then
@%   spotlightport=m4_spotlight_nl_port
@% else
@%   spotlightport=m4_spotlight_en_port
@% fi
@% [ $spotlightrunning ] || source m4_abindir/start-spotlight
@< find a spotlightserver or exit @>
cd $MODDIR
java -Xmx1000m -jar ${MODDIR}/ixa-pipe-wikify-1.2.1.jar -s http://$spotlighthost -p $spotlightport 
@| @}


\subsubsection{UKB}
\label{sec:ukb}

UKB needs boost libraries and Perl version 5. For now, we consider them installed.


\paragraph{Module}

@d install the UKB module @{@%
@% cd \$modulesdir
@% tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_ukbball
@| @}

\paragraph{Script}

Put the path to the boost libraries in the \verb|LD_LIBRARY_PATH|
variable and then run \textsc{ukb}.

Note that we cannot call perl impicitly with the hashbang.

@o m4_bindir/ukb @{@%
@< start of module-script @(m4_ukbdir@) @>
cd $MODDIR
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$envdir/boost_1_54_0/stage/lib
perl ${MODDIR}/naf_ukb/naf_ukb.pl -x ${MODDIR}/ukb/bin/ukb_wsd -K ${MODDIR}/wn30-ili_lkb/wn30g.bin64 -D ${MODDIR}/wn30-ili_lkb/wn30.lex - -- --dict_weight --dgraph_dfs --dgraph_rank ppr

@| @}

\subsubsection{IMS-WSD}
\label{sec:IMS-WSD}

\paragraph{Module}

The package itself supplies an installation script that seems
usable. However, today I am in a hurry and just install the module as
it comes from the EHU repository.

Although the Hadoop implementation runs this module with Java 1.7, I
could only run \verb|ims+wsd| Java 1.6. Using Java 1.7 causes run-time
errors ``Platform not recognised'' and the resulting NAF's do not
contain WordNet references. So, we had to install Java 1.6. 

The scripts contain explicit paths that must be corrected:

\begin{description}
\item[\texttt{ims/testPlain}:] Explicit path to Java binary.
\item[\texttt{path\_to\_ims.py}:] Set variable \verb|PATH_TO_IMS|. 
\end{description}

@d install the ims-wsd module @{@%
cd \$modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_ewsdball
cd m4_ewsddir
thisDir=`pwd`
echo PATH_TO_IMS = "'"$thisDir/ims"'" > path_to_ims.py
cd ims
cp testPlain.bash old.testPlain.bash
sedcommand='s|/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre/bin/java|java|g'
cat old.testPlain.bash | sed $sedcommand >testPlain.bash
@| @}

\paragraph{Script}


@o m4_bindir/ewsd @{@%
@< start of module-script @(m4_ewsddir@) @>
@< set up Java 1.6 @>
#Setting the output to be ili-wn30 synsets instead of sensekeys
$MODDIR/call_ims.py -ili30
@| @}


\subsubsection{SRL server}
\label{sec:srlserver}

The EHU SRL-module, that we use for Enghlish documents, has been set
up as a server/client system. Hence, we have to start the server
before we can process something.

We don't know in advance whether we run the pipeline for a single text
or from a whole bunch of text and hence we do not know whether it is
advisable that the server keeps running, occupying precious
memory. Therefore, currently we just start and stop the server every
time that we use it.

\paragraph{Module}

@d install the srl-server module @{@%
cd \$modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_srlserverball
cd m4_srlserverdir
mkdir -p m4_apiddir
@| @}


\paragraph{Scripts}

Generate three scripts: \verb|start_eSRL|, \verb|stop_esrl| and
\verb|eSRL|, resp. to start the SRL server, to stop it and to process
a \NAF{} file.

@o m4_bindir/start_eSRL @{@%
@< start of module-script @(m4_srlserverdir@) @>
@< start EHU SRL server if it isn't running @>
@| @}

@o  m4_bindir/stop_eSRL @{@%
@< start of module-script @(m4_srlserverdir@) @>
@< stop EHU SRL server @>
@| @}


@o m4_bindir/m4_esrlscript @{@%
@< start of module-script @(m4_srlserverdir@) @>
m4_abindir/start_eSRL
java -Xmx1000m -cp $MODDIR/IXA-EHU-srl-3.0.jar ixa.srl.SRLClient en
@| @}


@d start EHU SRL server if it isn't running @{@%
pidFile=m4_apiddir/SRLServer.pid
portInfo=$(nmap -p m4_srlserverport localhost | grep open)
if [ -z "$portInfo" ]; then
  >&2 echo "Starting srl-server as it is not runnning"
  java -Xms2500m -cp $MODDIR/IXA-EHU-srl-3.0.jar ixa.srl.SRLServer en &> /dev/null &
  pid=$!
  echo $pid > $pidFile
  sleep 60
  >&2 echo "Server running: ${pid}"
else
 >&2 echo "Server already running.."
fi
@| @}

@d stop EHU SRL server @{@%
pidFile=m4_apiddir/SRLServer.pid
if
 [ -e "$pidFile" ]
then
 kill `echo $pidFile`
 rm $pidFile
fi
@| @}


\subsubsection{SRL Dutch nominals}
\label{sec:srl-dn}

\paragraph{Module}


@d install the srl-dutch-nominals module @{@%
MODNAM=m4_srl_dn_name
DIRN=m4_srl_dn_dir
GITU=m4_srl_dn_git
GITC=m4_srl_dn_commitname
@< install from github @>
cd \$modulesdir/m4_srl_dn_dir
@| @}

\paragraph{Script}

@o m4_bindir/m4_srl_dn_script @{@%
@< start of module-script @(m4_srl_dn_dir@) @>
cd $MODDIR
cat | python $MODDIR/m4_srl_dn_binary
@| @}


\subsubsection{FBK-time module}
\label{sec:fbktime}

\paragraph{Module}

@d install the FBK-time module @{@%
cd \$modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_fbktimeball
@| @}


\paragraph{Script}

The script is rather complicated. I just copied it from the orignal
makers, with one exception: Originally at the end of the script there
was a pipe consisting of two Java programs. However, that didn't seem
to work in one of the computers that we use, therefore we have split
the pipe using \verb|mytemp| as temporary storage. 



@o m4_bindir/FBK-time @{@%
@< start of module-script @(m4_fbktimedir@) @>
BEGINTIME=`date '+%Y-%m-%dT%H:%M:%S%z'`
YAMCHA=$MODDIR/tools
timdir=`mktemp -d -t time.XXXXXX`
FILETXP=$timdir/TimePro.txp
CHUNKIN=$timdir/TimePro.naf
FILEOUT=$timdir/TimeProOUT.txp
TIMEPRONORMIN=\$timdir/TimeProNormIN.txp
JAVAMAXHEAP=2g
mytemp=\$timdir/mytemp
result=0
cd $MODDIR
cat > $CHUNKIN

JAVACLASSPATH="lib/jdom-2.0.5.jar:lib/kaflib-naf-1.1.9.jar:lib/NAFtoTXP_v11.jar"
JAVAMODULE=eu.fbk.newsreader.naf.NAFtoTXP_v11
cat $CHUNKIN | \
 java -Xmx$JAVAMAXHEAP -cp $JAVACLASSPATH $JAVAMODULE $FILETXP chunk+entity timex
@< stop on error @(Java: $JAVACLASSPATH:$JAVAMODULE@) @>
#echo "Saving... $FILETXP"
tail -n +4 $FILETXP | awk -f resources/english-rules > $FILEOUT
head -n +4 $FILETXP > $TIMEPRONORMIN

cat $FILEOUT | \
  $YAMCHA/yamcha-0.33/usr/local/bin/yamcha \
    -m models/tempeval3_silver-data.model \
  >> $TIMEPRONORMIN
@< stop on error @(yamcha@) @>
JAVACLASSPATH="lib/scala-library.jar:lib/timenorm-0.9.1-SNAPSHOT.jar"
JAVACLASSPATH=$JAVACLASSPATH:"lib/threetenbp-0.8.1.jar:lib/TimeProNorm_v2.5.jar"
JAVAMODULE=eu.fbk.timePro.TimeProNormApply
cat $TIMEPRONORMIN | \
  java -Xmx$JAVAMAXHEAP -cp $JAVACLASSPATH $JAVAMODULE $FILETXP
@< stop on error @(Java: $JAVACLASSPATH:$JAVAMODULE@) @>
rm $FILEOUT
rm $TIMEPRONORMIN

JAVACLASSPATH="lib/jdom-2.0.5.jar:lib/kaflib-naf-1.1.9.jar:lib/NAFtoTXP_v11.jar"
JAVAMODULE=eu.fbk.newsreader.naf.NAFtoTXP_v11
cat $CHUNKIN | java -Xmx$JAVAMAXHEAP -cp $JAVACLASSPATH $JAVAMODULE $FILEOUT chunk+morpho+timex+event eval
@< stop on error @(Java: $JAVACLASSPATH:$JAVAMODULE@)@>
JAVACP1="lib/TXPtoNAF_v5.jar:lib/jdom-2.0.5.jar:lib/kaflib-naf-1.1.9.jar"
JAVAMOD1=eu.fbk.newsreader.naf.TXPtoNAF_v4
JAVACP2="lib/kaflib-naf-1.1.9.jar:lib/jdom-2.0.5.jar:lib/TimeProEmptyTimex_v2.jar"
JAVAMOD2=eu.fbk.timepro.TimeProEmptyTimex
@% java  -Dfile.encoding=UTF8 -cp $JAVACP1 $JAVAMOD1 $CHUNKIN $FILETXP "$BEGINTIME" TIMEX3 | \
@%  java -Dfile.encoding=UTF8 -cp $JAVACP2 $JAVAMOD2 $FILEOUT
java -Xmx$JAVAMAXHEAP  -Dfile.encoding=UTF8 -cp $JAVACP1 $JAVAMOD1 $CHUNKIN $FILETXP "$BEGINTIME" TIMEX3 > $mytemp
@% @< stop on error @(Java: $JAVACLASSPATH:$JAVAMODULE@)@>
cat $mytemp | java -Xmx$JAVAMAXHEAP -Dfile.encoding=UTF8 -cp $JAVACP2 $JAVAMOD2 $FILEOUT
@< stop on error @(Java: $JAVACLASSPATH:$JAVAMODULE@)@>
rm $FILETXP
rm $CHUNKIN
rm -rf $timdir
@| @}

When one of the programs in the script fail, stop processing. Pass the
error-code and write a message to locate the failing program. Remove
the temporary directory. However, there is a problem. One of the java
programs always results with result-code 1.  

@d stop on error @{@%
result=$?
if
  [ $result -ne 0 ]
then
  cd $MODDIR
  echo Error: @1 >&2
  rm -rf $timdir
  exit $result
fi
@| @}



\subsubsection{FBK-temprel module}
\label{sec:FBK-temprel}

\paragraph{Module}

@d install the FBK-temprel module @{@%
cd \$modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_fbktemprelball
@< repair FBK-*rel's run.sh.hadoop @(m4_fbktempreldir@) @>
@| @}

Script run.sh.hadoop seems to be obsolete in the original tarball:

\begin{enumerate}
\item The class-path argument in one of the Java statement refers to
  an obsolete jar (\verb|kaflib-naf-1.1.8| instead of \verb|kaflib-naf-1.1.9|)
\item Another class-path argument refers to
  \verb|PredicateTimeAnchor_tlink.jar| instead of \verb|PredicateTimeAnchor.jar|.
\item A ``sh'' statement is used. The problem is, that in Ubuntu \verb|/bin/sh|
  points to \verb|bin/dash| and the script
  (\verb|temprel-pipeline-per-file-NWR.sh|) does not seem to be
  compatible with \verb|dash|.
\end{enumerate}

Therefore, we need to repair the script. We will need to repair the
script in the \verb|FBK-causalrel| module in a similar way, and
therefore provide the module-directory as argument.

@d repair FBK-*rel's run.sh.hadoop @{@%
cd \$modulesdir/@1
mv run.sh.hadoop old.run.sh.hadoop
cat old.run.sh.hadoop | \
  sed s/kaflib-naf-1.1.8/kaflib-naf-1.1.9/g | \
  sed s/TimeAnchor_tlink.jar/TimeAnchor.jar/g | \
  sed "s/sh temprel/bash temprel/g" | \
  sed "s/java /java -Xmx2g /g"  \
>run.sh.hadoop
chmod 775 run.sh.hadoop
@| @}


\paragraph{Script}

The original run script seems to not only read the input naf from
standard in, but also to obtain the input naf as a file that an
argument points to. This constructions makes the pipeline complicated,
therefore, we generate the naf file within the script.

The original script generates temporary files in the \verb|temp|
directory of the host-computer, and prefixes the names of the
temporary files with a random number to prevent confusion between
tempfiles of different instances of this module. We generate a
temp-directory per instance. 

@o m4_bindir/m4_fbktemprelscript @{@%
@< start of module-script @(m4_fbktempreldir@) @>
cd $MODDIR
scratchDir=`mktemp -d -t temprel.XXXXXX`
cat >$scratchDir/in.naf
@%cat $scratchDir/in.naf | ./run.sh.hadoop $MODDIR $scratchDir $scratchDir/in.naf
./run.sh.hadoop $MODDIR $scratchDir $scratchDir/in.naf
rm -rf $scratchDir
@% # $3 = xml input file
@% scratchDir=`mktemp -d -t temprel.XXXXXX`
@% @% xmlFile=$scratchDir/infile
@% @% cat >$xmlfile
@% cd "$MODDIR"
@% RANDOMFIX="123"
@% FILETXP=$scratchDir/Temprel
@% NAF=$scratchDir/Temprel.naf
@% cat > $NAF
@% 
@% BEGINTIME=`date '+%Y-%m-%dT%H:%M:%S%z'`
@% 
@% JAVACLASSPATH="lib/kaflib-naf-1.1.8.jar:lib/NAFtoTXP_v11.jar:lib/jdom-2.0.5.jar"
@% JAVAMODULE=eu.fbk.newsreader.naf.NAFtoTXP_v11
@% CHUNKPAIRARG="chunk+entity+event+timex+connectives"
@% CHUNKPAIRARG=$CHUNKPAIRARG"+srl+dep+morpho+coevent"
@% CHUNKPAIRARG=$CHUNKPAIRARG"+dct+main_verb+pairs"
@% cat $NAF | /
@%   java -cp $JAVACLASSPATH $JAVAMODULE \
@%     $FILETXP $CHUNKPAIRARG eval
@% 
@% sh temprel-pipeline-per-file-NWR.sh \
@%       $FILETXP $MODDIR/tools/ \
@%       $scratchDir \
@%       $RANDOMFIX \
@%       1-step
@% 
@% CP1="lib/TXPtoNAF_v4.jar:lib/jdom-2.0.5.jar:lib/kaflib-naf-1.1.8.jar"
@% CP2="tools/jython/jython.jar:lib/kaflib-naf-1.1.8.jar"
@% CP2=$CP2":lib/jdom-2.0.5.jar:lib/PredicateTimeAnchor_tlink.jar"
@% 
@% java -Dfile.encoding=UTF8 \
@%   -cp $CP1 \
@%   eu.fbk.newsreader.naf.TXPtoNAF_v4 \
@%   $NAF \
@%   "$scratchDir"/"$RANDOMFIX".tlinks \
@%   "$BEGINTIME" TLINK \
@% | \
@%   java \
@%     -cp $CP2 \
@%     eu.fbk.newsreader.TimeAnchor.PredicateTimeAnchor \
@%     tlink timeA $FILETXP
@% 
@% rm $FILETXP
@% rm "$scratchDir"/"$RANDOMFIX".tlinks
@% rm $NAF

@| @}

\subsubsection{FBK-causalrel module}
\label{sec:FBK-causalrel}

\paragraph{Module}

@d install the FBK-causalrel module @{@%
cd \$modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_fbkcausalrelball
@< repair FBK-*rel's run.sh.hadoop @(m4_fbkcausalreldir@) @>
@| @}

Like in \verb|FBK-temprel|, script run.sh.hadoop seems not to work out
of the box:

\begin{enumerate}
\item The class-path argument in one of the Java statement refers to
  an obsolete jar (\verb|kaflib-naf-1.1.8| instead of \verb|kaflib-naf-1.1.9|)
@% \item Another class-path argument refers to
@%   \verb|PredicateTimeAnchor_tlink.jar| instead of \verb|PredicateTimeAnchor.jar|.
\item A ``sh'' statement is used. The problem is, that in Ubuntu \verb|/bin/sh|
   points to \verb|bin/dash| and the script
   (\verb|temprel-pipeline-per-file-NWR.sh|) does not seem to be
   compatible with \verb|dash|.
\end{enumerate}

Therefore, we need to repair that script like we did in \verb|FBK-temprel|.

@d repair causalrel's run.sh.hadoop @{@%
cd \$modulesdir/m4_fbkcausalreldir
mv run.sh.hadoop old.run.sh.hadoop
cat old.run.sh.hadoop | \
  sed s/kaflib-naf-1.1.8/kaflib-naf-1.1.9/g | \
  sed s/TimeAnchor_tlink.jar/TimeAnchor.jar/g | \
  sed s/sh temprel/bash temprel/g | \
>run.sh.hadoop
chmod 775 run.sh.hadoop
@| @}


\paragraph{Script}

@o  m4_bindir/m4_fbkcausalrelscript @{@%
@< start of module-script @(m4_fbkcausalreldir@) @>
cd $MODDIR
scratchDir=`mktemp -d -t causalrel.XXXXXX`
cat >$scratchDir/in.naf
@%cat $scratchDir/in.naf | ./run.sh.hadoop $MODDIR $scratchDir $scratchDir/in.naf
./run.sh.hadoop $MODDIR $scratchDir $scratchDir/in.naf
rm -rf $scratchDir
@| @}

\subsubsection{Factuality module}
\label{sec:factuality}

\paragraph{Module}

@d install the factuality module @{@%
cd \$modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_factualityball
@| @}


\paragraph{Script}


@o m4_bindir/m4_factualityscript @{@%
@< start of module-script @(m4_factualitydir@) @>
cd $MODDIR
#local settings to prevent perl from complaining
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

rootDir=${MODDIR}
tmpDir=$(mktemp -d -t factuality.XXXXXX)

export PATH=$PATH:${rootDir}:.
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${rootDir}/../opt/lib/:${rootDir}/../opt/boost_1_54_0/stage/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:m4_aenvdir/lib/

#mkdir -p ${scratchDir}/test

python ${rootDir}/vua_factuality_naf_wrapper.py -t m4_aenvbindir/timbl -p ${rootDir} ${tmpDir}/

@| @}


\subsubsection{Nominal coreference-base}
\label{sec:nomcorefgraph}

The source of this module in Github (\url{m4_corefbasegit}) does not seem to work well with
\NAF{}. Therefore, we use the version from the official English
pipeline, that we find in the snapshot.
 

\paragraph{Module}

@% @d install coreference-base @{@%
@% MODNAM=coreference-base
@% DIRN=m4_corefbasedir
@% GITU=m4_corefbasegit
@% GITC=m4_corefbase_commitname
@% @< install from github @>
@% @% pip install --upgrade --user hg+https://bitbucket.org/Josu/pykaf#egg=pykaf
@% @% pip install --upgrade --user networkx
@% pip install --upgrade  hg+https://bitbucket.org/Josu/pykaf#egg=pykaf
@% pip install --upgrade  networkx
@% @| @}


@d install coreference-base @{@%
cd \$modulesdir
tar -xzf m4_snapshotsocket/m4_snapshotdirectory/m4_corefbase_ball
@| @}


\paragraph{Script}

@o m4_bindir/m4_corefbasescript @{@%
@< start of module-script @(m4_corefbasedir@) @>
cd $MODDIR/corefgraph
cat | python -m corefgraph.process.file --reader NAF --writer NAF

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

@% cp -r m4_asnapshotroot/m4_nerc_nl_dir  \$modulesdir/
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
have been made available by Rodrigo Agerri on december 15, 2015.


The tarball \verb|dutch-nerc-models.tar.gz| contains the models
\verb|m4_nercmodelconll02| and \verb|m4_nercmodelsonar| Both models
have been placed in subdirectory \verb|/m4_nerc_nl_dir/m4_nercmodeldir/nl| of
the snapshot.

The model for English can be found in the newsreader-repository.

Choose a model dependent of the language.

@d select language-dependent features @{@%
if
  [ "\$naflang" == "nl" ]
then
  export nercmodel=nl/m4_nercmodelconll02
else
  export nercmodel=en/m4_nercmodelen
fi
@| @}

The tarball \verb|m4_nercmodelsball| contains in subdirectories
\verb|nl| and \verb|en| a dutch resp. an english nerc-model. They have
been randomly selected from a number of models that are available in
\url{http://ixa2.si.ehu.es/ixa-pipes/models/nerc-models-1.5.4.tgz}.

@d get the nerc models @{@%
@% @< get or have @(m4_nercmodelsball@) @>
cd $modulesdir
tar -p -xzf m4_snapshotsocket/m4_snapshotdirectory/m4_nercmodelsball
@% chmod g+rwxs nerc_models
@% chmod o+rx nerc_models
@% chmod o+rx nerc_models/nl
@% mkdir -p \$modulesdir/m4_nercdir/en
@% cp \$snapshotsocket/m4_enrepo_dir/m4_EHU_nercdir/\$en_nercmodel \$modulesdir/m4_nercdir/en/
@% rm \$pipesocket/m4_nercmodelsball
@% cp -r m4_asnapshotroot/m4_nerc_nl_dir/m4_nercmodeldir \$modulesdir/m4_nerc_nl_dir/
@% chmod -R 775 \$modulesdir/m4_nercdir
@% rm \$pipesocket/m4_nercmodelsball
@% cp -r m4_asnapshotroot/m4_nerc_nl_dir/m4_nercmodeldir \$modulesdir/m4_nerc_nl_dir/
@% chmod -R 775 \$modulesdir/m4_nercdir
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
@< start of module-script @(m4_nerc_nl_dir@) @>
JAR=$jarsdir/m4_nercjar
MODEL=m4_nercmodelconll02
cat | java -Xmx1000m -jar \$JAR tag -m $MODDIR/nl/$MODEL
@| @}

@% @o m4_bindir/nerc @{@%
@% #!/bin/bash
@% nercmodel=$1
@% if
@%   [ "$nercmodel" == "" ]
@% then
@%   echo "Please provide the name of a NERC model" >&2
@%   exit 4
@% fi
@% source m4_aenvbindir/progenv
@% MODDIR=$modulesdir/m4_nercdir
@% JAR=$jarsdir/m4_nercjar
@% java -jar \$JAR tag -m $MODDIR/\$nercmodel
@% @| @}

@o m4_bindir/nerc @{@%
@< start of module-script @(m4_nercdir@) @>
JAR=$jarsdir/m4_nercjar
if
  [ "$naflang" == "nl" ]
then
  nercmodel=\$modulesdir/m4_nercmodeldir/nl/m4_nl_nercmodel
else
  nercmodel=\$modulesdir/m4_nercmodeldir/en/m4_en_nercmodel
fi
java -Xmx1500m -jar \$JAR tag -m $nercmodel
@| @}


@% It seems that version 1.5.2 does not contain the Sonar model.
@% 
@% @o m4_bindir/m4_nerc_sonar_script @{@%
@% #!/bin/bash
@% source m4_aenvbindir/progenv
@% @% @< set variables that point to the directory-structure @>
@% @% @< set up programming environment @>
@% MODDIR=$modulesdir/m4_nerc_nl_dir
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
@% @< get or have @(m4_wsd_snapball@) @>
cd \$modulesdir/m4_wsddir
#tar -xzf \$pipesocket/m4_wsd_snapball
@% rm \$pipesocket/m4_wsd_snapball
@%cp -r m4_aprojroot/m4_snapshotdirectory/svm_wsd/models .
@% echo 'Downloading models...(could take a while)'
wget --user=cltl --password='.cltl.' kyoto.let.vu.nl/~izquierdo/models_wsd_svm_dsc.tgz 2> /dev/null
echo 'Unzipping models...'
tar xzf models_wsd_svm_dsc.tgz
rm models_wsd_svm_dsc.tgz
echo 'Models installed in folder models'

@| @}




\paragraph{Script}
\label{sec:wsdscript}

@o m4_bindir/m4_wsdscript @{@%
@< start of module-script @(m4_wsddir@) @>
WSDSCRIPT=dsc_wsd_tagger.py
@% cat | python $WSDDIR/$WSDSCRIPT --naf 
cat | python $MODDIR/$WSDSCRIPT --naf -ref odwnSY
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
@% cp -r m4_aprojroot/m4_snapshotdirectory/m4_wsddir \$modulesdir/
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
@% @< get or have @(m4_lu2synball@) @>
cd \$modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_lu2synball
@% rm \$pipesocket/m4_lu2synball
@| @}

\paragraph{Script}
\label{sec:lu2synsetscript}

@o m4_bindir/m4_lu2synsetscript  @{@%
@< start of module-script @(m4_lu2syndir@) @>
JAVALIBDIR=\$MODDIR/lib
RESOURCESDIR=\$MODDIR/resources
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

NED needs to contact a Spotlight-server. 



@o m4_bindir/m4_nedscript @{@%
@< start of module-script @(@) @>
ROOT=\$piperoot
JARDIR=\$jarsdir
@% if
@%   [ "$naflang" == "nl" ]
@% then
@%   spotlightport=m4_spotlight_nl_port
@% else
@%   spotlightport=m4_spotlight_en_port
@% fi
@% [ $spotlightrunning ] || source m4_abindir/start-spotlight
@< find a spotlightserver or exit @>
cat | java -Xmx1000m -jar \$jarsdir/m4_nedjar -H http://$spotlighthost -p $spotlightport -e candidates -i \$envdir/spotlight/wikipedia-db -n nlEn
@% cat | java -jar \$jarsdir/m4_nedjar  -p 2060  -n nl
@| @}


@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_nedscript
@%@| @}

\subsubsection{Ontotagger, Framenet-SRL and nominal events}
\label{sec:onto}

The three modules ontotagger (aka ``predicatematrix''),
Framenet-\textsc{srl} and nominal event detection are based on the
same software packages and resources. The three modules need the same
jar \verb|m4_ontojar|, they need resources from the
\verb|cltl/vua_resources| Github repository and they are going to
execute a script that resides in the scripts directory of the
\verb|cltl/OntoTagger| repository. So, what we have to do is:

\begin{enumerate}
\item Install from the \verb|cltl/OntoTagger| repository.
\item Create the jar and put it in an appropriate place. 
\item install from the \verb|cltl\vua-resources| repository.
\item generate a script fot each of the modules.
\end{enumerate}

In fact, items~2 and~3 are performed by script \verb|install.sh| from
the OntoTagger repository.


\paragraph{Modules}
\label{sec:ontotagger-module}

@d install the ontotagger repository @{@%
@%   obdir=`mktemp -d -t ontobuild.XXXXXX`
@%   cd $obdir
cd \$modulesdir
git clone m4_ontogit
cd m4_ontoname
git checkout m4_ontocommitname
chmod 775 ./install.sh
./install.sh
cd $piperoot
@| @}



\paragraph{Scripts}
\label{sec:ontoscript}

The ``onto'' (predicatematrix) script:

@o m4_bindir/m4_ontoscript @{@%
@< start of module-script @(m4_ontodir@) @>
cd \$MODDIR/scripts
cat | \$MODDIR/scripts/m4_onto_subscript
@% JARDIR=\$MODDIR/lib
@% RESOURCESDIR=\$MODDIR/resources
@% PREDICATEMATRIX="\$RESOURCESDIR/PredicateMatrix.v1.3.txt.role.odwn"
@% GRAMMATICALWORDS="\$RESOURCESDIR/grammaticals/Grammatical-words.nl"
@% TMPFIL=`mktemp -t stap6.XXXXXX`
@% cat >$TMPFIL
@% 
@% CLASSPATH=\$JARDIR/ontotagger-1.0-jar-with-dependencies.jar
@% JAVASCRIPT=eu.kyotoproject.main.KafPredicateMatrixTagger
@% MAPPINGS="fn;mcr;ili;eso"
@% JAVA_ARGS="--mappings $MAPPINGS"
@% JAVA_ARGS="\$JAVA_ARGS  --key odwn-eq"
@% JAVA_ARGS="\$JAVA_ARGS  --version 1.2"
@% JAVA_ARGS="\$JAVA_ARGS  --predicate-matrix \$PREDICATEMATRIX"
@% JAVA_ARGS="\$JAVA_ARGS  --grammatical-words \$GRAMMATICALWORDS"
@% JAVA_ARGS="\$JAVA_ARGS  --naf-file \$TMPFIL"
@% java -Xmx1812m -cp \$CLASSPATH \$JAVASCRIPT \$JAVA_ARGS
@% rm -rf \$TMPFIL

@| @}

The ``Framenet SRL'' script:


@% \subsubsection{Framenet SRL}
@% \label{sec:framesrl}
@% 
@% The framenet \SRL{} is part of the package that contains the ontotagger. We only need a different script.
@% 
@% 
@% \paragraph{Script}
@% \label{sec:framesrlscript}

The script contains a hack, because the framesrl script produces
spurious lines containining ``frameMap.size()=...''. A \textsc{gawk}
script removes these lines.

@o m4_bindir/m4_framesrlscript @{@%
@< start of module-script @(m4_ontodir@) @>
cd \$MODDIR/scripts
cat | \$MODDIR/scripts/m4_framesrl_subscript | gawk '/^frameMap.size()/ {next}; {print}'
@% ONTODIR=$modulesdir/m4_ontodir
@% JARDIR=\$MODDIR/lib
@% RESOURCESDIR=\$MODDIR/resources
@% @% PREDICATEMATRIX="\$RESOURCESDIR/PredicateMatrix.v1.1/PredicateMatrix.v1.1.role.nl-1.merged"
@% PREDICATEMATRIX="\$RESOURCESDIR/PredicateMatrix_nl_lu_withESO.v0.2.role.txt"
@% GRAMMATICALWORDS="\$RESOURCESDIR/grammaticals/Grammatical-words.nl"
@% TMPFIL=`mktemp -t framesrl.XXXXXX`
@% cat >$TMPFIL
@% 
@% CLASSPATH=\$JARDIR/ontotagger-1.0-jar-with-dependencies.jar
@% JAVASCRIPT=eu.kyotoproject.main.SrlFrameNetTagger
@% 
@% JAVA_ARGS="--naf-file \$TMPFIL"
@% JAVA_ARGS="\$JAVA_ARGS  --format naf"
@% JAVA_ARGS="\$JAVA_ARGS  --frame-ns fn:"
@% JAVA_ARGS="\$JAVA_ARGS   --role-ns fn-role:;pb-role:;fn-pb-role:;eso-role:"
@% JAVA_ARGS="\$JAVA_ARGS   --ili-ns mcr:ili"
@% JAVA_ARGS="\$JAVA_ARGS   --sense-conf 0.25"
@% JAVA_ARGS="\$JAVA_ARGS   --frame-conf 70"
@% 
@% java -Xmx1812m -cp \$CLASSPATH \$JAVASCRIPT \$JAVA_ARGS  | gawk '/^frameMap.size()/ {next}; {print}'
@% java -Xmx1812m -cp ../lib/ontotagger-1.0-jar-with-dependencies.jar eu.kyotoproject.main.SrlFrameNetTagger --naf-file "../example/test.srl.lexicalunits.pm.naf" --format naf --frame-ns "fn:" --role-ns "fn-role:;pb-role:;fn-pb-role:;eso-role:" --ili-ns "mcr:ili" --sense-conf 0.25 --frame-conf 70 > "../example/test.srl.lexicalunits.pm.fn.naf"
@% rm -rf \$TMPFIL

@| @}

The ``nomevent'' script:

@o m4_bindir/m4_nomeventscript @{@%
@< start of module-script @(m4_ontodir@) @>
cd \$MODDIR/scripts
cat | \$MODDIR/scripts/m4_nomevent_subscript
@% LIBDIR=\$MODDIR/lib
@% RESOURCESDIR=\$MODDIR/resources
@% 
@% JAR=\$LIBDIR/ontotagger-1.0-jar-with-dependencies.jar
@% JAVAMODULE=eu.kyotoproject.main.NominalEventCoreference
@% @% cat | iconv -f ISO8859-1 -t UTF-8 | java -Xmx812m -cp $JAR $JAVAMODULE --framenet-lu $RESOURCESDIR/nl-luIndex.xml
@% cat | java -Xmx812m -cp $JAR $JAVAMODULE --framenet-lu $RESOURCESDIR/nl-luIndex.xml
@| @}






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
@% @< get or have @(m4_heidelantske@) @>
cd $modulesdir/$DIRN
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_heidelantske
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


Script \verb|install-to-project-repo.py| generates a library in
subdirectory \verb|repo| and copies the jars that it finds in the
\verb|lib| subdirectory in this repo in such a way that Maven finds it
there. Somewhere in the \verb|install-to-project.py| \ldots \verb|mvn|
process the jars are copied in your local repository (\verb|~/.m2|)
too. As a result, only a Maven Guru understands precisely where Maven
obtains its jar from and the best thing to do is to empty the
\verb|repo| subdirectory and the local repository before (re-)
applying \verb|install-to-project-repo.py|.


@d activate the install-to-project-repo utility @{@%
@< remove outdated heideltime jars @>
cd m4_amoddir/$DIRN/
git clone git@@github.com:carchrae/install-to-project-repo.git
mv install-to-project-repo/install-to-project-repo.py .
rm -rf install-to-project-repo
python ./install-to-project-repo.py
@| @}

@d remove outdated heideltime jars @{@%
rm -rf m4_amoddir/$DIRN/repo
mkdir -p m4_amoddir/$DIRN/repo/local
rm -rf m4_heidel_mvn_localdir
rm -rf m4_jvntextpro_mvn_localdir
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
@< start of module-script @(m4_heideldir@) @>
MODDIR=\$modulesdir/m4_heideldir
cd $MODDIR
iconv -t utf-8//IGNORE | java -Xmx1000m -jar target/ixa.pipe.time.jar -m alpino-to-treetagger.csv -c config.props
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
@< start of module-script @(m4_srldir@) @>
MODDIR=\$modulesdir/m4_srldir
TEMPDIR=`mktemp -d -t SRLTMP.XXXXXX`
cd \$MODDIR
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


Get the module from Github. Note that this module needs rdflib

@d install python packages @{@%
pip install rdflib
@| rdflib @}


@d install the post-SRL module @{@%
@% @< get or have @(m4_postsrlball@) @>
cd \$modulesdir
if
  [ -d m4_postsrldir ]
then
  cd m4_postsrldir
  git pull
else
  git clone m4_postsrlgit
  cd m4_postsrldir
fi
@% tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_postsrlball
@| @}


\paragraph{Script}

@o m4_bindir/m4_postsrlscript @{@%
@< start of module-script @(m4_postsrldir@) @>
@% @< set variables that point to the directory-structure @>
cd $MODDIR
tempdir=`mktemp -d -t postsrl.XXXXX`
@% cd $tempdir
cat >$tempdir/infile
python \$MODDIR/m4_postsrlpy -i $tempdir/infile -o $tempdir/outfile
cat $tempdir/outfile
rm -rf $tempdir
@| @}



@%@d make scripts executable @{@%
@%chmod 775  m4_bindir/m4_srlscript
@%@| @}

\subsubsection{Event coreference}
\label{sec:eventcoref}

The event-coreference module is language-independent. Although the
version in the \EHU{}-repo is 3.0, the version 2.0 used in this
pipeline seems to be more recent, so we will use that.

\paragraph{Module}
\label{sec:event-coref-module}

Install the module from the snapshot.

@d install the event-coreference module @{@%
@% @< get or have @(m4_evcoreftarball@) @>
cd \$modulesdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_evcoreftarball
cd m4_evcorefdir
cp lib/m4_evcorefjar \$jarsdir
@| @}



\paragraph{Script}
\label{sec:evcorefscript}

@o m4_bindir/m4_evcorefscript @{@%
@< start of module-script @(m4_evcorefdir@) @>
RESOURCESDIR=$MODDIR/resources
JARFILE=\$jarsdir/m4_evcorefjar

if
  [  "$naflang" == 'nl' ] 
then
  lang_resource="odwn_orbn_gwg-LMF_1.3.xml"
else
  lang_resource="wneng-30.lmf.xml.xpos"
fi

JAVAMODULE=eu.newsreader.eventcoreference.naf.EventCorefWordnetSim
JAVAOPTIONS="--method leacock-chodorow"
@% JAVAOPTIONS="$JAVAOPTIONS  --wn-lmf $RESOURCESDIR/cornetto2.1.lmf.xml"
JAVAOPTIONS="$JAVAOPTIONS  --wn-lmf $RESOURCESDIR/$lang_resource"
JAVAOPTIONS="$JAVAOPTIONS  --sim 2.0"
JAVAOPTIONS="$JAVAOPTIONS  --wsd 0.8"
JAVAOPTIONS="$JAVAOPTIONS  --relations XPOS_NEAR_SYNONYM#HAS_HYPERONYM#HAS_XPOS_HYPERONYM#event"
@%JAVAOPTIONS="$JAVAOPTIONS  --relations has_hyperonym#event#has_hypernym"

@% #### Within document event coreference wordnet sim
@% #rootDir=/home/newsreader/components/VUA-eventcoref.v21/
@% rootDir=/Tools/nwr-dutch-pipeline/vua-eventcoreference_v2/

java -Xmx812m -cp \$JARFILE \$JAVAMODULE  $JAVAOPTIONS

@% java -Xmx812m -cp "$rootDir/lib/m4_evcorefjar" \$JAVAMODULE  --method leacock-chodorow --wn-lmf "$rootDir/resources/cornetto2.1.lmf.xml" --sim 2.0 —relations XPOS_NEAR_SYNONYM#HAS_HYPERONYM#HAS_XPOS_HYPERONYM
@| @}

@% #### Within document event coreference wordnet sim
@% 
@% rootDir=/home/newsreader/components/VUA-eventcoref.v30/
@% java -Xmx2000m -cp "$rootDir/lib/EventCoreference-1.0-SNAPSHOT-jar-with-dependencies.jar" eu.newsreader.eventcoreference.naf.EventCorefWordnetSim --method leacock-chodorow --wn-lmf "$rootDir/resources/wneng-30.lmf.xml.xpos" --sim 2.5 --sim-ont 0.6 --wsd 0.8 --wn-prefix eng --relations has_hyperonym#event#has_hypernym  --source-frames "$rootDir/resources/source.txt" --distance 4
@% 

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
@< start of module-script @(m4_dbpnerdir@) @>
cat | iconv -f ISO8859-1 -t UTF-8 | $MODDIR/dbpedia_ner.py -url http://$spotlighthost:<!!>m4_spotlight_nl_port<!!>/rest/candidates
@| @}


\subsubsection{Opinion miner}
\label{sec:opinimin}

Get \verb|opinion-miner_deluxePP| from Github. 

@% To run the opinion-miner, the following things are needed:
@% 
@% \begin{itemize}
@% \item SVMlight
@% \item crfsuite
@% \item vua-pylib
@% \end{itemize}

\paragraph{Module}

Install the module from Github.

@d install the opinion-miner @{@%
MODNAM=m4_opininame
DIRN=m4_opininame
GITU=m4_opinigit
GITC=m4_opini_commitname
@< install from github @>
@| @}

The module contains a script \verb|install_me.sh| that we will follow
here. First install the CRF module that comes with the opinion-miner:


@d install the opinion-miner @{@%
moduledir=$modulesdir/m4_opinidir
#Install CRF++
crfdir=`mktemp -d -t crf.XXXXXX`
cd $crfdir
@% tar xvzf CRF++-0.58.tar.gz
tar xzf $moduledir/crf_lib/CRF++-0.58.tar.gz
cd CRF++-0.58
./configure --prefix=$envdir
make
make install
echo "PATH_TO_CRF_TEST='$envbindir/crf_test'" > $moduledir/path_crf.py
cd $moduledir
rm -rf $crfdir
@| @}


Next, download the trained models. 

@d install the opinion-miner @{@%
##Download the models
echo Downloading the trained models.
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_opimodelball
@| @}


@% The module can be cloned from Github. However, currently there are
@% problems with the Github installation. Therefore we borrow the opinion
@% miner from the English \textsc{nwr} pipeline.
@% 
@% @d install the opinion-miner @{@%
@% @% @< get or have @(m4_opini_temp_ball@) @>
@% cd m4_amoddir
@% tar -xzf m4_asocket/m4_snapshotdirectory/m4_opini_temp_ball
@% @| @}
@% 
@% The opinion-miner needs a configuration file that is located in the
@% directory where the model-data resides. In this pipeline we will use
@% model-data derived from news-articles. An alternative model, derived
@% from hotel evaluations can also be used. Put the configuration file in
@% the \texttt{etc} subdir and copy it to its proper location during the
@% installation of the opinion-miner.
@% 
@% @o m4_envetcdir/m4_opini_conf @{@%
@% [general]
@% output_folder = m4_amoddir/m4_opinidir/final_models/ennl/news_cfg1
@% 
@% [crfsuite]
@% path_to_binary = m4_aenvbindir/crfsuite
@% 
@% [svmlight]
@% path_to_binary_learn = m4_aenvbindir/svm_learn
@% path_to_binary_classify = m4_aenvbindir/svm_classify
@% @| @}
@% 
@% @d install the opinion-miner @{@%
@% cd m4_opinidir
@% cat m4_aenvetcdir/m4_opini_conf | \
@%   sed s/ennl/nl/g > \$modulesdir/m4_opinidir/m4_opini_dutchmodel_subdir/config.cfg
@% cat m4_aenvetcdir/m4_opini_conf | \
@%   sed s/ennl/en/g > \$modulesdir/m4_opinidir/m4_opini_engmodel_subdir/config.cfg
@% @| @}



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
@< start of module-script @(m4_opinidir@) @>
cd $MODDIR
python tag_file.py -d hotel
@| @}


@% @o m4_bindir/m4_opiniscript @{@%
@% @< start of module-script @(m4_opinidir@) @>
@% cd $MODDIR
@% export PATH=$PATH:.
@% if
@%  [ "\$naflang" == "nl" ]
@% then
@%  modelconf=\$MODDIR/final_models/nl/news_cfg1
@% else
@%  modelconf=\$MODDIR/final_models/en/news_cfg1
@% fi
@% python classify_kaf_naf_file.py -m $modelconf
@% @| @}

@% @o m4_bindir/m4_opiniscript @{@%
@% #!/bin/bash
@% source m4_aenvbindir/progenv
@% cd m4_amoddir/m4_opinidir
@% python classify_kaf_naf_file.py m4_aenvetcdir/m4_opini_nl_conf
@% @| @}


\section{Utilities}
\label{sec:utilities}


@% The following script, \verb|test|, pushes a test-document through the modules of
@% the pipeline. if provided with an argument ``nl'' or ``en'', it
@% obtains a standard test-document in the appropriate language and puts
@% it in \verb|test/test.in.naf| (Let us call this file \verb|TESTIN|). Otherwise, it expects to find file
@% \verb|test/test.in.naf|.
@% 
@% @% @d get a testfile or die @{@%
@% @% if 
@% @%   [ "$1" == "en" ]
@% @% then
@% @%   cp \$ROOT/nuweb/test.en.in.naf \$TESTIN
@% @% else
@% @%   if
@% @%     [ "\$1" == "nl" ]
@% @%   then
@% @%     cp \$ROOT/nuweb/test.nl.in.naf \$TESTIN
@% @%   fi
@% @% fi
@% @% if
@% @%   [ ! -e \$TESTIN ]
@% @% then
@% @%   echo "Please supply test-file \$TESTIN or specify language"
@% @%   exit 4
@% @% fi
@% @% @| @}
@% 
@% @o m4_bindir/test @{@%
@% #!/bin/bash
@% ROOT=m4_aprojroot
@% BIND=$ROOT/bin
@% TESTDIR=$ROOT/test
@% TESTIN=$ROOT/test/test.in.naf
@% mkdir -p $TESTDIR
@% @< function to run a module in the test @>
@% @< get a testfile or die @>
@% cd $TESTDIR
@% @< set the language variable @($TESTIN@)@>
@% @< select language-dependent features @>
@% @< find a spotlightserver or exit @>
@% if
@%  [ "\$naflang" == "nl" ]
@% then
@% @%    @< annotate dutch document @>
@% @%   cat \$TESTIN    | \$BIND/tok                    > tok.naf
@% runmodule \$TESTIN    tok                     tok.naf
@% runmodule tok.naf     mor                     mor.naf
@% runmodule mor.naf     nerc                    nerc.naf
@% runmodule nerc.naf    wsd                     wsd.naf
@% runmodule wsd.naf     ned                     ned.naf
@% runmodule ned.naf     heideltime              times.naf
@% runmodule times.naf   onto                    onto.naf
@% runmodule onto.naf    srl                     srl.naf
@% runmodule srl.naf     m4_nomeventscript       nomev.naf
@% runmodule nomev.naf   srl-dutch-nominals      psrl.naf
@% runmodule psrl.naf    m4_framesrlscript       fsrl.naf
@% runmodule fsrl.naf    m4_opiniscript          opin.naf
@% runmodule opin.naf    m4_evcorefscript        out.naf
@% else
@%   @< annotate english document @>
@% fi
@% @| @}



@% The following function, runmodule, applies a module on a naf
@% file. When the module results in error, the function  exits the script
@% with the error code of the failing module. 
@% 
@% @d function to run a module in the test @{@%
@% function runmodule {
@%   local infile=$1
@%   local modulecommand=\$BIND/$2
@%   local outfile=$3
@%   if
@%     [ $moduleresult -eq 0 ]
@%   then
@%     cat $infile | $modulecommand > $outfile
@%     moduleresult=$?
@%     if
@%       [ $moduleresult -gt 0 ]
@%     then
@%       failmodule=$modulecommand
@%        echo "Failed: module $modulecommand; result $moduleresult" >&2
@%        exit $moduleresult
@%     else
@%        echo "Completed: module $modulecommand; result $moduleresult" >&2
@%     fi
@%   fi  
@% }
@% @| @}
@% 
@% Initialize the variable \verb|moduleresult|:
@% 
@% @d function to run a module in the test @{@%
@% export moduleresult=0
@% @| moduleresult @}



@% Correct sequence of the modules in the Dutch pipeline:
@% 
@% \begin{itemize}
@% \item tok
@% \item mor
@% \item nerc
@% \item wsd
@% \item ned
@% \item heidel
@% \item onto (\verb|predicate-matrix-tagger.sh| uit \verb|vua-ontotagger-v1.0|)
@% \item srl
@% \item Nominal event detectie
@% \item vua-srl-extra
@% \item framesrl (\verb|srl-framenet-tagger.sh| uit \verb|vua-ontotagger-v1.0|)
@% \item opinion mining
@% \item ecrf
@% \end{itemize}

\subsection{Run-script and test-script}
\label{sec:runscript}

The script \verb|nlpp| reads a \NAF{} document from standard in and
produces an annotated \NAF{} on standard out. The script \verb|test| 
annotates either a test-document that resides in the nuweb directory
or a user-provided document and
leaves the intermediate results in its working directory
\verb|nlpp/test|, so that, in case of problems, it is easy traceable what went wrong.

The annotion process involves a sequence in which an \NLP{} module reads
a file that contains
the output from a previous module (or the input \NAF{} file),
processes it and writes the result in another file.

The following function, \verb|runmodule|, performs the action of a
single module in the sequence. It needs
three arguments: 1) the name of the \NAF{} file that the previous module
produced or the input file; 2) the name of thje script that runs the module and 3) the name of the
output \NAF{}.

The function uses variable \verb|moduleresult| to decide
whether it is really going to annotate. If this variable is "false"
(i.e., not equal to zero), this means that one of the previous
modules failed, and it is of no use to process the input file. In that
case, the function leaves \verb|moderesult| as it is and does not
process the input-file. Otherwise, it will process the input-file and it
sets \verb|moduleresult| to the result of the processing module.

@d function to run a module @{@%
export moduleresult=0

function runmodule {
  local infile=$1
  local modulecommand=\$BIND/$2
  local outfile=$3
  if
    [ $moduleresult -eq 0 ]
  then
    cat $infile | $modulecommand > $outfile
    moduleresult=$?
    if
      [ $moduleresult -gt 0 ]
    then
      failmodule=$modulecommand
      echo "Failed: module $modulecommand; result $moduleresult" >&2
      exit $moduleresult
    else
       echo "Completed: module $modulecommand; result $moduleresult" >&2
    fi
  fi  
}

@| moduleresult runmodule BIND @}

\textbf{Note:} that variable \verb|BIND| has to be defined prior to
using this function.
 
Use the function to annotate a \NAF{} file that \verb|infile| points
to and write the result in a file that  \verb|outfile| points to:

@d annotate dutch document @{@%
runmodule \$infile    tok                     tok.naf
runmodule tok.naf     mor                     mor.naf
runmodule mor.naf     nerc                    nerc.naf
runmodule nerc.naf    wsd                     wsd.naf
runmodule wsd.naf     ned                     ned.naf
runmodule ned.naf     heideltime              times.naf
runmodule times.naf   onto                    onto.naf
runmodule onto.naf    srl                     srl.naf
runmodule srl.naf     m4_nomeventscript       nomev.naf
runmodule nomev.naf   srl-dutch-nominals      psrl.naf
runmodule psrl.naf    m4_framesrlscript       fsrl.naf
runmodule fsrl.naf    m4_opiniscript          opin.naf
runmodule opin.naf    m4_evcorefscript        \$outfile
@| @}

Similar for an English naf:

@d annotate english document @{@%
  runmodule \$infile    tok                     tok.naf
  runmodule tok.naf     topic                   top.naf
  runmodule top.naf     pos                     pos.naf
  runmodule pos.naf     constpars               consp.naf
  runmodule consp.naf   nerc                    nerc.naf
  runmodule nerc.naf    ned                     ned.naf
  runmodule ned.naf     nedrer                  nedr.naf
  runmodule nedr.naf    wikify                  wikif.naf
  runmodule wikif.naf   ukb                     ukb.naf
  runmodule ukb.naf     ewsd                    ewsd.naf
  runmodule ewsd.naf    coreference-base        coref.naf
  runmodule coref.naf   eSRL                    esrl.naf
  runmodule esrl.naf    FBK-time                time.naf
  runmodule time.naf    FBK-temprel             trel.naf
  runmodule trel.naf    FBK-causalrel           crel.naf
  runmodule crel.naf    evcoref                 ecrf.naf
  runmodule ecrf.naf    factuality              fact.naf
  runmodule fact.naf    m4_opiniscript          \$outfile
@| @}

Determine the language and select one of the above macro's to annotate
the document. In fact, consider the document as an English document unless \verb|naflang| is ``nl''


@% Set variable \verb|naflang| to the language of the input-document:
@% 
@% @d set the language variable @{@%
@% naflang=`cat \$infile | m4_aenvbindir/langdetect.py`
@% export naflang
@% @| naflang @}


@d annotate @{@%
naflang=`cat \$infile | m4_aenvbindir/langdetect.py`
export naflang
if
 [ "\$naflang" == "nl" ]
then
@%    @< annotate dutch document @>
@%   cat \$TESTIN    | \$BIND/tok                    > tok.naf
runmodule \$infile    tok                     tok.naf
runmodule tok.naf     mor                     mor.naf
runmodule mor.naf     nerc                    nerc.naf
runmodule nerc.naf    wsd                     wsd.naf
runmodule wsd.naf     ned                     ned.naf
runmodule ned.naf     heideltime              times.naf
runmodule times.naf   onto                    onto.naf
runmodule onto.naf    srl                     srl.naf
runmodule srl.naf     m4_nomeventscript       nomev.naf
runmodule nomev.naf   srl-dutch-nominals      psrl.naf
runmodule psrl.naf    m4_framesrlscript       fsrl.naf
runmodule fsrl.naf    m4_opiniscript          opin.naf
runmodule opin.naf    m4_evcorefscript        \$outfile
else
  @< annotate english document @>
fi
@| naflang @}

Use the above ``annotate'' macro in a test script and in a run
script. The scripts set a working directory and put the input-file in
it, and then annotate it. 

The test-script uses a special test-directory and leaves it behind when
it is finished. If the user specified a language, the script copies a
\NAF{} testfile from the nuweb directory as input-file. Otherwise, the script
expexts the test-directory to be present, with an input-file (named
\verb|in.naf|) in it.

@d get a testfile or die @{@%
cd $workdir
if 
  [ "\$1" == "en" ]
then
  cp \$ROOT/nuweb/test.en.in.naf \$infile
else
  if
    [ "\$1" == "nl" ]
  then
    cp \$ROOT/nuweb/test.nl.in.naf  \$infile
  fi
fi
if
  [ ! -e \$infile ]
then
  echo "Please supply test-file \$workdir/\$infile or specify language"
  exit 4
fi
@| @}

This is the test-script:

@o m4_bindir/test @{@%
#!/bin/bash
oldd=`pwd`
@< set variables for test/run script @>
workdir=$piperoot/test
mkdir -p $workdir
cd \$workdir
@< get a testfile or die @>
@< function to run a module @>
@< annotate @>
if
  [ \$moduleresult -eq 0 ]
then
  echo Test succeeded.
else
  echo Something went wrong.
fi
exit \$moduleresult
@| @}

The run-script \verb|nlpp| reads a ``raw'' naf from standard in and
produces an annotated naf on standard out. It creates a temporary
directory to store intermediate results from the modules and removes this directory afterwards.

@o m4_bindir/nlpp @{@%
#!/bin/bash
oldd=`pwd`
@< set variables for test/run script @>
workdir=`mktemp -d -t nlpp.XXXXXX`
cd $workdir
cat >$workdir/$infile
@< function to run a module @>
@< annotate @>
if
  [ \$moduleresult -eq 0 ]
then
  cat \$outfile
fi
cd \$oldd
rm -rf $workdir
exit \$moduleresult
@| @}

@d set variables for test/run script @{@%
ROOT=m4_aprojroot
source m4_aenvbindir/progenv
BIND=$pipebin
infile=in.naf
outfile=out.naf
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

The default is, to install nlpp.

@% @d all targets @{m4_progname.pdf@}
 @d all targets @{install@}

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


\subsection{Perform the installation}
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

The target ``sources'' unpacks the nuweb file and creates the program
scripts, i.e. the scripts that will apply modules on a \NAF{} file and
the script \verb|install_modules| that installs the modules themselves
and that creates the software environment the the modules need. 

@d make targets @{@%
sources : m4_progname.w \$(DIRS) \$(NUWEB)
@%	cp ./createdirs m4_bindir/createdirs
@%	cd m4_bindir && chmod 775 createdirs
@%	m4_bindir/createdirs
	\$(NUWEB) m4_progname.w
	@< make scripts executable @>

@| @}

The ``install'' target performs the complete installation.

@d make targets @{@%
install : sources
	../bin/m4_module_installer

@|install @}

\subsection{Test whether it works}
\label{sec:test}


The targets testnl and testen perform the test-script
(section~\ref{sec:testscript}) to test the dutch resp. english pipeline.

@d make targets @{@%

testnl : install test.nl.in.naf
	rm -rf ../test
	mkdir ../test
	cd ../test && ../bin/test nl

testen : install test.en.in.naf
	rm -rf ../test
	mkdir ../test
	cd ../test && ../bin/test en


@| testnl testen @}
  




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
