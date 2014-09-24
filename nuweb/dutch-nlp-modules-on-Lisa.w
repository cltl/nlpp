
\documentclass[twoside]{artikel3}
\pagestyle{headings}
\usepackage{pdfswitch}
\usepackage{figlatex}
\usepackage{makeidx}
\renewcommand{\indexname}{General index}
\makeindex
\newcommand{\thedoctitle}{Install Dutch nlp modules on Lisa}
\newcommand{\theauthor}{Paul Huygen <paul.huygen@@huygen.nl>}
\newcommand{\thesubject}{Dutch NLP  modules on Lisa}
\title{\thedoctitle}
\author{\theauthor}
\date{\today \\ 12:52~h.}
% Packages.
\usepackage{a4wide}
\usepackage{alltt}
\usepackage{color}
\usepackage{lmodern}
\usepackage[latin1]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[british]{babel}
%
% Commands for frequently used constructions
%
\newcommand{\pdf}{\textsc{pdf}}
\newcommand{\HTML}{\textsc{html}}
\newcommand{\URI}{\textsc{uri}}
\newcommand{\URL}{\textsc{url}}
%
% PDF-specific settings
%
\ifpdf
% \usepackage[pdftex]{graphicx}       %%% graphics for dvips
% \usepackage[pdftex]{thumbpdf}      %%% thumbnails for ps2pdf
% \usepackage[pdftex]{thumbpdf}      %%% thumbnails for pdflatex
% \usepackage[pdftex,                %%% hyper-references for pdflatex
% bookmarks=true,%                   %%% generate bookmarks ...
% bookmarksnumbered=true,%           %%% ... with numbers
% a4paper=true,%                     %%% that is our papersize.
% hypertexnames=false,%              %%% needed for correct links to figures !!!
% breaklinks=true,%                  %%% break links if exceeding a single line
% linkbordercolor={0 0 1}]{hyperref} %%% blue frames around links
% %                                  %%% pdfborder={0 0 1} is the
% %                                  default
% \hypersetup{
%   pdfauthor   = {\theauthor},
%   pdftitle    = {\thedoctitle},
%   pdfsubject  = {web program},
%  }
 \renewcommand{\NWlink}[2]{\hyperlink{#1}{#2}}
 \renewcommand{\NWtarget}[2]{\hypertarget{#1}{#2}}
 \renewcommand{\NWsep}{$\diamond$\rule[-1\baselineskip]{0pt}{1\baselineskip}}
\else
%\usepackage[dvips]{graphicx}        %%% graphics for dvips
%\usepackage[latex2html,             %%% hyper-references for ps2pdf
%bookmarks=true,%                   %%% generate bookmarks ...
%bookmarksnumbered=true,%           %%% ... with numbers
%hypertexnames=false,%              %%% needed for correct links to figures !!!
%breaklinks=true,%                  %%% breaks lines, but links are very small
%linkbordercolor={0 0 1},%          %%% blue frames around links
%pdfborder={0 0 112.0}]{hyperref}%  %%% border-width of frames 
\usepackage{html}
\renewcommand{\NWlink}[2]{\hyperlink{#1}{#2}}
\renewcommand{\NWtarget}[2]{\hypertarget{#1}{#2}}
\fi
%
% Settings
%
\raggedbottom
\makeatletter
\if@@oldtoc
  \renewcommand\toc@@font[1]{\relax}
\else
  \renewcommand*\toc@@font[1]{%
    \ifcase#1\relax
    \chaptocfont
    \or\slshape
    \or\rmfamily
    \fi}
\fi
\makeatother
\newcommand{\chaptocfont}{\large\bfseries}

\newcommand{\pdfpsinc}[2]{%
\ifpdf
  \input{#1}
\else
  \input{#2}
\fi
}
\begin{document}
\maketitle
\begin{abstract}
  This is the abstract
\end{abstract}
\tableofcontents

\section{Introduction}
\label{sec:Introduction}

Introduce your problem and the strategy to solve it.

\section{The program}
\label{sec:program}

Construct and describe your program.

\appendix

\section{How to read and translate this document}
\label{sec:translatedoc}

This document is an example of \emph{literate
  programming}~\cite{Knuth:1983:LP}. It contains the code of all sorts
of scripts and programs, combined with explaining texts. In this
document the literate programming tool \texttt{nuweb} is used, that is
currently available from Sourceforge
(URL:\url{nuweb.sourceforge.net}). The advantages of Nuweb are, that
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
\verb|a_dutch-nlp-modules-on-Lisa.w|. Figure~\ref{fig:fileschema}
\begin{figure}[hbtp]
  \centering
  \includegraphics{fileschema.fig}
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


@d parameters in Makefile @{NUWEB=/usr/local/bin/nuweb
@| @}


\subsection{Translate and run}
\label{sec:transrun}

This chapter assembles the Makefile for this project.

@o Makefile -t @{@< default target @>

@< parameters in Makefile @> 

@< impliciete make regels @>
@< expliciete make regels @>
@< make targets @>
@| @}

The default target of make is \verb|all|.

@d  default target @{all : @< all targets @>
.PHONY : all

@|PHONY all @}


One of the targets is certainly the \textsc{pdf} version of this
document.

@d all targets @{dutch-nlp-modules-on-Lisa.pdf@}

We use many suffixes that were not known by the C-programmers who
constructed the \texttt{make} utility. Add these suffixes to the list.

@d parameters in Makefile @{.SUFFIXES: .pdf .w .tex .html .aux .log .php

@| SUFFIXES @}



\subsection{Pre-processing}
\label{sec:pre-processing}

To make usable things from the raw input \verb|a_dutch-nlp-modules-on-Lisa.w|, do the following:

\begin{enumerate}
\item Process \verb|$| characters.
\item Run the m4 pre-processor.
\item Run nuweb.
\end{enumerate}

This results in a \LaTeX{} file, that can be converted into a \pdf{}
or a \HTML{} document, and in the program sources and scripts.

\subsubsection{Process `dollar' characters }
\label{sec:procdollars}

Many ``intelligent'' \TeX{} editors (e.g.\ the auctex utility of
Emacs) handle \verb|$| characters as special, to switch into
mathematics mode. This is irritating in program texts, that often
contain \verb|$| characters as well. Therefore, we make a stub, that
translates the two-character sequence \verb|\$| into the single
\verb|$| character.


@d expliciete make regels @{m4_dutch-nlp-modules-on-Lisa.w : a_dutch-nlp-modules-on-Lisa.w
	gawk '{if(match($$0, "@@%")) {printf("%s", substr($$0,1,RSTART-1))} else print}' a_dutch-nlp-modules-on-Lisa.w \
          | gawk '{gsub(/[\\][\$$]/, "$$");print}'  > m4_dutch-nlp-modules-on-Lisa.w

@| @}


\subsubsection{Run the M4 pre-processor}
\label{sec:run_M4}

@d  expliciete make regels @{dutch-nlp-modules-on-Lisa.w : m4_dutch-nlp-modules-on-Lisa.w
	m4 -P m4_dutch-nlp-modules-on-Lisa.w > dutch-nlp-modules-on-Lisa.w

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

@d parameters in Makefile @{FIGFILES=fileschema

@| FIGFILES @}

We use the package \texttt{figlatex} to include the pictures. This
package expects two files with extensions \verb|.pdftex| and
\verb|.pdftex_t| for \texttt{pdflatex} and two files with extensions \verb|.pstex| and
\verb|.pstex_t| for the \texttt{latex}/\texttt{dvips}
combination. Probably tex4ht uses the latter two formats too.

Make lists of the graphical files that have to be present for
latex/pdflatex:

@d parameters in Makefile @{FIGFILENAMES=$(foreach fil,$(FIGFILES), $(fil).fig)
PDFT_NAMES=$(foreach fil,$(FIGFILES), $(fil).pdftex_t)
PDF_FIG_NAMES=$(foreach fil,$(FIGFILES), $(fil).pdftex)
PST_NAMES=$(foreach fil,$(FIGFILES), $(fil).pstex_t)
PS_FIG_NAMES=$(foreach fil,$(FIGFILES), $(fil).pstex)

@|FIGFILENAMES PDFT_NAMES PDF_FIG_NAMES PST_NAMES PS_FIG_NAMES@}


Create
the graph files with program \verb|fig2dev|:

@d impliciete make regels @{%.eps: %.fig
	fig2dev -L eps $< > $@@

%.pstex: %.fig
	fig2dev -L pstex $< > $@@

.PRECIOUS : %.pstex
%.pstex_t: %.fig %.pstex
	fig2dev -L pstex_t -p $*.pstex $< > $@@

%.pdftex: %.fig
	fig2dev -L pdftex $< > $@@

.PRECIOUS : %.pdftex
%.pdftex_t: %.fig %.pstex
	fig2dev -L pdftex_t -p $*.pdftex $< > $@@

@| fig2dev @}


\subsubsection{Bibliography}
\label{sec:bbliography}

To keep this document portable, create a portable bibliography
file. It works as follows: This document refers in the
\texttt|bibliography| statement to the local \verb|bib|-file
\verb|dutch-nlp-modules-on-Lisa.bib|. To create this file, copy the auxiliary file
to another file \verb|auxfil.aux|, but replace the argument of the
command \verb|\bibdata{dutch-nlp-modules-on-Lisa}| to the names of the bibliography
files that contain the actual references (they should exist on the
computer on which you try this). This procedure should only be
performed on the computer of the author. Therefore, it is dependent of
a binary file on his computer.


@d expliciete make regels @{bibfile : dutch-nlp-modules-on-Lisa.aux /home/paul/bin/mkportbib
	/home/paul/bin/mkportbib dutch-nlp-modules-on-Lisa litprog

.PHONY : bibfile
@| @}

\subsubsection{Create a printable/viewable document}
\label{sec:createpdf}

Make a \pdf{} document for printing and viewing.

@d make targets @{pdf : dutch-nlp-modules-on-Lisa.pdf

print : dutch-nlp-modules-on-Lisa.pdf
	lpr dutch-nlp-modules-on-Lisa.pdf

view : dutch-nlp-modules-on-Lisa.pdf
	evince dutch-nlp-modules-on-Lisa.pdf

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




Note, that in the following \texttt{make} construct, the implicit rule
\verb|.w.pdf| is not used. It turned out, that make did not calculate
the dependencies correctly when I did use this rule.

@d  impliciete make regels@{%.pdf : %.w $(W2PDF)  $(PDF_FIG_NAMES) $(PDFT_NAMES)
	chmod 775 $(W2PDF)
	$(W2PDF) $*

@| @}

The following is an ugly fix of an unsolved problem. Currently I
develop this thing, while it resides on a remote computer that is
connected via the \verb|sshfs| filesystem. On my home computer I
cannot run executables on this system, but on my work-computer I
can. Therefore, place the following script on a local directory.

@d parameters in Makefile @{W2PDF=../nuweb/bin/w2pdf
@| @}

@d expliciete make regels  @{$(W2PDF) : dutch-nlp-modules-on-Lisa.w
	$(NUWEB) dutch-nlp-modules-on-Lisa.w
@| @}


@o ../nuweb/bin/w2pdf @{#!/bin/bash
# w2pdf -- compile a nuweb file
# usage: w2pdf [filename]
# 20140924 at 1252h: Generated by nuweb from a_dutch-nlp-modules-on-Lisa.w
NUWEB=/usr/local/bin/nuweb
LATEXCOMPILER=pdflatex
@< filenames in nuweb compile script @>
@< compile nuweb @>

@| @}


The script retains a copy of the latest version of the auxiliary file.
Then it runs the four processors nuweb, \LaTeX{}, MakeIndex and bib\TeX{}, until
they do not change the auxiliary file or the index. 

@d compile nuweb @{NUWEB=m4_nuweb
@< run the processors until the aux file remains unchanged @>
@< remove the copy of the aux file @>
@| @}

The user provides the name of the nuweb file as argument. Strip the
extension (e.g.\ \verb|.w|) from the filename and create the names of
the \LaTeX{} file (ends with \verb|.tex|), the auxiliary file (ends
with \verb|.aux|) and the copy of the auxiliary file (add \verb|old.|
as a prefix to the auxiliary filename).

@d filenames in nuweb compile script @{nufil=$1
trunk=${1%%.*}
texfil=${trunk}.tex
auxfil=${trunk}.aux
oldaux=old.${trunk}.aux
indexfil=${trunk}.idx
oldindexfil=old.${trunk}.idx
@| nufil trunk texfil auxfil oldaux indexfil oldindexfil @}

Remove the old copy if it is no longer needed.
@d remove the copy of the aux file @{rm $oldaux
@| @}

Run the three processors. Do not use the option \verb|-o| (to suppres
generation of program sources) for nuweb,  because \verb|w2pdf| must
be kept up to date as well.

@d run the three processors @{$NUWEB $nufil
$LATEXCOMPILER $texfil
makeindex $trunk
bibtex $trunk
@| nuweb makeindex bibtex @}


Repeat to copy the auxiliary file and the index file  and run the processors until the
auxiliary file and the index file are equal to their copies.
 However, since I have not yet been able to test the \verb|aux|
file and the \verb|idx| in the same test statement, currently only the
\verb|aux| file is tested.

It turns out, that sometimes a strange loop occurs in which the
\verb|aux| file will keep to change. Therefore, with a counter we
prevent the loop to occur more than 10 times.

@d run the processors until the aux file remains unchanged @{LOOPCOUNTER=0
while
  ! cmp -s $auxfil $oldaux 
do
  if [ -e $auxfil ]
  then
   cp $auxfil $oldaux
  fi
  if [ -e $indexfil ]
  then
   cp $indexfil $oldindexfil
  fi
  @< run the three processors @>
  if [ $LOOPCOUNTER -ge 10 ]
  then
    cp $auxfil $oldaux
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

@d make targets @{html : m4_htmltarget

@| @}

The \HTML{} file depends on its source file and the graphics files.

Make lists of the graphics files and copy them.

@d parameters in Makefile @{HTML_PS_FIG_NAMES=$(foreach fil,$(FIGFILES), m4_htmldocdir/$(fil).pstex)
HTML_PST_NAMES=$(foreach fil,$(FIGFILES), m4_htmldocdir/$(fil).pstex_t)
@| @}


@d impliciete make regels @{m4_htmldocdir/%.pstex : %.pstex
	cp  $< $@@

m4_htmldocdir/%.pstex_t : %.pstex_t
	cp  $< $@@

@| @}

Copy the nuweb file into the html directory.

@d expliciete make regels @{m4_htmlsource : dutch-nlp-modules-on-Lisa.w
	cp  dutch-nlp-modules-on-Lisa.w m4_htmlsource

@| @}

We also need a file with the same name as the documentstyle and suffix
\verb|.4ht|. Just copy the file \verb|report.4ht| from the tex4ht
distribution. Currently this seems to work.

@d expliciete make regels @{m4_4htfildest : m4_4htfilsource
	cp m4_4htfilsource m4_4htfildest

@| @}

Copy the bibliography.

@d expliciete make regels  @{m4_htmlbibfil : m4_anuwebdir/dutch-nlp-modules-on-Lisa.bib
	cp m4_anuwebdir/dutch-nlp-modules-on-Lisa.bib m4_htmlbibfil

@| @}



Make a dvi file with \texttt{w2html} and then run
\texttt{htlatex}. 

@d expliciete make regels @{m4_htmltarget : m4_htmlsource m4_4htfildest $(HTML_PS_FIG_NAMES) $(HTML_PST_NAMES) m4_htmlbibfil
	cp w2html /bin
	cd /bin && chmod 775 w2html
	cd m4_htmldocdir && /bin/w2html dutch-nlp-modules-on-Lisa.w

@| @}

Create a script that performs the translation.



@o w2html @{#!/bin/bash
# w2html -- make a html file from a nuweb file
# usage: w2html [filename]
#  [filename]: Name of the nuweb source file.
`#' m4_header
echo "translate " $1 >w2html.log
NUWEB=/usr/local/bin/nuweb
@< filenames in w2html @>

@< perform the task of w2html @>

@| @}

The script is very much like the \verb|w2pdf| script, but at this
moment I have still difficulties to compile the source smoothly into
\textsc{html} and that is why I make a separate file and do not
recycle parts from the other file. However, the file works similar.


@d perform the task of w2html @{@< run the html processors until the aux file remains unchanged @>
@< remove the copy of the aux file @>
@| @}


The user provides the name of the nuweb file as argument. Strip the
extension (e.g.\ \verb|.w|) from the filename and create the names of
the \LaTeX{} file (ends with \verb|.tex|), the auxiliary file (ends
with \verb|.aux|) and the copy of the auxiliary file (add \verb|old.|
as a prefix to the auxiliary filename).

@d filenames in w2html @{nufil=$1
trunk=${1%%.*}
texfil=${trunk}.tex
auxfil=${trunk}.aux
oldaux=old.${trunk}.aux
indexfil=${trunk}.idx
oldindexfil=old.${trunk}.idx
@| nufil trunk texfil auxfil oldaux @}

@d run the html processors until the aux file remains unchanged @{while
  ! cmp -s $auxfil $oldaux 
do
  if [ -e $auxfil ]
  then
   cp $auxfil $oldaux
  fi
  @< run the html processors @>
done
@< run tex4ht @>

@| @}


To work for \textsc{html}, nuweb \emph{must} be run with the \verb|-n|
option, because there are no page numbers.

@d run the html processors @{$NUWEB -o -n $nufil
latex $texfil
makeindex $trunk
bibtex $trunk
htlatex $trunk
@| @}


When the compilation has been satisfied, run makeindex in a special
way, run bibtex again (I don't know why this is necessary) and then run htlatex another time.
@d run tex4ht @{tex '\def\filename{{dutch-nlp-modules-on-Lisa}{idx}{4dx}{ind}} \input idxmake.4ht'
makeindex -o $trunk.ind $trunk.4dx
bibtex $trunk
htlatex $trunk
@| @}


\paragraph{create the program sources}
\label{sec:createsources}

Run nuweb, but suppress the creation of the \LaTeX{} documentation.
Nuweb creates only sources that do not yet exist or that have been
modified. Therefore make does not have to check this. However,
``make'' has to create the directories for the sources if they
do not yet exist.
So, let's create the directories first.

@d parameters in Makefile @{MKDIR = mkdir -p

@| MKDIR @}



@d make targets @{DIRS = @< directories to create @>

$(DIRS) : 
	$(MKDIR) $@@

@| DIRS @}


@d make targets @{sources : dutch-nlp-modules-on-Lisa.w $(DIRS)
	$(NUWEB) dutch-nlp-modules-on-Lisa.w

jetty : sources
	cd .. && mvn jetty:run

@| @}



\section{References}
\label{sec:references}

\subsection{Literature}
\label{sec:literature}

\bibliographystyle{plain}
\bibliography{dutch-nlp-modules-on-Lisa}

\subsection{URL's}
\label{sec:urls}

\begin{description}
\item[Nuweb:] \url{nuweb.sourceforge.net}
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
