% Dilesh Vallabh - 2022
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AcademicFormatWits-ExtendsMemoir}[2022/02/14 General format class for reports - v1.0]

\def\getDegreeLevel{postgraduate}

\DeclareOption{nonStandardParagraph}{\AtEndOfClass{\useWitsParagraphFormatting}}
\DeclareOption{useClickablePlots}{\AtEndOfClass{\ClickablePlots}}
\DeclareOption{useGlossaries}{\AtEndOfClass{\makeglossaries}}
\DeclareOption{useReferencesAndBibliography}{\AtEndOfClass{\UseReferencesAndBibliography}}
\DeclareOption{undergraduate}{\def\getDegreeLevel{undergraduate}}
%\DeclareOption{showBibliographyAccessDate}{\AtEndOfClass{\enableReferenceAccessedField}}

%\ExecuteOptions{11pt,openany,a4paper}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

\RequirePackage{xstring}
\IfSubStr{\@classoptionslist}{}
  {
  	\LoadClass[a4paper,11pt,openany]{memoir}
  }
  {
  	\LoadClass{memoir}
  }

%\LoadClass{memoir}

\AtEndOfClass{\useWitsParagraphFormatting}

\AtBeginDocument{
	\setMetadata
	\def\labelitemi{\ensuremath{\bullet}}
	\glsdisablehyper
	\enableReferenceAccessedField
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\RequirePackage{ifpdf}	%Allows automatic setting of a few pdf-related options
%\ifpdf
%\RequirePackage[pdftex]{graphicx}
%\RequirePackage{epstopdf}
%\else
\RequirePackage{graphicx}
%\fi
%\RequirePackage[left=2.50cm, right=2.50cm, top=2.50cm, bottom=2.50cm]{geometry}
\RequirePackage{epsfig}	%Allows insertion of certain graphics
\RequirePackage[centertags]{amsmath}	%Allows insertion of MANY maths symbols
\RequirePackage{amsthm,amsfonts,amssymb}	%Allows insertion of MANY maths symbols
\RequirePackage{bm}
\RequirePackage[british,iso]{isodate}	%Allows automatic insertion of formatted date strings
\RequirePackage{newlfont,bezier}
\RequirePackage{longtable,tabu}	%Allows specifcation of tabular evironments longer than 1 page
\RequirePackage{multirow}	%Allows specifcation of multirow entires in tabular environments
\RequirePackage{textcomp}
\RequirePackage{etoolbox}
\RequirePackage[british]{babel}
\RequirePackage{csquotes}
\RequirePackage[numbered]{libraries/mcode}
\RequirePackage{xcolor}
\RequirePackage{pdflscape}%Creates landscape pages
\RequirePackage{xifthen}	%Allows the use of command branching functions
\RequirePackage{rotating}	%Allows vertical text in tabular areas (amongst others)
\RequirePackage{marvosym}	%Allows insertion of engineering symbols
\RequirePackage{pdfpages}	%Allows inclusions of pages from external PDF documents
\RequirePackage{fixltx2e}	%Makes several corrections to LaTeX and enables text subscripts
\RequirePackage{wrapfig}	%Allows the insertion of figures in text with the text reflowed around them
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{subcaption}
\RequirePackage{lipsum}		%Used to generate dummy text
\RequirePackage{verbatim}
\RequirePackage[style=numeric,sorting=none,abbreviate=true,alldates=year,backref=true,hyperref=true,url=true,firstinits=true,uniquename=init,backend=biber,urldate=iso8601]{biblatex}
\RequirePackage[ocgcolorlinks,linkcolor=imperialBlue,urlcolor=blue,citecolor=imperialBlue,pdfborder={0 0 0},pageanchor=true,hyperindex=true,breaklinks=true,pagebackref=false,linktocpage=true,pdfhighlight=/P]{hyperref}	%Automatically hyperlinks sections, citations, etc. and allows manual inserton of hyperlinks
%\ifpdf
%\else
%\RequirePackage{hypdvips}	%Allows hyperref to compile properly in PS; comment out for compiling directly to PDF
%\fi
	%moved to allow later use
\RequirePackage[acronym,toc,nonumberlist,section=chapter]{glossaries}
%\RequirePackage{glossaries-extra}	%Used to create lists of symbols and acronyms, as well as glossaries

\RequirePackage[ocgcolorlinks]{ocgx2}
\RequirePackage{siunitx}
\RequirePackage{tikz}
\RequirePackage{pgfplots} % Allows for use of TikZ plots and optionally (as of Pgfplots 1.3):
\pgfplotsset{compat=newest}

\RequirePackage{catchfile}
\RequirePackage[color=red]{attachfile2} %Allows embedding of files in document, loaded last to prevent errors

\RequirePackage{eforms}

\definecolor{airforceblue}{RGB}{93, 138, 168}
\definecolor{royalBlueWeb}{RGB}{65, 105, 225}
\definecolor{royalBlue}{RGB}{0, 35, 102}
\definecolor{oxfordBlue}{RGB}{0, 33, 71}
\definecolor{imperialBlue}{RGB}{0, 90, 146}

\newglossary{symbols}{sym}{sbl}{List of Symbols}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-------------------------------- FORMATTING ---------------------------------%

\setsecnumdepth{paragraph}

\makeatletter
\IfSubStr{\@classoptionslist}{article}
  {
  \counterwithout{section}{chapter}
  \AtBeginEnvironment{appendices}{\renewcommand\thesection{\Alph{section}}}
  \settocdepth{subsubsection}
  \renewcommand*{\cftsectionfont}{\bfseries}
  \renewcommand*{\cftsectionpagefont}{\bfseries}
  \setlength{\cftsectionindent}{0em}
  \setlength{\cftbeforesectionskip}{1.0em \@plus\p@}
  \renewcommand*{\abstractnamefont}{\raggedright\normalfont\Large\bfseries}
  \def\getAbstractLevel{section}
  \def\getDeclarationLevel{section}
  \def\getDeclarationFont{{\raggedright \Large \bf Declaration\par
    	    \nobreak
    	    \vskip 40pt
    	  }}
  }
  {\settocdepth{subsubsection}
  \renewcommand*{\abstractnamefont}{\raggedright\normalfont\Huge\bfseries}
  \def\getAbstractLevel{chapter}
  \def\getDeclarationLevel{chapter}
  \def\getDeclarationFont{{\raggedright \Huge \bf Declaration\par
  	    \nobreak
  	    \vskip 40pt
  	  }}
  }
  
  \IfSubStr{\@classoptionslist}{useReferencesAndBibliography}
    {
    	\def\getNotCitedTitle{Bibliography}
    }
    {
    	\def\getNotCitedTitle{References}
    }
    
	\patchcmd{\@smemmain}{\cleardoublepage}{\clearpage}{}{}
	\patchcmd{\@smemmain}{\cleardoublepage}{\clearpage}{}{}
\makeatother

\renewcommand*{\abstracttextfont}{\normalfont}

\AtBeginDocument{
\setlength{\absparindent}{0em}
\setlength{\absleftindent}{0em}
\setlength{\absrightindent}{0em}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-------------------------------- Details ---------------------------------------%
\newcommand{\setTitle}[1]{\def\getTitle{#1}}

%\newcommand{\setAuthor}[2][]{
%\def\getAuthor{#2}
%\ifthenelse{\isempty{#1}}{\def\getAuthorSignature{\vspace*{2.5cm}\rule{6cm}{0.4pt} \par}}{
%\def\getAuthorSignature{\includegraphics[height=2.5cm]{#1}}}
%}
\newcommand{\setAuthor}[2][]{
\def\getAuthor{#2}
\ifthenelse{\isempty{#1}}{\def\getAuthorSignature{\sigField{Author Signature}{6cm}{2.5cm}\par}}{
\def\getAuthorSignature{\includegraphics[height=2.5cm]{#1}}}
}

\newcommand{\setLogo}[2]{
\def\getLogo{{\centering\includegraphics[height=#2]{#1}\par\vspace*{20pt}}}
}


\newcommand{\setSupervisor}[1]{\def\getSupervisor{#1}}
\newcommand{\setSubject}[1]{\def\getSubject{#1}}
\newcommand{\setInstitution}[1]{\def\getInstitution{#1}}
\newcommand{\setType}[1]{\def\getType{#1}}
\newcommand{\setFaculty}[1]{\def\getFaculty{#1}}
\newcommand{\setDegree}[1]{\def\getDegree{#1}}
\newcommand{\setLocale}[1]{\def\getLocale{#1}}
\newcommand{\setAbstract}[1]{\def\getAbstract{#1}}
\newcommand{\setKeywords}[1]{\def\getKeywords{#1}}

%------------------------------- Title and Declaration --------------------------%
\def\getLogo{\vspace*{50pt}}

\newcommand{\TitlePage}{
	\clearpage
	\thispagestyle{empty}
	\hyphenpenalty=10000       % Absolutely no hyphenation breaks
	%\vspace*{50pt}
	\getLogo
	{\Huge\bf \raggedright \getTitle \par}	%Inserts title
	\vspace*{30pt}
	
	%Insert author data, including group number if defined and required
	\hyphenpenalty=50
	%\pretolerance=100
	{\raggedright\Large\bf \getAuthor \par}
	%Insert student number for single undergraduate student
	\vspace*{1em}
	%Insert supervisor name for single undergraduate student, if defined
	\vspace*{\fill}
	\hyphenpenalty=10000
	{\raggedright A \getType\ submitted to the Faculty of \getFaculty, \getInstitution, in partial fulfilment of the requirements for the degree of \getDegree.}\par
	\vspace*{2em}
	{\raggedright \getLocale , \origdate\today}
	\hyphenpenalty=50
	\clearpage
}

\newcommand{\DeclarationPage}{
	%Declaration page header item
	\thispagestyle{empty}
	  \vspace*{50pt}%
	  %{\raggedright \LARGE \bf Declaration\par
	  %  \nobreak
	  %  \vskip 40pt
	  %}
	  \getDeclarationFont
	  
	%Add declaration to Table of Contents
	\phantomsection
	\addcontentsline{toc}{\getDeclarationLevel}{Declaration}
	%Declaration body text
	{\raggedright
	I declare that this \getType\ is my own, unaided work, except where otherwise acknowledged. It is being submitted for the degree of \getDegree\ in the \getInstitution. It has not been submitted before for any degree or examination at any other university.}\par
	
	\vspace*{\fill}
	%Declaration signatures

	{\raggedright Signed this \origdate\today \par
	\getAuthorSignature \par
	\getAuthor}

	\vspace*{10pt}
	\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\addAcronymsSymbolsResource}[1]{
	\input{#1}
}

\newcommand{\useWitsParagraphFormatting}{
\abnormalparskip{\baselineskip}
\setlength{\parindent}{0pt}
\OnehalfSpacing
\setlrmarginsandblock{2.5cm}{2.5cm}{*}
\setulmarginsandblock{2.5cm}{*}{1}
\checkandfixthelayout
%\abstractintoc
}

\newcommand{\enableReferenceAccessedField}{\DefineBibliographyStrings{english}{urlseen={Accessed:}}}

\newcommand{\printAcronymsSymbols}{\printglossary[type=\acronymtype,style=super,title=List of Acronyms]
%\pagebreak		
\glsaddall
\printglossary[type=symbols,style=super]}

\newcommand{\makeSimplePreamble}{
\frontmatter
\TitlePage
\DeclarationPage
\clearpage

\begin{Abstract}
	%\addcontentsline{toc}{chapter}{Abstract}
	\getAbstract
\end{Abstract}

\clearpage
\tableofcontents*
\clearpage
\listoffigures
\clearpage
\listoftables
\clearpage
\Glossaries
\mainmatter
}

\newcommand{\References}{
\clearpage
\printbibliography[title={References},category=cited]
\printbibliography[title={\getNotCitedTitle},notcategory=cited]
\clearpage
}

\newcommand{\ClickablePlots}{
\pgfplotsset{plot coordinates/math parser=true}
\usetikzlibrary{pgfplots.clickable}
\pgfplotsset{annot/slope format={Gradient = \%.3f; Constant = \%.3f}}
\pgfplotsset{annot/point format={(\%.3f, \%.3f)}}
\pgfplotsset{annot/point format 3d={(\%.3f, \%.3f, \%.3f)}}
\pgfplotsset{annot/js fillColor={["RGB", 1, 1, 1]}}
}

\newcommand{\UseReferencesAndBibliography}{
\DeclareBibliographyCategory{cited}
\AtEveryCitekey{\addtocategory{cited}{\thefield{entrykey}}}
\nocite{*}
}

\newcommand{\setMetadata}{
\hypersetup{pdfauthor={\getAuthor},
            pdftitle={\getTitle},
            pdfsubject={\getSubject},
            pdfkeywords={\getKeywords},
            pdfinfo={
            		Supervisor={\getSupervisor},
   	            	Institution={\getInstitution},
   	            	Faculty={\getFaculty},
   	            	Type={\getType},
   	            	Location={\getLocale},
	            }
          }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------- Environments -----------------------------------%

\newenvironment{FrontMatter}{\frontmatter}{\mainmatter}

\newenvironment{Abstract}{\begin{abstract}\phantomsection \addcontentsline{toc}{\getAbstractLevel}{Abstract}}{\end{abstract}}



\endinput



