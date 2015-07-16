%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Letter template
%
% Original author:
% Nicolas Bouchard (nicolas.bouchard.1@gmail.com)
% https://github.com/NicolasBouchard/
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
% Important notes:
% - Based on Friggeri Resume/CV which has been downloaded from:
%   http://www.LaTeXTemplates.com
% - This class provides a template for french letters.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Class
\ProvidesClass{letter-friggeri}[2015/06/12 Letter class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@letter@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%%% Packages
\usepackage[utf8]{inputenc}
\usepackage[francais]{babel}
\usepackage{lmodern}
\usepackage{xcolor}
\usepackage{tikz}
\usetikzlibrary{calc}
\usepackage[allbordercolors=lightgray, pdfborderstyle={/S/U/W 1}]{hyperref}
\usepackage[all]{background}

\usepackage{ifthen}
\newcommand{\ifnonempty}[2]{%
  \ifthenelse{\equal{#1}{}}{}{#2}%
}

%%% Debug
% \usepackage{showframe}  % Pour faire des tests

%%% Canva variables
\newlength{\marge}
\newlength{\margehaut}  % Haut de la page et infolocale/corps sur page 2 et +
\newlength{\margepliage}  % Haut de la page et trait de pliage
\newlength{\espacepliage}  % Haut du corps et début de la lettre (1ère page)
\newlength{\hauteurrectangle}  % Hauteur des rectangles en haut et en bas
\newlength{\margesignature}  % Gauche de la signature et marge de droite

%%% Canva settings
\setlength{\marge}{2.5cm}
\setlength{\margehaut}{1.5cm}
\setlength{\hauteurrectangle}{.75cm}
\setlength{\margepliage}{.333\paperheight}
\setlength{\espacepliage}{\margepliage}
\addtolength{\espacepliage}{-\margehaut}
\addtolength{\espacepliage}{-1.5\baselineskip}
\setlength{\margesignature}{7cm}

%%% Line skip variables
\newlength{\infoexplineskip}  % Line skip for expeditor section
\newlength{\infoparalineskip}  % Line skip after para section
\newlength{\infocontactamount}  % Vertical skip prior to infocontact
\newlength{\infogeoamount}  % Vertical skip prior to infogeo
\newlength{\infoparaamount}  % Vertical skip prior to infopara

%%% Line skip settings
%%% (Those setted to -\baselineskip as default are changed
%%% if field is non empty)
\setlength{\infoexplineskip}{.35\baselineskip}\addtolength{\infoexplineskip}{-\baselineskip}
\setlength{\infoparalineskip}{1.5\baselineskip}\addtolength{\infoparalineskip}{-\baselineskip}
\setlength{\infocontactamount}{-\baselineskip}
\setlength{\infogeoamount}{-\baselineskip}
\setlength{\infoparaamount}{-\baselineskip}
\setlength{\parskip}{.8\medskipamount}%

%%% Non optional field variables
\def\prenom#1{\def\@prenom{#1}}
\def\nom#1{\def\@nom{#1}}
\def\destinataire#1{\def\@destinataire{#1}}


%%% Optional field variables
%%% with their default behaviour
\def\jour#1{\def\@jour{#1}}\jour{\today}
\def\destination#1{\def\@destination{#1}}\destination{}
\def\ouverture#1{\def\@ouverture{#1}}\ouverture{Madame, Monsieur,}
\def\salutation#1{\def\@salutation{#1}}\salutation{Cordialement,}
\def\signature#1{\def\@signature{#1}}\signature{\@prenom~\@nom}
\def\avecpage{\def\@page{\thepage}}\def\@page{}
%%% Those definitions trigger extra characters or line skip
%%% (See Line skip settings)
\def\telephone#1{
  \def\@telephone{#1}
  \ifnonempty{#1}{
    \def\@telephone{#1\\}
    \setlength{\infocontactamount}{\infoexplineskip}
  }
}
\telephone{}
\def\courriel#1{
  \def\@courriel{#1}
  \ifnonempty{#1}{
    \def\@courriel{#1\\}
    \setlength{\infocontactamount}{\infoexplineskip}
  }
}
\courriel{}
\def\adresse#1{
  \def\@adresse{#1}
  \ifnonempty{#1}{
    \setlength{\infogeoamount}{\infoexplineskip}
  }
}
\adresse{}
\def\reference#1{
  \def\@reference{}
  \ifnonempty{#1}{
    \def\@reference{Réf: {#1}\\}
    \setlength{\infoparaamount}{\infoparalineskip}
  }
}
\def\lieu#1{
  \def\@lieu{}
  \ifnonempty{#1}{
    \def\@lieu{{#1},~}
  }
}
\lieu{}
\reference{}
\def\objet#1{
  \def\@objet{}
  \ifnonempty{#1}{
    \def\@objet{\textbf{Objet: {#1}}\\}
    \setlength{\infoparaamount}{\infoparalineskip}
  }
}
\objet{}
\def\piecejointe#1{
  \def\@piecejointe{}
  \ifnonempty{#1}{
    \def\@piecejointe{{#1}\\}  % Le "Pièce jointe:" est omis pour le pluriel
    \setlength{\infoparaamount}{\infoparalineskip}
  }
}
\piecejointe{}


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
\ifdefined\@letter@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{white}{black}
\fi

%%% Preformatted text
\def\@infoexp{
  \@prenom~\@nom\\ \\[\infocontactamount]
  \@telephone\@courriel\\[\infogeoamount]
  \@adresse
}

\def\@infolocale{
  \@lieu\@jour
}

\def\@infodest{
  \textbf{\@destinataire}\\
  \@destination
}

\def\@infopara{
  \par{\noindent\@reference%
  \@objet%
  \@piecejointe\\[\infoparaamount]%
  }%
}

\newcommand{\cloture}{%
  \vskip\infoparaamount\vskip\baselineskip
  \par{\noindent\@salutation}%
  \begin{flushright}%
    \parbox{\margesignature}{\@signature}%
  \end{flushright}%
}

%%% Tikz
\newcommand{\tikzrectangle}{%
\begin{tikzpicture} [remember picture, overlay]
  \node [rectangle, fill=gray, anchor=north, minimum width=\paperwidth, minimum height=\hauteurrectangle] (box-top) at (current page.north) {};
  \node [rectangle, fill=gray, anchor=south, minimum width=\paperwidth, minimum height=\hauteurrectangle] (box-bottom) at (current page.south) {};
  \node [rectangle, fill=blue, anchor=north west, minimum width=\hauteurrectangle, minimum height=\hauteurrectangle] at (current page.north west) {};
  \node [rectangle, fill=red, anchor=north west, minimum width=\hauteurrectangle, minimum height=\hauteurrectangle] at ($(current page.north west) + (\hauteurrectangle, 0)$) {};
  \node [rectangle, fill=orange, anchor=north west, minimum width=\hauteurrectangle, minimum height=\hauteurrectangle] at ($(current page.north west) + (2\hauteurrectangle, 0)$) {};
  \coordinate (numeropage) at ($(current page.south east) + (-1.05\marge, .3\hauteurrectangle)$);
  \draw (numeropage) node [anchor=south east, color=white] {\@page};
\end{tikzpicture}%
}

\newcommand{\tikzpage}{
  \begin{tikzpicture} [remember picture, overlay]%
    \coordinate (numeropage)  at ($(current page.south east) + (-1.05\marge, .3\hauteurrectangle)$);
    \draw (numeropage) node [anchor=south east, color=white] {\@page};
  \end{tikzpicture}%
}

\newcommand{\tikzpageprint}{
  \begin{tikzpicture} [remember picture, overlay]%
    \coordinate (numeropage)  at ($(current page.south east) + (-1.05\marge, 1.3\hauteurrectangle)$);
    \draw (numeropage) node [anchor=south east, color=white] {\@page};
  \end{tikzpicture}%
}

\newcommand{\tikzpliage}{%
\begin{tikzpicture} [remember picture, overlay]
  \coordinate (pliage) at ($(current page.north west) + (0, -\margepliage)$);
  \path [draw, dashed, color=lightgray] (pliage) -- ($(pliage) + (3\hauteurrectangle, 0)$);
\end{tikzpicture}%
}

\newcommand{\tikzinfoexp}{%
\begin{tikzpicture} [remember picture, overlay]
  \coordinate (infoexp) at ($(current page.north west) + (\marge, -\margehaut)$);
  \draw (infoexp) node [anchor=north west] {\parbox{6cm}{\@infoexp}};
\end{tikzpicture}%
}

\newcommand{\tikzinfodest}{%
\begin{tikzpicture} [remember picture, overlay]
  \coordinate (infodest) at ($(current page.north west) + (\marge, -.65\margepliage)$);
  \draw (infodest) node [anchor=north west] {\parbox{10cm}{\@infodest}};
\end{tikzpicture}%
}

\newcommand{\tikzinfolocale}{%
\begin{tikzpicture} [remember picture, overlay]
  \coordinate (infolocale) at ($(current page.north east) + (-\marge, -\margehaut)$);
  \draw (infolocale) node [anchor=north east] {\parbox{8cm}{\normalsize\raggedleft\@infolocale}};
\end{tikzpicture}%
}

% %%% Style
\usepackage[margin=\marge, top=\margehaut]{geometry}
\usepackage{avant}
\renewcommand*\familydefault{\sfdefault}
\usepackage[T1]{fontenc}

\pagestyle{empty}
\ifdefined\@letter@print
  \SetBgContents{\tikzpageprint}
  \SetBgPosition{current page.north west}
  \SetBgOpacity{1.0}
  \SetBgAngle{0.0}
  \SetBgScale{1.0}
\else
  \SetBgContents{\tikzrectangle\tikzpage}
  \SetBgPosition{current page.north west}
  \SetBgOpacity{1.0}
  \SetBgAngle{0.0}
  \SetBgScale{1.0}
\fi

%%% Entête
\AtBeginDocument{%
\tikzpliage%
\tikzinfoexp%
\tikzinfodest%
\tikzinfolocale%
\vskip\espacepliage%
\@infopara%
{\noindent\@ouverture}\par}

%%% Fin de la lettre
\AtEndDocument{}
