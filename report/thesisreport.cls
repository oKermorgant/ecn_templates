\pdfminorversion=5
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesisreport}[09/09/2010, v1.0]
\LoadClass[12pt,a4paper]{book}

\usepackage[utf8]{inputenc}
\usepackage[namelimits,sumlimits]{amsmath}
\usepackage{amsfonts,amssymb,amsthm}
\usepackage{graphicx}
\usepackage[hidelinks]{hyperref}
\usepackage{fancyhdr}
\usepackage{url}
\usepackage[hmargin=2cm,vmargin=2cm]{geometry}
\usepackage{array}
\usepackage{dirtree}
\usepackage{enumitem}
\usepackage[explicit]{titlesec}
\usepackage{etoolbox}

\makeatletter
\patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}
\patchcmd{\ttlh@hang}{\noindent}{}{}{}
\makeatother

\fancyhead{}
\renewcommand{\headrulewidth}{0.pt}

\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\titleformat{\chapter}[display] {\raggedleft\fontsize{14pt}{12pt}\sc}{{\chaptertitlename\ \thechapter}}{5pt}{{\raggedleft\bf\Huge #1} \vspace{5pt}  \hrule}  

