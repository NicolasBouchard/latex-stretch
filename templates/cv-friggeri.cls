%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Based on Friggeri Resume/CV
% which has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Original author:
% Adrien Friggeri (adrien@friggeri.net)
% https://github.com/afriggeri/CV
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
% Important notes:
% Adapted by Nicolas Bouchard for pdfLaTeX
% which is easier to use on Linux
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Class
\ProvidesClass{cv}[2014/04/01 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%%% Packages
\RequirePackage{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{parskip}
\RequirePackage[absolute, overlay]{textpos}
\RequirePackage{hyperref}
\usepackage[utf8]{inputenc}

%\usepackage[french]{babel}

%%% Variables
\newcommand{\nom}{}
\newcommand{\prenom}{}

%%% Colors
\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

%%% Tikz
\newcommand{\tikzrectangle}{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=\hauteurrectangleH] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\selectfont\color{header}%
      {\prenom}~{\nom}%
    };
    \node [rectangle, fill=fillheader, anchor=south, minimum width=\paperwidth, minimum height=\hauteurrectangleB] (box) at (current page.south){};
  \end{tikzpicture}
}

%%% Canva
\newlength{\margedroite}
\newlength{\margegauche}
\newlength{\corpsgauche}
\newlength{\margehaut}
\newlength{\asidelength}
\newlength{\hauteurrectangleH}  % hauteur du rectangle du haut
\newlength{\hauteurrectangleB}  % hauteur du rectangle du haut
\setlength{\margegauche}{1cm}
\setlength{\margedroite}{2cm}
\setlength{\margehaut}{4.5cm}
\setlength{\asidelength}{4.5cm}
\setlength{\corpsgauche}{\margegauche}
\addtolength{\corpsgauche}{\asidelength}
\setlength{\hauteurrectangleH}{\margehaut}
\addtolength{\hauteurrectangleH}{-.5cm}
\setlength{\hauteurrectangleB}{.7cm}  % Doit être égale à la lettre

\addtolength{\asidelength}{-.5cm}

%%%% Style
\usepackage[left=\corpsgauche, right=\margedroite, top=\margehaut]{geometry}
\setlength{\parskip}{\medskipamount}%

\usepackage{avant}
\renewcommand*\familydefault{\sfdefault}
\usepackage[T1]{fontenc}
\color{gray}

\pagestyle{empty}
\usepackage[all]{background}
\SetBgContents{\tikzrectangle}
\SetBgPosition{current page.north west}
\SetBgOpacity{1.0}
\SetBgAngle{0.0}
\SetBgScale{1.0}

%%% Sections
\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \textbf{\LARGE\color{headercolor}%
    \@sectioncolor #1}%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
%\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{\color{headercolor}#2 }{#3}%
    \hfill%
    {\color{lightgray}\footnotesize #4}%
  }\\}
\newcommand{\entryetc}[5]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{\color{headercolor}#2 }{#3}%
    \hfill%
    {\color{lightgray}\footnotesize #4}\\%
    #5\vspace{\parsep}%
  }\\}
%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%
\newenvironment{aside}{%
  \let\oldsection\section%
  \renewcommand{\section}[1]{{\par\vspace{\baselineskip}\textbf{\Large\color{headercolor} ##1}}}%
  \begin{textblock*}{\asidelength}(\margegauche, \margehaut)%
  \begin{flushright}
  \obeycr%
  \vskip-\baselineskip% \par in inserted by textblock + one for section
}{%
  \restorecr
  \end{flushright}
  \end{textblock*}
  \let\section\oldsection
}

% %%%%%%%%%%%%%%%%
% % Bibliography %
% %%%%%%%%%%%%%%%%
% \RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}
% 
% \DeclareFieldFormat[article]{title}{#1\par}
% \DeclareFieldFormat[book]{title}{#1\par}
% \DeclareFieldFormat[inproceedings]{title}{#1\par}
% \DeclareFieldFormat[misc]{title}{#1\par}
% \DeclareFieldFormat[report]{title}{#1\par}
% 
% \DeclareBibliographyDriver{article}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \usebibmacro{journal+issuetitle}%
%     \setunit{\space}%
%     \printfield{pages}%
%     \newunit%
%     \printlist{publisher}%
%     \setunit*{\addcomma\space}%
%     \printfield{year}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }
% 
% \DeclareBibliographyDriver{book}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \printlist{publisher}%
%     \setunit*{\addcomma\space}%
%     \printfield{note}%
%     \setunit*{\addcomma\space}%
%     \printfield{year}%
%     \setunit{\addcomma\space}%
%     \printlist{location}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }
% 
% 
% \DeclareBibliographyDriver{inproceedings}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}%
%     \printfield{booktitle}%
%     \setunit{\addcomma\space}%
%     \printfield{year}%
%     \setunit{\addcomma\space}%
%     \printlist{location}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }
% 
% \DeclareBibliographyDriver{misc}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \printfield{booktitle}%
%     \setunit*{\addcomma\space}%
%     \printfield{note}%
%     \setunit*{\addcomma\space}%
%     \printfield{year}%
%     \setunit{\addcomma\space}%
%     \printlist{location}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }
% 
% \DeclareBibliographyDriver{report}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \printfield{type}%
%     \setunit{\space}%
%     \printfield{number}%
%     \setunit{\addcomma\space}%
%     \printfield{year}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }
% 
% \DeclareNameFormat{author}{%
%   \small\addfontfeature{Color=lightgray}%
%   \ifblank{#3}{}{#3\space}#1%
%   \ifthenelse{\value{listcount}<\value{liststop}}
%     {\addcomma\space}
%     {}%
% }
% 
% \newcommand{\printbibsection}[2]{
%   \begin{refsection}
%     \nocite{*}
%     \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
%   \end{refsection}
% }
% 
% \DeclareSortingScheme{chronological}{
%   \sort[direction=descending]{\field{year}}
%   \sort[direction=descending]{\field{month}}
% }
