\pdfminorversion=5
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesisbeamer}[09/09/2010, v1.0]

\LoadClassWithOptions{beamer}

\RequirePackage[utf8]{inputenc}
\usepackage[absolute,overlay]{textpos}
\usepackage{media9}	% Linux videos
\usepackage{multimedia}	% OS X videos
\usepackage{array}
\usepackage[T1]{fontenc}
\usepackage{helvet}

% biblio
\usepackage{silence}
\usepackage[doi=false,
            isbn=false,
            bibencoding=ascii,
            url=false,
            bibstyle=authoryear,
            giveninits=true,
            backend=bibtex]{biblatex}
\WarningFilter{biblatex}{Patching footnotes failed}     
\WarningFilter{etex}{Extended allocation} 
\AtEveryCitekey{\clearfield{note}\clearfield{number}\clearfield{volume}
                \clearfield{pages}\clearlist{location}\clearlist{publisher}
                \clearname{editor}
                }
                
\DeclareRobustCommand\smallcite[1]{
\footnotesize{\fullcite{#1}}}
\usepackage[super]{nth}

% centered and left-aligned tabular columns with custom width
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{L}[1]{>{\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% base beamer theme
\usetheme{Madrid}
\setbeamercovered{transparent}

% some custom colors
\definecolor{darkblue}{RGB}{46,54,61}
\definecolor{masterblue}{RGB}{0, 114, 216}
\definecolor{stiletto}{RGB}{154, 51, 52 }
\definecolor{duck}{RGB}{33, 124, 126}

% nobody likes big frame titles
\setbeamerfont{frametitle}{size=\scriptsize}

% text color
\setbeamercolor{title}{fg=darkblue,bg=}
\setbeamercolor{frametitle}{fg=darkblue,bg=}
\setbeamercolor{section in head/foot}{fg=darkblue,bg=}
\setbeamercolor{author}{fg=darkblue} 
\setbeamercolor{date}{fg=darkblue}
\setbeamercolor{itemize text}{fg=darkblue, bg=} 
\setbeamercolor{normal text}{fg=darkblue, bg=} 
% table of contents
\setbeamercolor{section number projected}{bg=darkblue,fg=white}
\setbeamercolor{section in toc shaded}{fg=darkblue, bg=}
\setbeamercolor{section in toc}{fg=darkblue, bg=}
\setbeamercolor{author in head/foot}{fg=darkblue, bg=} 
\setbeamercolor{title in head/foot}{fg=darkblue, bg=} 
\setbeamercolor{date in head/foot}{fg=darkblue, bg=} 

% items = small circles
\useinnertheme{circles}
\setbeamercolor{itemize item}{fg=stiletto,bg=}
\setbeamercolor{itemize subitem}{fg=duck,bg=}
\setbeamercolor{itemize subsubitem}{fg=masterblue,bg=}

% enumerate
\setbeamercolor{local structure}{fg=darkblue}


\def\beamer@entrycode{\vspace*{\baselineskip}}
\beamertemplatenavigationsymbolsempty
\hfuzz=10pt



% put a free-floating image
\DeclareRobustCommand\placeImage[4]{
% 1 - image file
% 2 - vertical position
% 3 - horizontal position
% 4 - horitontal size
\begin{textblock*}{#4}(#3,#2)
\includegraphics[width=\linewidth]{#1}
\end{textblock*}
}

\DeclareRobustCommand\placeImageOnly[4]{
% 1 - image file
% 2 - vertical position, default 7.87cm
% 3 - horizontal position, default 10.7cm
% 4 - horitontal size, default .15\paperwidth
\begin{textblock*}{#4}(#3,#2)
\only<+->{\includegraphics[width=\linewidth]{#1}}
\end{textblock*}
}

\DeclareRobustCommand\ocite[1]{
{\color{orange}[#1]}}


% auto TOC
\newcommand{\AutoTOC}[1]
{
\AtBeginSection[]
{
\begin{frame}{#1}
\begin{columns}
\column{.1\linewidth}~
\column{.8\linewidth}\footnotesize \tableofcontents[currentsection]
\column{.1\linewidth}
\end{columns}
\end{frame}
}}


% Maketitle without headline
\newcommand{\MakeTitleNoFoot}{
\begin{frame}[plain]
\placeImage{LogoECN}{7.8cm}{.2cm}{.2\paperwidth}
\placeImage{LogoIMARO}{8.1cm}{4.5cm}{.15\paperwidth}
\placeImage{LogoEMARO}{8.1cm}{7.5cm}{.15\paperwidth}
\placeImage{LogoJEMARO}{8.1cm}{10.cm}{.2\paperwidth}

 \titlepage
 %\setbeamercovered{transparent}
\end{frame}

% define default header after first frame
% frametitle
\setbeamertemplate{frametitle}
{% 
     \begin{beamercolorbox}[wd=\paperwidth,rounded=false,shadow=false]{frametitle} 
      \quad\quad \usebeamerfont{frametitle}\insertframetitle%
     \end{beamercolorbox} \vspace{-10pt}
      {\textcolor{masterblue}{\rule{\paperwidth}{.7pt}
      }}
}

% define default foot line after first frame
\setbeamertemplate{footline}
{
{\textcolor{masterblue}{\rule{\paperwidth}{.7pt}}}
  \hbox{
  \begin{beamercolorbox}[wd=.23\paperwidth,ht=2.25ex,dp=1ex,center]{fg=text}
 \insertshortauthor
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.68\paperwidth,ht=2.25ex,dp=1ex,center]{fg=text}
 \insertshorttitle
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.07\paperwidth,ht=2.25ex,dp=1ex,right]{fg=text}
    \insertframenumber{} / \inserttotalframenumber
    \hspace*{2ex} 
  \end{beamercolorbox}}%  
}
\addtocounter{framenumber}{-1}
}


% Okular videos (default)
\newcommand{\includevideo}[4]
{
\movie[poster,showcontrols,width=#3,height=#4]{
}{#1}
}
\newcommand{\includevideoloop}[4]
{
\movie[poster,loop,showcontrols,width=#3,height=#4]{
}{#1}
}


% OS X videos (Adobe player)
\newcommand{\videoOSX}{
\renewcommand{\includevideo}[4]{
\includemedia[activate=pageopen,width=##3,height=##4,addresource=##1,flashvars={src=##1 &  controlBarAutoHide=true & controlBarAutoHideTimeout=1 & autoRewind=false}]{\vidposter{##2}{##3}{##4}}{StrobeMediaPlayback.swf}
}
\renewcommand{\includevideoloop}[4]{
\includemedia[activate=pageopen,width=##3,height=##4,addresource=##1,flashvars={src=##1 &  controlBarAutoHide=true & controlBarAutoHideTimeout=1 & loop=true}]{\vidposter{##2}{##3}{##4}}{StrobeMediaPlayback.swf}
}
}

% compile without videos
\newcommand{\videoOFF}{
\renewcommand{\includevideo}[4]{\vidposter{##2}{##3}{##4}}
\renewcommand{\includevideoloop}[4]{\vidposter{##2}{##3}{##4}}
}


% verbatim text in a box
\newcommand{\vbbox}[1]
{\begin{center}
\framebox{\texttt{#1}}
\end{center}
}

% vertically centered image
\newcommand{\centeredgraphics}[2]
{
\raisebox{-.5\height}{\includegraphics[width=#2]{#1}}
}

% courtesy
\newcommand{\slidenote}[1]
{
\begin{textblock*}{.95\linewidth}(.5cm,8.8cm)\raggedleft
\tiny #1
\end{textblock*}
}
