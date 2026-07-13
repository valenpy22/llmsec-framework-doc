% llmsec.cls — Clase LaTeX para el documento del marco LLM-Sec
% Compilar con: xelatex o lualatex
% Valentina Paz Campos Olguín — USACH DIINF, 2026

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{llmsec}[2026/07/08 LLM-Sec Framework Document Class]

\LoadClass[11pt, a4paper, openany]{book}

% ──────────────────────────────────────────────
% Paquetes base
% ──────────────────────────────────────────────
\RequirePackage[top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry}
\RequirePackage{fontspec}
\RequirePackage[spanish]{babel}
\RequirePackage[table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{enumitem}
\RequirePackage{tikz}
\RequirePackage[most]{tcolorbox}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage{hyperref}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{parskip}
\RequirePackage{lastpage}
\RequirePackage{amssymb}

% ──────────────────────────────────────────────
% Paleta de colores (anclada a #1e5eff)
% ──────────────────────────────────────────────
\definecolor{llmsec-primary}{HTML}{1E5EFF}
\definecolor{llmsec-dark}{HTML}{0A2463}
\definecolor{llmsec-medium}{HTML}{3D7BFF}
\definecolor{llmsec-light}{HTML}{E8F0FE}
\definecolor{llmsec-accent}{HTML}{0D47A1}
\definecolor{llmsec-gray}{HTML}{F5F7FA}
\definecolor{llmsec-text}{HTML}{1A1A2E}
\definecolor{llmsec-muted}{HTML}{6B7280}

% Colores por tipo funcional
\definecolor{ctrl-preventivo}{HTML}{1565C0}
\definecolor{ctrl-detectivo}{HTML}{0277BD}
\definecolor{ctrl-correctivo}{HTML}{00838F}
\definecolor{ctrl-gobernanza}{HTML}{4527A0}

% Colores por nivel
\definecolor{level-n0}{HTML}{B0BEC5}
\definecolor{level-n1}{HTML}{90CAF9}
\definecolor{level-n2}{HTML}{42A5F5}
\definecolor{level-n3}{HTML}{1E88E5}
\definecolor{level-n4}{HTML}{1565C0}
\definecolor{level-n5}{HTML}{0D47A1}

% ──────────────────────────────────────────────
% Tipografía
% ──────────────────────────────────────────────
\setmainfont{Roboto}
\setsansfont{Roboto}
\setmonofont{DejaVu Sans Mono}[Scale=0.85]
\renewcommand{\familydefault}{\sfdefault}

% ──────────────────────────────────────────────
% Hyperref
% ──────────────────────────────────────────────
\hypersetup{
  colorlinks  = true,
  linkcolor   = llmsec-accent,
  citecolor   = llmsec-accent,
  urlcolor    = llmsec-primary,
}

% ──────────────────────────────────────────────
% Formato de capítulos
% ──────────────────────────────────────────────
\titleformat{\chapter}[display]
  {\normalfont\huge\bfseries\color{llmsec-dark}}
  {\chaptertitlename\ \thechapter}
  {6pt}
  {\Huge}

\titleformat{name=\chapter,numberless}[display]
  {\normalfont\huge\bfseries\color{llmsec-dark}}
  {}
  {0pt}
  {\Huge}

\titleformat{\section}
  {\normalfont\Large\bfseries\color{llmsec-dark}}
  {\thesection}{1em}{}

\titleformat{\subsection}
  {\normalfont\large\bfseries\color{llmsec-accent}}
  {\thesubsection}{1em}{}

\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries\color{llmsec-medium}}
  {\thesubsubsection}{1em}{}

% ──────────────────────────────────────────────
% Encabezados y pies
% ──────────────────────────────────────────────
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE]{\small\color{llmsec-muted}\textbf{LLM-Sec} --- Marco de Evaluación de Ciberseguridad}
\fancyhead[RO]{\small\color{llmsec-muted}\leftmark}
\fancyfoot[C]{\small\color{llmsec-muted}\thepage\ / \pageref{LastPage}}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{llmsec-primary}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[C]{\small\color{llmsec-muted}\thepage\ / \pageref{LastPage}}
  \renewcommand{\headrulewidth}{0pt}
}

% ──────────────────────────────────────────────
% Cajas tcolorbox
% ──────────────────────────────────────────────

% Caja genérica de control
\newtcolorbox{controlbox}[2][]{%
  enhanced,
  breakable=false,
  colback     = llmsec-gray,
  colframe    = llmsec-primary,
  coltitle    = white,
  fonttitle   = \bfseries\small,
  title       = {#2},
  left        = 6pt,
  right       = 6pt,
  top         = 4pt,
  bottom      = 4pt,
  boxrule     = 0.8pt,
  arc         = 2pt,
  toptitle    = 3pt,
  bottomtitle = 3pt,
  #1
}

% Caja de nivel de madurez
\newtcolorbox{levelbox}[2][]{%
  enhanced,
  colback   = white,
  colframe  = #2,
  coltitle  = white,
  colbacktitle = #2,
  fonttitle = \bfseries,
  left      = 8pt,
  right     = 8pt,
  top       = 6pt,
  bottom    = 6pt,
  boxrule   = 1pt,
  arc       = 3pt,
  #1
}

% Caja informativa
\newtcolorbox{infobox}[1][]{%
  enhanced,
  breakable,
  colback   = llmsec-light,
  colframe  = llmsec-medium,
  left      = 8pt,
  right     = 8pt,
  top       = 6pt,
  bottom    = 6pt,
  boxrule   = 0.6pt,
  arc       = 2pt,
  #1
}

% Caja de ficha de proceso
\newtcolorbox{fichabox}[2][]{%
  enhanced,
  colback      = white,
  colframe     = llmsec-dark,
  coltitle     = white,
  colbacktitle = llmsec-dark,
  fonttitle    = \bfseries,
  title        = {#2},
  left         = 8pt,
  right        = 8pt,
  top          = 6pt,
  bottom       = 6pt,
  boxrule      = 1pt,
  arc          = 3pt,
  #1
}

% ──────────────────────────────────────────────
% Badges / etiquetas inline
% ──────────────────────────────────────────────
\newcommand{\badge}[2]{%
  \tikz[baseline=(badge.base)]{%
    \node[fill=#1, text=white, rounded corners=2pt,
          inner xsep=5pt, inner ysep=1.5pt,
          font=\scriptsize\bfseries] (badge) {#2};%
  }%
}

\newcommand{\badgePreventivo}{\badge{ctrl-preventivo}{Preventivo}}
\newcommand{\badgeDetectivo}{\badge{ctrl-detectivo}{Detectivo}}
\newcommand{\badgeCorrectivo}{\badge{ctrl-correctivo}{Correctivo}}
\newcommand{\badgeGobernanza}{\badge{ctrl-gobernanza}{Gobernanza}}
\newcommand{\badgeNivel}[1]{\badge{level-n#1}{N#1}}
\newcommand{\badgeConfig}{\badge{llmsec-muted}{Configuración}}
\newcommand{\badgeExperimental}{\badge{llmsec-medium}{Experimental}}
\newcommand{\badgeDeclarativo}{\badge{llmsec-accent}{Declarativo}}

% ──────────────────────────────────────────────
% Comando \control
% ──────────────────────────────────────────────
% Uso: \control{ID}{nivel}{Tipo}{Evidencia}{Descripción}{Fuente}
\newcommand{\control}[6]{%
  \begin{controlbox}{\texttt{#1} \hfill \badgeNivel{#2}}
    #5

    \vspace{4pt}
    {\small\color{llmsec-muted}%
    \textbf{Tipo:} #3 \quad
    \textbf{Evidencia:} #4 \quad
    \textbf{Fuente:} #6}
  \end{controlbox}
  \vspace{4pt}
}

% ──────────────────────────────────────────────
% Tipos de columna
% ──────────────────────────────────────────────
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}

% ──────────────────────────────────────────────
% Portada
% ──────────────────────────────────────────────
\newcommand{\portada}[3]{%
  % #1 = versión, #2 = fecha, #3 = subtítulo
  \begin{titlepage}
    \newgeometry{margin=0pt}
    \noindent
    \begin{tikzpicture}[remember picture, overlay]
      % Fondo
      \fill[llmsec-dark] (current page.south west) rectangle (current page.north east);
      % Banda lateral derecha
      \fill[llmsec-primary] ([xshift=-2.5cm]current page.north east) rectangle (current page.south east);
    \end{tikzpicture}%
    \vspace*{\fill}
    \begin{center}
      \begin{tikzpicture}
        \node[
          fill=white, rounded corners=6pt,
          minimum width=13cm, minimum height=7.5cm,
          text width=11.5cm, align=center,
          inner sep=18pt
        ] {
          {\fontsize{12}{16}\selectfont\color{llmsec-muted}\bfseries
            MARCO DE EVALUACIÓN DE CIBERSEGURIDAD\par}
          \vspace{10pt}
          {\fontsize{48}{54}\selectfont\color{llmsec-dark}\titlefont
            LLM-Sec\par}
          \vspace{8pt}
          {\fontsize{13}{17}\selectfont\color{llmsec-primary}
            Evaluación de la postura de ciberseguridad\par
            en plataformas que integran LLM\par}
          \vspace{6pt}
          {\small\color{llmsec-muted}#3\par}
        };
      \end{tikzpicture}
    \end{center}
    \vspace*{\fill}
    \begin{center}
      {\color{white}\small Valentina Paz Campos Olguín\par}
      \vspace{2pt}
      {\color{white}\small Universidad de Santiago de Chile\enspace|\enspace DIINF\par}
      \vspace{6pt}
      {\color{white}\footnotesize Versión #1\enspace|\enspace #2\par}
    \end{center}
    \vspace{2cm}
    \restoregeometry
  \end{titlepage}
}

\renewcommand{\contentsname}{Contenidos}

\newfontfamily{\titlefont}{Roboto Black}

\endinput