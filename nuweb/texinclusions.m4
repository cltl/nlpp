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
