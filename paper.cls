\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}

\newif\ifdraft
\newif\ifarxiv

\DeclareOption{draft}{
    \drafttrue
}
\DeclareOption{arxiv}{
    \arxivtrue
}
\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{acmart}
}
\ProcessOptions

\LoadClass[acmsmall]{acmart}
\renewcommand\footnotetextcopyrightpermission[1]{}
\settopmatter{printfolios=true, printacmref=false}

\frenchspacing

\bibliographystyle{abbrv}

\RequirePackage{xspace}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{enumitem}
\RequirePackage[framemethod=tikz]{mdframed}
\mdfdefinestyle{protocol}{,,roundcorner=10pt,}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{braket}
\RequirePackage{tikz}
\RequirePackage{amsthm}

\hypersetup{linkcolor=blue}

\theoremstyle{definition}
\newtheorem{invariant}{Invariant}
\newtheorem{principle}{Principle}

\def\Snospace~{\S{}}
% Autoref
\def\chapterautorefname{Chapter}
\def\sectionautorefname{\Snospace}
\def\subsectionautorefname{\Snospace}
\def\subsubsectionautorefname{\Snospace}
\def\appendixautorefname{Appendix}
\def\thmautorefname{Theorem}
\def\lemautorefname{Lemma}
\def\defnautorefname{Definition}
\def\algorithmautorefname{Algorithm}
\def\invariantautorefname{Invariant}
\def\principleautorefname{Principle}

\algnewcommand\algorithmicswitch{\textbf{switch}}
\algnewcommand\algorithmiccase{\textbf{case}}
\algdef{SE}[SWITCH]{Switch}{EndSwitch}[1]{\algorithmicswitch\ #1\ \algorithmicdo}{\algorithmicend\ \algorithmicswitch}
\algdef{SE}[CASE]{Case}{EndCase}[1]{\algorithmiccase\ #1}{\algorithmicend\ \algorithmiccase}
\algtext*{EndSwitch}
\algtext*{EndCase}

\usetikzlibrary{shapes.geometric, arrows, matrix}

\IfFileExists{macros.tex}{\input{macros}}{}
