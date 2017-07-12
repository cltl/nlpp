m4_include(inst.m4)m4_dnl
m4_sinclude(../../local.m4)m4_dnl
\documentclass[twoside,oldtoc]{artikel3}
@% \documentclass[twoside]{article}
\pagestyle{headings}
\usepackage{pdfswitch}
\usepackage{figlatex}
\usepackage{makeidx}
\usepackage{xstring}
\usepackage{pdflscape}
\usepackage{afterpage}
\usepackage{capt-of}% or use the larger `caption` package
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
\newcommand{\NLPP}{\textsc{nlpp}}
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
  This is a description and documentation of the installation of the
  Newsreader-pipeline~\footnote{\url{http://www.newsreader-project.eu/files/2012/12/NWR-D4-2-2.pdf}}. 
  It is an instrument to annotate Dutch or English documents with
  \NLP{} tags. The documents have to be stored in \emph{Newsreader
    Annotation Format} (\NAF{}~\cite{agerri15:_event_deliv_d4}).
\end{abstract}
\tableofcontents
\section{Introduction}
\label{sec:Introduction}

This document describes the installation of a pipeline that annotates
texts in order to extract knowledge. The pipeline has been set
up as part
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

The installed pipeline is bi-lingual. It is capable to annotate Dutch and
English texts. It recognizes the language from the ``lang'' attribute
of the \verb|NAF| element of the document. Some of the modules are
specific for a single language, other modules support both
languages. s a result, there must be two pathways to lead a document
through the pipeline, one for English and one for Dutch.

The pipeline is a concatenation of independent software modules, each
of which reads a \NAF{} document from  standard input and produces
another \NAF{} document on standard output. 

The aim is, to install the pipeline from open-source modules that can
e.g. be obtained from Github. However, that aim is only partially
fulfilled. Some of the modules still contain elements that are not
open-source ot data that are not freely available. Because of lack of
time, the current version of the installer installs the English
pipeline from a frozen repository of the Newsreader Project.

The \NLPP{} pipeline can be seen as contructed in three parts: 1) The
software that is needed to run the pipeline, e.g.{} compilers and
interpreters; 2) the modules themselves and 3) scripts to to make the
modules operate on a document.


\subsection{Modules of the pipeline}
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
\newcommand{\brevcomm}[1]{\StrLeft{#1}{4}\ldots}
@%\newcommand{\ghtail}[1]{\StrDel{#1}{https://github.com}}
@%\newcommand{\brevgh}[1]{\def\aap{#1}\href{\aap}{Github: \alltt{\ghtail{\aap}}}}

\afterpage{%
  \clearpage% Flush earlier floats (otherwise order might not be correct)
  \thispagestyle{empty}% empty page style (?)
  \begin{landscape}% Landscape page
@% %\begin{table}[hbtp]
    \centering
    \begin{footnotesize}
      \begin{tabular}{lllllll}
        \textbf{Module}            & \textbf{Source}                 & \textbf{Resources } & \textbf{Section} & \textbf{Commit}                    & \textbf{Script}                       & \textbf{language} \\
         Tokenizer                 & \href{m4_tokenizergit}{Github}  & Java                & \dref{sec:installtokenizer}    & \brevcomm{m4_tokenizer_commitname} & \texttt{m4_tokenizerscript}                  & en/nl  \\
         Topic detection           & \href{m4_topictoolgit}{Github}  & Java                & \dref{sec:topic-install}       & \brevcomm{m4_topic_commitname}     & \texttt{m4_underslas(m4_topicscript)}        & en/nl  \\
         Morpho-syntactic parser   & \href{m4_morphpargit}{Github}   & Python, Alpino      & \dref{sec:install-morphsynt-parser}  & \brevcomm{m4_morphpar_commitname}  & \texttt{m4_underslas(m4_morparscript)}     & nl     \\
         \textsc{pos}-tagger       & snapshot                        &                     & \dref{sec:postagger}                 &  \ldots                            & \texttt{m4_underslas(m4_postagscript)}       & en     \\
         Named-entity rec/class    & \href{m4_nercgit}{Github}       &                     & \dref{sec:nerc}                      & \brevcomm{m4_nerc_commitname}      & \texttt{m4_underslas(m4_nercscript)}         & en/nl  \\
         Dark-entity relinker      & \href{m4_delinkgit}{Github}     &                     & \dref{sec:derelink}                  & \brevcomm{m4_delink_commitname}    & \texttt{m4_underslas(m4_nercscript)}         & en/nl  \\
         Constituent parser        & snapshot                        &                     & \dref{sec:constparser}               &  \ldots                            & \texttt{m4_underslas(m4_consparscript)}      & en     \\
         Word-sense disamb. nl     & \href{m4_wsdgit}{Github}        &                     & \dref{sec:wsd}                       & \brevcomm{m4_wsd_commitname}       & \texttt{m4_underslas(wsd)}                   & nl     \\
         Word-sense disamb. en     & snapshot                        &                     & \dref{sec:IMS-WSD}                   &  \ldots                            & \texttt{m4_underslas(ewsd)}                  & en     \\
         Named entity/DBP          & snapshot                        &                     & \dref{sec:ned-module}                &  \ldots                            & \texttt{m4_underslas(ned)}                   & en/nl  \\
         NED reranker              & snapshot                        &                     & \dref{sec:nedrer}                    &  \ldots                            & \texttt{m4_underslas(nedrerscript)}          & en     \\
         Wikify                    & snapshot                        &                     & \dref{sec:wikify}                    &  \ldots                            & \texttt{m4_underslas(m4_wikifyscript)}       & en     \\
         \UKB{}                    & snapshot                        &                     & \dref{sec:ukb}                       &  \ldots                            & \texttt{m4_underslas(m4_ukbscript)}          & en     \\
         Coreference-base          & snapshot                        &                     & \dref{sec:nomcorefgraph}             &  \ldots                            & \texttt{m4_underslas(m4_corefbasescript)}    & en     \\
         Heideltime                & \href{m4_heidelgit}{Github}     &                     & \dref{sec:heideltime}                & \brevcomm{m4_heidel_commitname}    & \texttt{m4_underslas(m4_heidelscript)}       & nl     \\
         Onto-tagger               & \href{m4_ontogit}{Github}       &                     & \dref{sec:onto}                      & \brevcomm{m4_ontocommitname}       & \texttt{m4_underslas(m4_ontoscript)}         & nl     \\
         Semantic Role labeling nl & \href{m4_srlgit}{Github}        &                     & \dref{sec:SRL-module}                & \brevcomm{m4_srl_commitname}       & \texttt{m4_underslas(m4_srlscript)}          & nl     \\
         Semantic Role labeling en & snapshot                        &                     & \dref{sec:srlserver}                 &  \ldots                            & \texttt{m4_underslas(m4_esrlscript)}         & en     \\
         Nominal Event ann.        & \href{m4_ontogit}{Github}       &                     & \dref{sec:onto}                      & \brevcomm{m4_ontocommitname}       & \texttt{m4_underslas(m4_nomeventscript)}     & nl     \\
         SRL dutch nominals        & \href{m4_srl_dn_git}{Github}    &                     & \dref{sec:srl-dn}                    & \brevcomm{m4_srl_dn_commitname}    & \texttt{m4_underslas(m4_srl_dn_script)}      & nl     \\
         Framenet-SRL              & \href{m4_ontogit}{Github}       &                     & \dref{sec:onto}                      & \brevcomm{m4_ontocommitname}       & \texttt{m4_underslas(m4_framesrlscript)}     & nl     \\
         FBK-time                  & snapshot                        &                     & \dref{sec:fbktime}                   & \ldots                             & \texttt{m4_underslas(m4_fbktimescript)}      & en     \\
         FBK-temprel               & snapshot                        &                     & \dref{sec:FBK-temprel}               & \ldots                             & \texttt{m4_underslas(m4_fbktemprelscript)}   & en     \\
         FBK-causalrel             & snapshot                        &                     & \dref{sec:FBK-causalrel}             & \ldots                             & \texttt{m4_underslas(m4_fbkcausalrelscript)} & en     \\
         Opinion-miner             & \href{m4_opinigit}{Github}      &                     & \dref{sec:opinimin}                  & \brevcomm{m4_opini_commitname}     & \texttt{m4_underslas(m4_opiniscript)}        & en/nl  \\
         Event-coref               & \href{m4_evcorefgit}{Github}    &                     & \dref{sec:eventcoref}                & \brevcomm{m4_evcorefcommit}        & \texttt{m4_underslas(m4_evcorefscript)}      & en/nl  \\
         Factuality tagger     & \href{m4_en_factualitygit}{Github}  &                     & \dref{sec:factuality}                & \brevcomm{m4_en_factualitycommit}  & \texttt{m4_underslas(m4_factualityscript)}   & en     \\
         Factuality tagger     & \href{m4_nl_factualitygit}{Github}  &                     & \dref{sec:factuality}                & \brevcomm{m4_nl_factualitycommit}  & \texttt{m4_underslas(m4_factualityscript)}   & nl     \\
       \end{tabular}
    \end{footnotesize}
@% %   \caption{List of the modules to be installed. Column description:
@% %     \textbf{directory:} Name of the subdirectory below subdirectory \texttt{modules} in
@% %     which it is installed; \textbf{source:} From where the module has
@% %     been obtained; \textbf{commit:} Commit-name or version-tag \textbf{script:} Script to be included in a pipeline. \textbf{Note:} The tokenizer module has been temporarily obtained from the snapshot, because the commit that we used has disappeared from the Github repository.}
@% %   \label{tab:modulelist}
    \captionof{table}{%
      \label{tab:modulelist}
      List of the modules to be installed. Column description:
      \textbf{directory:} Name of the subdirectory below subdirectory \texttt{modules} in
      which it is installed; \textbf{source:} From where the module has
      been obtained; \textbf{commit:} Commit-name or version-tag
      \textbf{script:} Script to be included in a
      pipeline. % \textbf{Note:} The tokenizer module has been
 %      temporarily obtained from the snapshot, because the commit
 %      that we used has disappeared from the Github repository.
}
@% %\end{table}
  \end{landscape}
  \clearpage% Flush page
@% }
}


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
Table~\ref{tab:modulelist}
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
  \caption{List of the utilities to be installed. Column description:
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

@% \subsection{The things that are not open-source yet}
@% \label{sec:non-open}
@% 
@% The aim is, that the pipeline-system is completely open-sourced, so
@% that anybody can install it from sources like Github. Howver, a lot of
@% elements are not yet open-sourced, but need private kludges. The
@% following is a list of not-yet open things.
@% 
@% 
@% \subsection{Multi-linguality}
@% \label{sec:multiling}
@% 
@% This version of the pipeline is multi-lingual, i.e. it can annotate
@% Dutch as well as English documents. It finds the language of the
@% document in the \verb|language| attribute of the \verb|NAF|
@% element. Actually, the current version is bi-lingual, because it is
@% only able to process Dutch or English documents.

\subsection{Reproducibility}
\label{sec:reproducibility}

An important goal of this pipeline is, to achieve reproducibility. It
mean, that at some point in the future the annotation could be re-done
on the document and it should produce a result that is identical as
the result of the original annotation. In our casem reproducibility
ivolves the following aspects:

\begin{itemize}
\item The annotated document ought to contain documentation about the
  annotation process: What modules have been applied, what was the
  version of the software of each module, Which resources have been
  used and what was the version of the resources.
\item The source code of the modules as well as resources like
  data-sets and programming languages should be available from open repository.
\item The repositories of the resources should use some versioning
  system enabling to re-use the version that has been used originally.
\end{itemize}

A problem in some cases is, that we need to use utilities that are
supplied by external parties, and we do not have control about their
methods of publication and version management. Examples of such
utilities are the compilers for programming languages like Java,
Python and parsers like Alpino.

Therefore, we have the following policy to achieve reproducibility:

\begin{itemize}
\item Each of the modules writes in the output NAF its own version,
  and details about the used resources in sufficient detail to enable
  re-processing.
\item It is assumed that when a programming language (e.g. Java,
  Python) is used, annotion can be reproducible when the major
  versions coincide.
\item A script is constructed that reproducibly builds an environment
  for the pipeline on some software/hardware platform (e.g. Linux on
  X64 CPU), using utilities that have been stored in some non-open
  repository (to preclude copyright-problems). 
\end{itemize}






@% Ideally, we would like to be able to reproduce theset-up of NLPP,
@% i.e., to be able to set up an identical pipeline at some point in
@% future. That means, that we must download the same version of each
@% module as we used originally. The same goes for the utilities like
@% programming languages. However, it is not easy to obtain ancient
@% versions of the components. 


\section{Structure of the pipeline}
\label{sec:Structure}

The finished pipeline consists of:
\begin{itemize}
\item A directory that contains for each module an directory with the module in installed form.
\item A script that reads an input naf file or plain text file from standard in and produces an annotated \NAF{} file on standard out.
\item A script that must be ``sourced'' in order to find the resources that the modules need to find. 
\end{itemize}

The directory with the modules must be relocatable and immutable. That
means that scripts in modules do not have write permissions on the
module directory and that they have to find other files on
path-descriptions relative to the current path of the script itself.

\subsection{Expected resources}
\label{sec:expected_resources}

In order to run the modules expect the following:

\begin{itemize}
\item Instruction ~java~ invokes Java 1.8;
\item Instruction ~python~ invokes Python 3.6;
\item Instruction ~Perl~ invokes Perl 5;
\item Variable ~TMPDIR~ points to a user-writable directory.
\end{itemize}


\section{Construct the  infra-structure}
\label{sec:construct-infrastructure}

In this section we will generate a script that set up an infra-structure in which the
pipeline can be exploited. An attempt is made to make as little as possible
presumptions about the services that the host provides.

We need to set up the following:

\begin{itemize}
\item Java Version 1.8
\item Maven (Gradle?)
\item Python version 3.6
\item Python packages
\item Autoconf
\item \ldots
\end{itemize}

Let us generate a script to do the work:

@o m4_envbindir/make_infrastructure @{@%
#!/bin/bash
@<  get location of the script @(DIR@)@>
cd $DIR
source ../../progenv
@< init make\_infrastructure @>
@< set up Java @>
@< set up Maven @>
@< set up Python @>
@< set up autoconf @>
@% @< set up Perl @>
@< install Perl @>
@< install shared libs @>
@< install Alpino @>
@< install the Spotlight server @>
@< install the treetagger utility @>
@< install svmlib @>
@< install boost @>

@| @}

@d make scripts executable @{@%
chmod 775  m4_envbindir/make_infrastructure
@| @}



Let us also make a script that cleans up the infra-structure after the
installation.

@o m4_envbindir/clean_infrastructure @{@%
#!/bin/bash
@<  get location of the script @(DIR@)@>
cd $DIR
source ../../progenv
@< init make\_infrastructure @>
@< clean up after installation @>
@| @}

@d make scripts executable @{@%
chmod 775  m4_envbindir/clean_infrastructure
@| @}



Before we begin, we can try whether commands that we need to use
actually exist and stop execution otherwise.

@d test presence of command @{@%
which @1 >/dev/null
if
  [ $? -ne 0 ]
then
  echo "Please install @1"
  exit 4
fi 
@| @}

@d init make\_infrastructure @{@%
@< test presence of command @(git@) @>
@< test presence of command @(tar@) @>
@< test presence of command @(unzip@) @>
@< test presence of command @(tcsh@) @>
@< test presence of command @(hg@) @>

@| @}


\subsection{File-structure}
\label{sec:filestructure}

Let us set up the pipeline in a directory-structure that looks like  figure~\ref{fig:directorystructure}. %
\begin{figure}[hbtp]
  \centering
%  \includegraphics{directorystructure.pdf}
   \input{directorystructure.pdftex_t}
  \caption{Directory-structure of the pipeline (see text). }
  \label{fig:directorystructure}
\end{figure}%
The directories have the following functions.

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


It would be great if an installed pipeline could be moved to another
directory while it would keep working. We are not yet sure whether this is
possible. However, a minimum condition for this to work would be, that
the location of the pipeline can be determined at run-time. To achieve
this, let us place a script in the root-directory of the pipeline,
that can find in run-time the absolute path to itself and that generates
variables that point to the other directories.


@o m4_projroot/progenv @{@%
# Source this script
@< get location of the script @(piperoot@) @>
@< set variables that point to the directory-structure @>
@< set environment parameters @>
if
  [ -e "\$piperoot/progenvv" ]
then
  source \$piperoot/progenvv
fi
export progenvset=0
@| @}

@d set environment parameters @{@%
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
@| @}



The full path to the sourced script can be found in variable \verb|BASH_SOURCE[0]|.

@d find the nlpp root directory @{@%
piperoot="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
@% full_path_to_sourcescript=\${BASH_SOURCE[@@]}
@%piperoot=\$(dirname "\${full_path_to_sourcescript}")
@% piperoot=\$(dirname "\${bin_directory}")
@| piperoot @}

Once we know \verb|piperoot|, we know the path to the other
directories of figure~\ref{fig:directorystructure}.

@d set variables that point to the directory-structure @{@%
@% if 
@%   [ "$piperoot" == "" ]
@% then
@%   export piperoot=m4_aprojroot
@% fi
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

Include a ``snapshot'' directory that contains non-open materials.

@d set variables that point to the directory-structure @{@%
export snapshotdir=\$pipesocket/v4.0.0.0_nlpp_resources
@| @}



Add the environment \verb|bin| directory to \verb|PATH|:

@d set variables that point to the directory-structure @{@%
export PATH=\$envbindir:\$pipebin:$PATH
@| PATH @}



\subsection{Download resources}
\label{sec:download}

To enhance speed of the installation we start to download all
resources that we can download at the beginning of the installation in
a single blow as parallel processes. We park the
resources in a directory \verb|m4_snapshotdirectory|, located in the
directory where the root of \NLPP{} also resides.

@d init make\_infrastructure @{@%
@< download everything @>
wait
@| @}


Hopefully there will be little to download.

Synchronize with a non-open snapshot-directory if possible. It is
only possible if a valid \verb|ssh| key resides in file \verb|nrkey|
in the directory in which the nlpp root directory resides.

@d download everything @{@%
 mkdir -p \$pipesocket/m4_snapshotdirectory
if
  [ -e m4_snapshotkeyfile ]
then
  cd $pipesocket
@% rsync -e "ssh -i \$HOME/m4_snapshotkeyfilename" -rLt m4_snapshotrootURL:m4_snapshotdirectory .
  ( rsync -e "ssh -i m4_snapshotkeyfile" -rLt m4_snapshotrootURL:m4_snapshotdirectory . ) &
fi

@| @}

Download other stuff using \verb|wget|. The following macro downloads
a resource into the snapshot-directory if it is not already there.

@d need to wget @{@%
if
  [ ! -e $pipesocket/m4_snapshotdirectory/@1 ]
then
  cd $pipesocket/m4_snapshotdirectory
  ( wget @2 ) &
fi
@| @}

\subsection{Java}
\label{sec:Java}

We need to have a Java JDK version 1.8 installed. In other words, when
we issue the instruction \verb|javac -version| within the pipeline
environment, the response must be something like
\verb|javac 1.8.0_131|. We assume that if we find a correct Java 1.8,
there will also be a proper \verb|java|. Let us first test whether
that is the case. If it is not the case, we can install java if a
proper tarball is present in the ``snaphot directory''.

Let us perform the two tests:

Do we have a proper Java?

@d check presence of javac in m4_javaversion @{@%
javac -version 2>&1 | grep 1.8 >/dev/null
if
  [ $? == 0 ]
then
  @1="True"
else
  @1="False"
fi
@| @}

Do we have a tarball to install Java? (in fact, the following macro
can be used to check the presence of any tarball in the snapshot directory).

@d check whether a tarball is present in the snapshot @{@%
if 
  [ -e \$pipesocket/<!!>m4_snapshotdirectory<!!>/@1 ]
then
  @2="True"
else
  @2="False"
fi
@| @}

Now do it:

@d set up Java @{@%
@< check presence of javac in m4_javaversion @(java_OK@) @>
if
  [ ! "\$java_OK" == "True" ]
then
  @< check whether a tarball is present in the snapshot @(m4_javatarball@,tarball_present@) @>
  if
    [ ! "\$tarball_present" == "True" ]
  then
    echo "Please install Java 1.8 JDK"
    exit 4
  fi
  mkdir -p $javadir
  cd $javadir
  tar -xzf $pipesocket/m4_snapshotdirectory/m4_javatarball
  @< set up java environment @>
fi
@| @}

Adapt the \verb|PATH| variable and set \verb|JAVA_HOME|. Set these
variables in the script that will be sourced in the running pipeline
and set them in this script because we are going to need Java.

@d set up java environment @{@%
echo 'export JAVA_HOME=\$envdir/java/m4_javajdk' >> \$piperoot/progenvv
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> \$piperoot/progenvv
export JAVA_HOME=\$envdir/java/m4_javajdk
export PATH=$JAVA_HOME/bin:$PATH
@| @}

\subsection{Maven}
\label{sec:Maven}

Currently we need version \verb|m4_mavenversion| to compile the Java
sources in some of the modules.

\subsection{Maven}
\label{sec:Maven}

Some Java-based modules can best be compiled with
\href{m4_mavenurl}{Maven}. So download and install Maven:

@d download stuff @{@%
@< need to wget @(m4_maventarball@,m4_maventarballurl@) @>
@| @}

First check whether maven is already present in the correct version.

@d check presence of maven in m4_mavenversion @{@%
mvn -version | grep "Maven 3.0.5" >/dev/null
if
  [ $? == 0 ]
then
  @1="True"
else
  @1="False"
fi
@| @}

@d  set up Maven @{@%
@< check presence of maven in m4_mavenversion @(mvn_OK@) @>
if
  [ ! "\$mvn_OK" == "True" ]
then
  @< check whether a tarball is present in the snapshot @(m4_maventarball@,tarball_present@) @>
  if
    [ ! "\$tarball_present" == "True" ]
  then
    echo "Please install Maven version m4_mavenversion"
    exit 4
  fi
  cd $envdir
  tar -xzf m4_snapshotsocket/m4_snapshotdirectory/m4_maventarball
  export MAVEN_HOME=\$envdir/m4_mavensubdir
  export PATH=${MAVEN_HOME}/bin:${PATH}
fi
@| @}

@d set variables that point to the directory-structure @{@%
export MAVEN_HOME=\$envdir/m4_mavensubdir
export PATH=${MAVEN_HOME}/bin:${PATH}

@| @}

When the installation has been finished, we do not need maven anymore.

@d clean up after installation @{@%
cd \$envdir
rm -rf m4_mavensubdir
@| @}

\subsection{Python}
\label{sec:python}

Several modules in the pipeline run on Python version
m4_pythonversion. If the command \verb|python| does not invoke that
version, we can try install ActivePython, of which we have a tarball
in the snapshot. Versioning in Python is very confusing. It is the
\href{https://www.python.org/dev/peps/pep-0394/}{official Python
  policy} that \verb|/usr/bin/env python| points to Python version~2
but that scripts with a shabang of 
\verb|<!!>#<!!>! /usr/bin/env python| should be executable by
Python version 2 as well as Python version 3.

Our policy will be as follows:

1. When installing, make sure that command \verb|python3| starts a
    python~<!!>m4_pythonversion executable. If this is not the case,
    install ActivePython version~<!!>m4_pythonversion.
2. Generate a virtual environment. 
3. Make sure that in our environmen command \verb|python| executes
   python from the virtual environment.


@d check presence of python3 in m4_pythonversion @{@%
python3 --version 2>&1 | grep "Python m4_pythonversion" >/dev/null
if
  [ $? == 0 ]
then
  @1="True"
else
  @1="False"
fi
@| @}

@d set up Python @{@%
@< check presence of python3 in m4_pythonversion @(python_OK@) @>
if
  [ ! "\$python_OK" == "True" ]
then
  @< check whether a tarball is present in the snapshot @(m4_activepythonball@,tarball_present@) @>
  if
    [ ! "\$tarball_present" == "True" ]
  then
    echo "Please install Python version m4_pythonversion"
    exit 4
  fi
  @< install ActivePython @>
fi
@| @}

Unpack the tarball in a temporary directory and install active python
in the \texttt{env} subdirectory of nlpp. Activepython has a few
peculiarities:
\begin{itemize}
\item It installs things in subdirectories \verb|bin| and \verb|lib|
  of the installation-directory (in our case subdirectory \verb|env|).
\item It installs scripts with names \verb|python3| and
  \verb|pip3|. We will make symbolic links from these scripts to
  \verb|python| resp. \verb|pip|.
\item It writes self-starting scripts with a ``shabang'' containing
  the full absolute path to the \verb|python3| script. In an attempt
  to make Active-python relocatable we will rewrite the Shabangs to
  have them contain \verb|#!/usr/bin/env python|.
\end{itemize}



@d install ActivePython  @{@%
pytinsdir=`mktemp -d -t activepyt.XXXXXX`
cd $pytinsdir
tar -xzf \$pipesocket/m4_snapshotdirectory/m4_activepythonball
acdir=`ls -1`
cd $acdir
./install.sh -I \$envdir
cd \$piperoot
rm -rf \$pytinsdir
@< create python script and pip script @>
@< rewrite ActivePython shabangs @>

@| @}

@d create python script and pip script @{@%
cd \$envbindir
rm python
ln -s python3 python
rm pip
ln -s pip3 pip
@| @}

To rewrite the shabangs of the ActivePython scripts do as follows:

\begin{enumerate}
\item Create a temporary directory.
\item Generate an \AWK{} script that replaces the shabang line with a
  correct one.
\item Generate a script that moves a script from \verb|env/bin| to the
  temporary directory and then applies the \AWK{} script.
\item Apply the generated script on the scripts in \verb|env/bin|.
\end{enumerate}

@d rewrite ActivePython shabangs @{@%
transfile=`mktemp -t trans.XXXXXX`
rm -rf $transfile
@% @< write script tran @>
@% @< write script chasbang.awk @>
@< apply script tran on the scripts in @($envbindir@,$transfile@) @>
@% find $envbindir -type f -exec file {} + | grep script | gawk '{print $1}' FS=':' | xargs -iaap ./tran aap
cd $piperoot
rm -rf $transfile
@| @}


@o m4_envbindir/tran @{@%
#!/bin/bash
@< get location of the script @(trandir@) @>
workfil=\$1
tempfil=\$2
mv \$workfil $tempfil
gawk -f $trandir/chasbang.awk \$tempfil>$workfil
chmod 775 \$workfil
@| @}

@d make scripts executable @{@%
chmod 775  m4_envbindir/tran
@| @}


@o m4_envbindir/chasbang.awk @{@%
#!/usr/bin/gawk -f
BEGIN { shabang="#!/usr/bin/env python3"}

/^\#\!.*python.*/ { print shabang
                    next
                   }
{print}
@| @}



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
@% BEGIN { shabang="#!/bin/env python"}
@% 
@% /^\#\!.*python.*/ { print shabang
@%                     next
@%                    }
@% {print}
@% EOF
@% @| @}
 
The following looks complicated. The \texttt{find} command applies the
\texttt{file} command on the files in the \verb|env/bin|
directory. The grep command filters out the names of the files that
are scripts. it produces a filename, followed by a colon, followed by
a description of the type of the file. The \texttt{gawk} command
prints the filenames only and the \texttt{xargs} command applies the
\verb|tran| script on the file.  

@d apply script tran on the scripts in  @{@%
find @1 -type f -exec file {} + \
   |  grep "Python script" | gawk '{print \$1}' FS=':' \
   | xargs -iaap \$envbindir/tran aap @2
@| @}

\subsubsection{Python packages}
\label{sec:python-packages}

In order to be reproducible, we must make sure that Python packages
are installed in the correct version. Therefore, we will install the
packages beforehand and do not leave that to the install-scripts of
the modules. Descriptions of the packages can be found on
\url{https://pypi.python.org}. Install the following packages:

\begin{tabular}{lll}
  \textbf{package} & \textbf{version} & \textbf{module} \\
 KafNafParserPy & m4_kafnafversion & \\
 lxml           & m4_lxml_version  & \\
 pyyaml         & m4_pyyaml_version & \\
 requests       & m4_requests_version     & networkx \\
 networkx       & m4_networkx_version     & corefbase \\
\end{tabular}

@d  set up Python @{@%
pip install KafNafParserPy==m4_kafnafversion
pip install lxml==m4_lxml_version
pip install networkx==m4_networkx_version
pip install pyyaml==m4_pyyaml_version
pip install requests==m4_requests_version
pip install six==m4_six_version
@| @}


\subsection{Perl}
\label{sec:perl}

One of the modules uses perl and needs \verb|XML::LibXML|. However,
installation of that package seems to be tricky and seems to depend on
the availability of obscure stuff. So, we proceed as follows. First
test whether Perl version~<!!>m4_perl_version<!!> is present on the
host. If that is not the case, check whether we have a tarball named
\verb|m4_perl_libball| in the snapshot. If that is the case, install Perl
from scratch and unpack the tarball. Otherwise, fail, and tell the
user to install Perl and \verb|XML::LibXML|.

Install Perl locally, to be certain that Perl is available and to enable to install
packages that we need (in any case: \verb|XML::LibXML|).

@d download stuff @{@%
@< need to wget @(m4_perl_ball@,m4_perl_url@) @>

@| @}

@d check presence of perl in m4_perl_version @{@%
perl -v 2>&1 | grep "perl m4_perl_version," >/dev/null
if
  [ $? == 0 ]
then
  @1="True"
else
  @1="False"
fi
@| @}



@d set up Perl @{@%
@< check presence of perl in m4_perl_version @(perl_OK@) @>
if
  [ "\$perl_OK" == "True" ]
then
  @< check whether XML::LibXML is installed @(lib_OK@) @>
  if
    [ ! "\$lib_OK" == "True" ]
  then
     perl_OK="False"
  fi
fi
if
  [ ! "\$perl_OK" == "True" ]
then
  @< check whether a tarball is present in the snapshot @(m4_perl_libball@,tarball_present@) @>
  if
    [ ! "\$tarball_present" == "True" ]
  then
    echo "Please install Perl version m4_pythonversion and XML::LXML"
    exit 4
  fi
  @< install perl @>
fi

@| @}

@d check whether XML::LibXML is installed  @{@%
perl -MXML::LibXML -e 1 2>/dev/null
if
  [ \$? == 0 ]
then
  @1="True"
else
  @1="False"
fi
@| @}



@d install Perl @{@%
tempdir=`mktemp -d -t perl.XXXXXX`
cd $tempdir
@% wget m4_perl_url
tar -xzf \$pipesocket/m4_snapshotdirectory/m4_perl_ball 
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
echo 'export PERL_HOME=$envdir/perl' >> \$piperoot/progenvv
echo 'export PATH=$PERL_HOME/bin:$PATH' >> \$piperoot/progenvv
export PERL_HOME=$envdir/perl
export PATH=$PERL_HOME/bin:$PATH
@| @}

@% Install what is called \verb|XML::XMLLib| in the Perl world.

Unpack the poor-man tarball with LibXML:

@d install perl @{@%
cd \$envdir/perl/lib
tar -xzf \$pipesocket/m4_snapshotdirectory/m4_perl_libball
@| @}

\subsection{Spotlight}
\label{sec:spotlight}

A Spotlight server occupies a lot of memory and we need two of them,
one for each language. We may be lucky and have a spotlight server
running somewhere. Nevertheless, let us be prepared to be able to
install a server ourselves.


\subsubsection{Install spotlight servers}
\label{sec:install_spotlight_servers}


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


So, let us do that.

First, get the Spotlight model data that we need:

@d download stuff @{@%
@< need to wget @(m4_spotlight_nl_model_ball@,m4_spotlight_download_url/m4_spotlight_nl_model_ball@) @>
@< need to wget @(m4_spotlight_en_model_ball@,m4_spotlight_download_url/m4_spotlight_en_model_ball@) @>
@< need to wget @(m4_wikipediadb_tarball@,m4_wikipediadb_url@) @>

@| @}

@d install the Spotlight server @{@%
cd \$envdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_spotlightball
cd \$envdir/spotlight
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_spotlight_nl_model_ball
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_spotlight_en_model_ball
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
tar -xzf \$snapshotsocket/\$snapshotdirectory/m4_wikipediadb_tarball
@| @}


\subsubsection{Check/start the Spotlight server}
\label{sec:check-start-spotlight}

The macro \verb|check/start spotlight| does the following:

\begin{enumerate}
\item Check whether spotlight runs on the default spotlighthost.
\item If that is not the case, and the defaulthost is not
  \verb|localhost|, check whether Spotlight runs on localhost.
\item If a running spotlightserver is still not found, start a
  spotlightserver on localhost.
\end{enumerate}

Start Spotlight, if it doesn't run already. Spotlight ought to run on
localhost unless variable \verb|spotlighthost| exists. In that case,
check whether a Spotlight server can be contacted on that
host. Otherwise, change \verb|spotlighthost| to \verb|localhost| and
check whether a Spotlight server runs there. If that is not the case,
start up a Spotlight server on localhost.  

The following script, \verb|check_start_spotlight|, has three
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
@<  get location of the script @(DIR@)@>
cd $DIR
source ../progenv
@< get commandline-arguments for check\_start\_spotlight @>
@< set default arguments for Spotlight @>
@| @}


The code to obtain command-line arguments has been obtained from
\href{http://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash}{Stackoverflow}. The
following fragment reads the arguments \verb|-l language|,
\verb|-h spotlighthost| and \verb|-p spotlightport|:


@d get commandline-arguments for check\_start\_spotlight @{@%
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
@| @}


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
  [ \$spotlightrunning -ne 0 ]
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





\subsection{Download materials}
\label{sec:download}

This installer needs to download a lot from different sources:

\begin{itemize}
\item Most of the NLP-modules will be built up from their sources in
  Github. The sources must be cloned.
\item Many modules need external resources, e.g. the Alpino
  tagger. Often these utilities must be downloaded from a location
  specified by the supplier. 
\item Many modules use extra resources like model-data, that must be
  obtained separately.
\item Some of the resources are not publicly available. They must be
  obtained from a pass-word protected \URL{}.
\item 
\end{itemize}

Usually downloads are slow, and the duration is only little determined
by the resources in the installing computer, but by the network and
the performance of the systems from which we download. Therefore, we
may speed up by first downloading things, if possible in parallel processes.

We put the following the beginning of the install-script:

@d download everything @{@%
@< download stuff @>
echo Waiting for downloads to complete ...
wait
echo Download completed
@| @}


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

Get autoconf:

@d download stuff @{@%
@< need to wget @(m4_autoconf_ball@,m4_autoconf_url@) @>
@| @}


Install autoconf:

@d set up autoconf @{
autoconfdir=`mktemp -d -t autoconf.XXXXXX`
cd $autoconfdir
tar -xzf \$pipesocket/m4_snapshotdirectory/m4_autoconf_ball
cd autoconf-<!!>m4_autoconf_version
@% ./autogen.sh --prefix=$envdir
./configure --prefix=$envdir
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


\subsection{Alpino}
\label{sec:Alpino}

Install Alpino as a utility because it is so big, and hard to install
on different platforms. Users may choose to install the utilities (and
Alpino) by hand and then still install the modules with the script
from this file.

Alpino cannot be obtained from an open source repository and there
does not seem to be a repository where all the older versions are
stored. Therefore, if possible, we will use a copy from our secret
archive if that is available. If that is not available, we will
download the latest version of Alpino.


@d install Alpino @{@%
alpinosrc=m4_alpinosrc
cd \$envdir
if
[ -d "Alpino" ]
then
  echo "Not installing Alpino, because of existing directory \$envdir/Alpino"
else
  if
    [ ! -e "\$pipesocket/m4_snapshotdirectory/\$alpinosrc" ]
  then
    echo "Try to install the latest Alpino."
    alpinosrc=latest.tar.gz
    cd \$pipesocket/m4_snapshotdirectory
    wget m4_alpinourl
    if
      [ $? -gt 0 ]
    then
      echo "Cannot install Alpino. Please install Alpino in \$envdir/Alpino"
      exit 4
    fi
  fi
  cd \$envdir
  tar -xzf \$pipesocket/m4_snapshotdirectory/\$alpinosrc
fi
@| @}
  

@d set environment parameters @{@%
export ALPINO_HOME=\$envdir/Alpino
@|ALPINO_HOME @}


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
TREETAGGER_HOME=\$envdir/\$TREETAGDIR
TREETAG_BASIS_URL=m4_treetag_base_url
@| TREETAGGER_HOME @}

@d set environment parameters @{@%
export TREETAGGER_HOME=\$envdir/m4_treetagdir
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

@% @d download stuff @{@%
@% @< need to wget @(\$TREETAGSRC@,\$TREETAG_BASIS_URL/\$TREETAGSRC@) @>
@% @< need to wget @(\$TREETAGSCRIPTS@,\$TREETAG_BASIS_URL/\$TREETAGSCRIPTS   @) @>        
@% @< need to wget @(\$TREETAG_INSTALLSCRIPT@,\$TREETAG_BASIS_URL/\$TREETAG_INSTALLSCRIPT @) @> 
@% @< need to wget @(\$DUTCHPARS_UTF_GZ@,\$TREETAG_BASIS_URL/\$DUTCHPARS_UTF_GZ @) @>      
@% @< need to wget @(\$DUTCH_TAGSET@,\$TREETAG_BASIS_URL/\$DUTCH_TAGSET@) @> 
@% @< need to wget @(\$DUTCHPARS_2_GZ@,\$TREETAG_BASIS_URL/\$DUTCHPARS_2_GZ@) @>     
@% @| @}

@d install the treetagger utility @{@%
@% mkdir -p \$modulesdir/\$TREETAGDIR
mkdir -p \$envdir/\$TREETAGDIR
cd \$envdir/\$TREETAGDIR
wget \$TREETAG_BASIS_URL/\$TREETAGSRC            
wget \$TREETAG_BASIS_URL/\$TREETAGSCRIPTS        
wget \$TREETAG_BASIS_URL/\$TREETAG_INSTALLSCRIPT 
wget \$TREETAG_BASIS_URL/\$DUTCHPARS_UTF_GZ      
wget \$TREETAG_BASIS_URL/\$DUTCH_TAGSET          
wget \$TREETAG_BASIS_URL/\$DUTCHPARS_2_GZ        
@| @}

Run the install-script:

@d install the treetagger utility @{@%
chmod 775 \$TREETAG_INSTALLSCRIPT
./\$TREETAG_INSTALLSCRIPT
@| @}

The scripts in the \verb|cmd| subdirectory contain absolute paths. We
can make the treetagger directory-structure location-independent by
using relative paths, eg relative to \verb|TREETAGGER_HOME|

@d install the treetagger utility @{@%
@< make treetagger location-independent @>
@| @}


It works as follows:

Many of the scripts in the \verb|cmd| subdirectory contain lines like:

\begin{verbatim}
BIN=<absolute path>/bin

\end{verbatim}

We read one of those scripts and extract the contents of
\verb|<absolute path>| into variable \verb|indicator|. Then we replace
in all scripts occurrences of this text with \verb|\${TREETAGGER_HOME}|. 

@d make treetagger location-independent @{@%
@< extract the absolute path from one of the scripts @>
@< replace the absolute paths @>
@| @}

@d extract the absolute path from one of the scripts @{@%
cmdir=\${TREETAGGER_HOME}/cmd
probefile=`grep -l "^BIN=" \${cmdir}/* | head -n 1`
@% indicator=`cat \$probefile | gawk '/^BIN=/ {match(\$0, /^BIN=(.*treetagger)\/bin/, arr); print arr[1]}'`
indicator=`cat \$probefile | gawk '/^BIN=/ {@< matchscript @>}'`
@| @}

@d matchscript @{@%
match(\$0, /^BIN=(.*treetagger)\/bin/, arr); print arr[1]@%
@| @}


@d replace the absolute paths @{@%
sedcommand="s|\$indicator|\\${TREETAGGER_HOME}|g"
tempfile=`mktemp -t mytemp.XXXXXX`
for file in \${cmdir}/*
do
  mv \$file \$tempfile
  cat \$tempfile | sed \$sedcommand >\$file
done	   
rm -rf $tempfile
@| @}



Make the treetagger utilities available for everybody.

@d install the treetagger utility @{@%
chmod -R o+rx \$envdir/\$TREETAGDIR/bin
chmod -R o+rx \$envdir/\$TREETAGDIR/cmd
chmod -R o+r \$envdir/\$TREETAGDIR/doc
chmod -R o+rx \$envdir/\$TREETAGDIR/lib
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




\subsubsection{Svmlib}
\label{sec:svmlib}


Svmlib is needed by module svmwsd. That module can install svmlib by
itself, but for now we try installation in the prog-environment. We
set variable \verb|SVMLIB_HOME| to indicate where the module is
located.

@d set environment parameters @{@%
export SVMLIB_HOME=\$envdir/svmlib
@| SVMLIB_HOME @}


@d install svmlib @{@%
export SVMLIB_HOME=\${envdir}/svmlib
tempdir=`mktemp -d -t svmlib.XXXXXX`
cd \$tempdir
wget m4_svm_url
unzip m4_svmball
rm m4_svmball
oridir=`ls -1 | head -1`
mv $oridir ${SVMLIB_HOME} 
cd \${SVMLIB_HOME}/python
rm -rf \$tempdir
make
cd $piperoot
@| @}


\subsubsection{The Boost library}
\label{sec:boost}

I have no idea how Boost works. Neither can I find out how to test
whether boost has been installed already. So we install libbost
according to
\href{http://www.boost.org/doc/libs/1_55_0/doc/html/bbv2/installation.html}{this
  manual and hope for the best.

@d install boost @{@%
boost_ball=boost-build-2014-10.tar.bz2
boost_ball_url=https://github.com/boostorg/build/releases/download/2014.10/${boost_ball}
tempdir=`mktemp -d -t boost.XXXXXX`
cd $tempdir
wget ${boost_ball_url}
tar -xjf ${boost_ball}
cd boost-build
./bootstrap.sh --prefix=$envdir --with-libraries=graph,system,filesystem,program_options,regex
./b2 --prefix=$envdir 
cd $piperoot
rm -rf $tempdir
@| @}

@d install boost @{@%
cd \$envdir
tar -xzf \$snapshotsocket/m4_snapshotdirectory/m4_ripped_boostball
@| @}

Zet de boost libraries in \verb|LD_LIBRARY_PATH|.

@d set environment parameters @{@%
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$envdir/boost_1_54_0/stage/lib
@| @}


\section{Install the modules}
\label{sec:install-modules}

We make a separate script to install the modules. By default, the modules
will be installed in subdirectory \verb|modules| of the \NLPP{} root
directory, but this is not necessarily so.

The script \verb|install-modules| installs modules that are not yet present.

@o m4_envbindir/m4_module_installer @{@%
#!/bin/bash
@<  get location of the script @(DIR@)@>
cd $DIR
source ../../progenv
@< functions of the module-installer @>
@< install the modules @>
@| @}

@d make scripts executable @{@%
chmod 775  m4_envbindir/m4_module_installer
@| @}


Installing a module from Github is very simple:
\begin{itemize}
\item Skip installation if the module is already present. Otherwise:
\item Clone the module in subdirectory \verb|modules|.
\item \verb|cd| to that module and perform script \verb|install|. 
\end{itemize}

@d functions of the module-installer @{@%
function gitinst (){
   url=$1
   dir=$2
   commitset=$3
   echo "Install $dir" >&2
   cd \$piperoot/modules
   if
     [ -e $dir ]
   then
     echo "Not installing existing module $dir"
   else
     git clone $url
     cd $dir
     git checkout $commitset 
     ./install
   fi
}
@| @}



For each module we generate a script in the \verb|bin| subdirectory to make
the module easier to use. The script does the following:

\begin{enumerate}
\item Find the directory of itself.
\item Run script \verb|run| in the directory of the module, that can
  be found as \verb|../<modulename>/run|. 
\end{enumerate}

@d contents of shorthand-script @{@%
#!/bin/bash
@< get location of the script @(thisdir@) @>
scriptname=${0##*/}
scriptpath=$thisdir/$scriptname
cd ${thisdir}
@< set the naflang parameter @>
cat | ../modules/@1/run
@| @}

@d set the naflang parameter @{@%
if
  [ -z "${naflang}" ]
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


\subsection{Parameters in module-scripts}
\label{sec:modulescriptparameters}

Some modules need parameters. All modules need a language
specification. The language can be passed as exported variable
\verb|naflang|, but it can also be passed as argument
\verb|-l|. Furthermore, some modules need contact with a Spotlight
server. With the arguments \verb|-h| and \verb|-b| the host and port
of a running Spotlight-server can be passed.

Let us assess a ``Parameter-passing'' hierarchy for \verb|run|
scripts. Basically a ``run'' script uses default values encoded in the
\verb|run| script itself. These values can be overruled by environment
parameters. Both default and enviroment parameter settings can be
overruled by options that are provided to the \verb|run| commands.

Let us adhere to the policy that we use short one-letter options in
\verb|run| scripts, that can be parsed with \verb|getopts|.



The code to obtain command-line arguments in Bash has been obtained
from
\href{http://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash}{Stackoverflow}. The
following fragment reads the arguments \verb|-l language|, 
\verb|-h spotlighthost| and \verb|-p spotlightport|:

@d start of module-script @{@%
@< get location of the script @(DIR@) @>
cd \$DIR
source ../progenv
@| @}




@% \subsection{Install modules}
@% \label{sec:installmodules}
@% 
@% The modules of \NLPP{} version~4 can be easily installed withe the following function:
@% 
@% @d functions to install modules @{@%
@% function install_module_from_github () {
@%   gitowner=\$1
@%   modulename=\$2
@%   repo="https://github.com/"\$gitowner"/"\$modulename".git"
@%   cd m4_amoddir
@%   git clone \$repo
@%   cd \$modulename
@%   ./install
@%   ./clean
@%   }
@% @| @}


\subsubsection{Tokeniser}
\label{sec:installtokenizer}

The tokenizer is the simples of the modules. It needs Java version~m4_javaversion. On installation it
compiles a Java JAR file, and this is used in the run script.


@d install the modules @{@%
@%   install_module_from_github PaulHuygen ixa-pipe-tok
gitinst m4_tokenizergit m4_tokenizername m4_tokenizer_commitname 
@| @}

@o m4_bindir/m4_tokenizerscript @{@%b
@< contents of shorthand-script @(m4_tokenizerdir@) @>

@| @}

\subsubsection{Topic detection tool.}
\label{sec:installtopic_detection_tool}

The topic detection tool uses Java.

@d install the modules @{@%
@%   install_module_from_github PaulHuygen ixa-pipe-tok
gitinst m4_topictoolgit m4_topictoolname m4_topic_commitname 
@| @}

@o m4_bindir/m4_topicscript @{@%b
@< contents of shorthand-script @(m4_topictooldir@) @>
@| @}

\subsubsection{Morphosyntactic Parser and Alpino}
\label{sec:mor}

The morphosyntactic parser is in fact a wrapper around Alpino. We have
installed Alpino in section~\ref{sec:alpino}. The morpho-syntactic
parser expects Alpino to be located in \verb|\$envdir/Alpino|. 


@d install the modules @{@%
@%   install_module_from_github PaulHuygen ixa-pipe-tok
gitinst m4_morphpargit m4_morphpardir m4_morphpar_commitname 
@| @}

@o m4_bindir/m4_morparscript @{@%b
@< contents of shorthand-script @(m4_morphpardir@) @>
@| @}


\subsubsection{Pos tagger}
\label{sec:pos-tagger}

Use the pos-tagger from \EHU{} for English documents.

@d install the modules @{@%
@% install_module_from_github PaulHuygen ixa-pipe-tok
gitinst m4_posgit m4_posdir m4_pos_commitname 
@| @}

@o m4_bindir/m4_postagscript @{@%b
@< contents of shorthand-script @(m4_posdir@) @>
@| @}

\subsubsection{Named entity recognition (NERC)}
\label{sec:nerc}

@d install the modules @{@%
   gitinst m4_nercgit m4_nercdir m4_nerc_commitname 
@| @}

@o m4_bindir/m4_nercscript @{@%b
@< contents of shorthand-script @(m4_nercdir@) @>
@| @}

\subsubsection{Word-sense disambiguation (WSD)}
\label{sec:wsd}

@d install the modules @{@%
   gitinst m4_wsdgit m4_wsddir m4_wsd_commitname 
@| @}

@o m4_bindir/m4_wsdscript @{@%b
@< contents of shorthand-script @(m4_wsddir@) @>
@| @}



\subsubsection{NED}
\label{sec:ned}

The \NED{} module is rather picky about the structure of the \NAF{}
file. In any case, it does not accept a file that has been produced by
the ontotagger. Hence, in a pipeline \NED{} should be executed before
the ontotagger.


The \NED{} module wants to consult the Dbpedia Spotlight server, so
that one has to be installed somewhere. For this moment, let us
suppose that it has been installed on localhost.

@d install the modules @{@%
   gitinst m4_nedgit m4_neddir m4_ned_commitname 
@| @}

@o m4_bindir/m4_nedscript @{@%b
@< contents of shorthand-script @(m4_neddir@) @>
@| @}


\subsubsection{Dark-entity relinker}
\label{sec:derel}

The ``Dark Entity Relinker'' tries to link ``Dark entities'' (named
entities that have not been recognized) to the link of a known entity
with a similar name structure that has been found in the same text.

@d install the modules @{@%
   gitinst m4_delinkgit m4_delinkdir m4_delink_commitname 
@| @}

@o m4_bindir/m4_delinkscript @{@%b
@< contents of shorthand-script @(m4_delinkdir@) @>
@| @}

\subsubsection{Heideltime}
\label{sec:heideltime}

The code for Heideltime can be found in
\href{https://github.com/HeidelTime/heideltime}{Github}. This repo
contains an adapted Jar file.

Use Heideltime via a wrapper, \texttt{ixa-pipe-time}, obtained from
\href{https://github.com/ixa-ehu/ixa-pipe-time}{Github}.

Although suggested otherwise, Heideltime seems not to use
Treetagger. It works 

@d install the modules @{@%
   gitinst m4_heidelgit m4_heideldir m4_heidel_commitname 
@| @}

@o m4_bindir/m4_heidelscript @{@%b
@< contents of shorthand-script @(m4_heideldir@) @>
@| @}


\subsubsection{Ontotagger, Framenet-SRL and nominal events}
\label{sec:onto}


\begin{itemize}
\item Een directory voor drie modules.
\item Verwacht module \verb|vua-resources| in een parallelle directory.
\end{itemize}


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

@d install the modules @{@%
   gitinst m4_ontogit m4_ontodir m4_ontocommitname 
@| @}

The ``Ontotagger'' script:


@o m4_bindir/m4_ontoscript @{@%
@< contents of shorthand-script @(m4_ontodir@) @>

@| @}

The ``Nominal Event Coreference'' script:


@o m4_bindir/m4_nomevscript @{@%
@< contents of shorthand-script @(m4_nomevdir@) @>

@| @}

The ``Framenet SRL'' script:


@o m4_bindir/m4_framesrlscript @{@%
@< contents of shorthand-script @(m4_framesrldir@) @>

@| @}



\subsubsection{NED-reranker}
\label{sec:nedrer}

@d install the modules @{@%
   gitinst m4_nedrergit m4_nedrerdir m4_nedrercommitname 
@| @}


@o m4_bindir/m4_nedrerscript @{@%
@< contents of shorthand-script @(m4_nedrerdir@) @>

@| @}

\subsubsection{Wikify module}
\label{sec:wikify}

Wikify needs spotlight.

@d install the modules @{@%
   gitinst m4_wikify_git m4_wikifydir m4_wikify_commitname 
@| @}


@o m4_bindir/m4_wikifyscript @{@%
@< contents of shorthand-script @(m4_wikifydir@) @>
@| @}

\subsubsection{UKB}
\label{sec:ukb}

The UKB WSD module is up to now only available from closed
repositories.There exists a repository
\href{https://github.com/ixa-ehu/ukb}{ukb} in Git, but this does not
seem to include the scripts to process \textsc{naf}. Therefore, we
need to have the repo available beforehand.


@d install the modules @{@%
# UKB
if
  [ -e \$snapshotdir/m4_ukbball ]
then
  cd \$modulesdir
  tar -xzf \$snapshotdir/m4_ukbball
else
  echo "No UKB"
  exit 1
fi
@| @}

@o m4_bindir/m4_ukbcript @{@%
@< contents of shorthand-script @(m4_ukbdir@) @>
@| @}


\subsubsection{IMS-WSD}
\label{sec:IMS-WSD}

In the previous version of \verb|nlpp| we implemented a ready-to run
tarball (m4_ewsdball) from the closed newsreader-archive. The contents
of that tarball are obtained from
\href{https://github.com/rubenIzquierdo/it_makes_sense_WSD.git}{this github repo}.

@d install the modules @{@%
gitinst m4_ewsd_git m4_ewsddir m4_ewsd_commitname 
@| @}

@o m4_bindir/m4_ewsdscript @{@%
@< contents of shorthand-script @(m4_ewsddir@) @>
@| @}

\subsubsection{Semantic Role labelling}
\label{sec:SRL}

@d install the modules @{@%
gitinst m4_nl_srlgit m4_nl_srldir m4_nl_srl_commitname 
@| @}

@o m4_bindir/m4_nl_srlscript @{@%
@< contents of shorthand-script @(m4_nl_srldir@) @>
@| @}


\subsubsection{srl-Dutch nominals}
\label{sec:SRL}

@d install the modules @{@%
gitinst m4_srl_dn_git m4_srl_dn_dir m4_srl_dn_commitname 
@| @}

@o m4_bindir/m4_srl_dn_script @{@%
@< contents of shorthand-script @(m4_srl_dn_dir@) @>
@| @}

\subsubsection{Factuality}
\label{sec:factuality}

We have module \verb|m4_en_factualitydir| to identify event-factuality
in English texts and  module \verb|m4_nl_factualitydir| to identify event-factuality
in non-English texts.

@d install the modules @{@%
gitinst m4_nl_factualitygit m4_nl_factualitydir m4_nl_factualitycommit 
gitinst m4_en_factualitygit m4_en_factualitydir m4_nl_factualitycommit 
@| @}

The shorthandscript runs the module in \verb|m4_en_factualitydir| for
english documents and it runs the module in  \verb|m4_nl_factualitydir| for
documents in other languages.

@o m4_bindir/m4_factualityscript @{@%
#!/bin/bash
@< get location of the script @(thisdir@) @>
scriptname=${0##*/}
scriptpath=$thisdir/$scriptname
@< set the naflang parameter @>
cd ${thisdir}
if
  [ "${naflang}" == "en" ]
then
  cat | ../modules/m4_en_factualitydir/run
else
  cat | ../modules/m4_nl_factualitydir/run
fi

@| @}

\subsubsection{Opinion miner}
\label{sec:opinimin}

The opinion-miner needs models that are not yet available from an open
repository. The installer expects the variable
\verb|opinion_models_ball_path| to contain the full path to the
tarball with the opinion-models.


@d install the modules @{@%
export opinion_models_ball_path=${snapshotdir}/models_opinion_miner_deluxePP.tgz
gitinst m4_opinigit m4_opinidir m4_opini_commitname 
@|opinion_models_ball_path @}

@o m4_bindir/m4_opiniscript @{@%
@< contents of shorthand-script @(m4_opinidir@) @>
@| @}

\subsubsection{Event coreference}
\label{sec:eventcoref}

The event-coreference module is language-independent. It is a module
in a jar-file that can be built with the Github
\href{m4_evcorefgit}{m4_evcorefgit} repo. The module uses resources
from the \verb|m4_vua_resources_dirname| Github repo.

@d install the modules @{@%
gitinst m4_evcorefgit m4_evcorefdir m4_evcorefcommit 
@| @}

@o m4_bindir/m4_evcorefscript @{@%
@< contents of shorthand-script @(m4_evcorefdir@) @>
@| @}


\section{Utilities}
\label{sec:utilities}

\subsection{Language detection}
\label{sec:langdetect}


The following script \verb|m4_envbindir/langdetect.py| discerns the
language of the \NAF{} document that it reads from standard in. If it
cannot find the language, it prints \verb|unknown|.  The macro
\verb|set the language variable| uses this script to set variable
\verb|naflang|. All pipeline modules expect that this veriable has
been set.

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
print(language)
@| @}

@d make scripts executable @{@%
chmod 775  m4_envbindir/langdetect.py
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
  [ -z "\${naflang+x}" ]
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
produced or the input file; 2) the name of directory in which the
module resides and 3) the name of the
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
  local modulecommand=\$modulesdir/$2/run
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

@| moduleresult runmodule @}
 
Use the function to annotate a \NAF{} file that \verb|infile| points
to and write the result in a file that  \verb|outfile| points to:

@d annotate dutch document @{@%
runmodule \$infile    m4_tokenizername    tok.naf
runmodule tok.naf     m4_topictoolname    top.naf
runmodule top.naf     m4_morphpardir      pos.naf
runmodule pos.naf     m4_nercdir          nerc.naf
runmodule nerc.naf    m4_wsddir           wsd.naf
runmodule wsd.naf     m4_neddir           ned.naf
runmodule ned.naf     m4_delinkdir        derel.naf
runmodule derel.naf   m4_heideldir        times.naf
runmodule times.naf   m4_ontodir          onto.naf
runmodule onto.naf    m4_nl_srldir        srl.naf
runmodule srl.naf     m4_nomevdir         nomev.naf
runmodule nomev.naf   m4_srl_dndir        psrl.naf
runmodule psrl.naf    m4_framesrldir      fsrl.naf
runmodule fsrl.naf    m4_nl_factualitydir fact.naf
runmodule fact.naf    m4_evcorefdir       \$outfile

@| @}

Similar for an English naf:

@d annotate english document @{@%
  runmodule \$infile    m4_tokenizername tok.naf
  runmodule tok.naf     m4_topictoolname top.naf
  runmodule top.naf     m4_posname       pos.naf
  runmodule pos.naf     m4_nercdir       nerc.naf
  runmodule nerc.naf    m4_wsddir        wsd.naf
  runmodule wsd.naf     m4_neddir        ned.naf
  runmodule ned.naf     m4_delinkdir     derel.naf
  runmodule derel.naf   m4_nedrerdir     nedr.naf
  runmodule nedr.naf    m4_wikifydir     wikif.naf
  runmodule wikif.naf   m4_ukbdir        ukb.naf
@| @}

Determine the language and select one of the above macro's to annotate
the document. In fact, consider the document as an English document unless \verb|naflang| is ``nl''


@d annotate @{@%
naflang=`cat \$infile | m4_aenvbindir/langdetect.py`
export naflang
if
 [ "\$naflang" == "nl" ]
then
  @< annotate dutch document @>
@%   cat \$TESTIN    | \$BIND/tok                    > tok.naf
@% runmodule \$infile    m4_tokenizername       tok.naf
@% runmodule tok.naf     m4_topictoolname       top.naf
@% runmodule top.naf     m4_morphpardir         pos.naf
@% runmodule pos.naf     m4_nercdir             \$outfile
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
expects the test-directory to be present, with an input-file (named
\verb|in.naf|) in it.

@d get a testfile and set naflang or die @{@%
cd $workdir
naflang=""
if 
  [ "\$1" == "en" ]
then
  cp \$nuwebdir/test.en.in.naf \$infile
  export naflang="en"
else
  if
    [ "\$1" == "nl" ]
  then
    cp \$nuwebdir/test.nl.in.naf  \$infile
    export naflang="nl"
  fi
fi
if
  [ -e \$infile ]
then
  if
    [ "$naflang" == "" ]
  then
    naflang=`cat $infile | python $envbindir/langdetect.py`
  fi
else
  echo "Please supply test-file \$workdir/\$infile or specify language"
  exit 4
fi
@| @}

This is the test-script:

@o m4_bindir/test @{@%
#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rdir=\$(dirname "\$DIR")
source \$rdir/progenv
oldd=`pwd`
workdir=$piperoot/test
mkdir -p $workdir
cd \$workdir
infile=in.naf
outfile=out.naf
@< get a testfile and set naflang or die @>
@< find a spotlightserver or exit @>
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


\section{Miscellaneous}
\label{sec:misc}

\subsection{Locate the path to the script itself}
\label{sec:directory_of_script}

The following macro finds the directory in which the script itself or
the sourced script itself is located.

@d get location of the script @{@%
@1="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
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
	../env/bin/clean_infrastructure
@%	@< clean up @>

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
