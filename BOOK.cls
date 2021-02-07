\LoadClassWithOptions{article}

\setlength{\parskip}{5pt plus 1pt}
\usepackage[a5paper]{geometry}

\usepackage{xcolor}
\RequirePackage{graphicx}
\usepackage{enumitem}
\usepackage[most]{tcolorbox}
\usepackage{indentfirst}
\usetikzlibrary{calc}
\usepackage{subfiles}
\usepackage{fancyhdr}
\usepackage{amsfonts}
\usepackage{tikz}
\usepackage{titletoc}

\RequirePackage[extrafootnotefeatures]{xepersian}
\settextfont[
    Path={./fonts/},
    BoldFont={IRLotusICEE_Bold.ttf},
    BoldItalicFont={IRLotusICEE_BoldIranic.ttf},
    ItalicFont={IRLotusICEE_Iranic.ttf},Scale=1.2
    ]{IRZar.ttf}
\setdigitfont[Path={./fonts/}]{IRZar.ttf}

\pagestyle{fancy}
\fancyhf{}
\rhead{}
\rfoot{\thepage}

\newcommand{\centerimage}[2]{
    \begin{center}
        \includegraphics[width=#1\linewidth]{#2}        
    \end{center}
}

\renewcommand{\theenumi}{\Alph{enumi}}


% Colors
%--------------------------------------------------------------------------
\RequirePackage{xcolor}
\definecolor{sectionblue}{RGB}{70,130,180}
\definecolor{subsectionblue}{RGB}{100,160,200}
\definecolor{extraorange}{RGB}{255,138,88}
\definecolor{factblue}{RGB}{23,74,117}
\definecolor{definitiongreen}{RGB}{21,122,81}
\definecolor{extrayellow}{RGB}{255,185,88}
\definecolor{tsgrey}{RGB}{200,200,200}
\definecolor{solutiongreen}{rgb}{0.1,0.7,0.1}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}


% Chapter styling
%--------------------------------------------------------------------------
\newcounter{chapter}

\newcommand{\CHAPTER}[3][./images/background.jpg]{
    \newpage
    \thispagestyle{empty}
    \refstepcounter{chapter}
    \rhead{#2}
    
    \begin{tikzpicture}[remember picture,overlay]
        \node at (current page.north west) {
            \begin{tikzpicture}[remember picture,overlay]
                \node[anchor=north west,inner sep=0pt] at (0,0) {
                    \includegraphics[width=\paperwidth]{#1}
                };
            \end{tikzpicture}
        };
    \end{tikzpicture}
    
    \vspace*{\fill}

    فصل \medskip{~\thechapter}

    {\Huge #2}
    
    \vspace{1.5cm}

    #3

    \newpage
    \lhead{فهرست مطالب}
    \startlist{toc}
    {\huge فهرست مطالب}
    \printlist{toc}{}

    \newpage
}

% Section styling
%--------------------------------------------------------------------------
\newcommand{\SECTION}[1]{
    \lhead{#1}
    \section*{\color{sectionblue}{#1}}
    \vspace{-12mm}
    {\textcolor{sectionblue}{\noindent\rule{\textwidth}{0.8pt}}}
    \addcontentsline{toc}{section}{#1}

}

% SubSection styling
%--------------------------------------------------------------------------
\newcommand{\SUBSECTION}[1]{
    \subsection*{\hspace{7mm}\color{subsectionblue}{#1}}
    \vspace{-12mm}
    {\textcolor{subsectionblue}{\noindent\rule{0.4\textwidth}{0.8pt}}}
    \addcontentsline{toc}{subsection}{#1}

}

% Definition styling
%--------------------------------------------------------------------------
\newenvironment{definition}
{\begin{tcolorbox}[
    enhanced jigsaw,
    breakable,
    pad at break*=1mm,
    colback=yellow!10!white,
    boxrule=0pt,
    frame hidden,
    borderline east={1.5mm}{-2mm}{definitiongreen}]
    \hspace{3mm}}
{\end{tcolorbox}}

% focused
%--------------------------------------------------------------------------
\newcommand{\focused}[1]{‌{\scriptsize\color{magenta}{#1}}}

% Note
%--------------------------------------------------------------------------
\newcommand{\NOTE}[1]{

    \vspace{3mm}
    {\hspace{-1.5cm}{\includegraphics[width=5mm]{./images/notemark.png}}}
    \hspace{6.5mm} #1
    
}

% theorem styling
%--------------------------------------------------------------------------
\newenvironment{theorem}
{\begin{tcolorbox}[
    enhanced jigsaw,
    breakable,
    pad at break*=1mm,
    colback=factblue!5,
    colframe=factblue!50]
    \hspace{3mm}}
{\end{tcolorbox}}

\newenvironment{fact}
{\begin{theorem}}
{\end{theorem}}

% problem styling
%--------------------------------------------------------------------------
\newcounter{problem}[chapter]

\newenvironment{problem}[1][]
{\begin{tcolorbox}[
    enhanced jigsaw,
    breakable,
    pad at break*=1mm,
    colback=white,
    boxrule=0pt,
    frame hidden,
    borderline east={1.5mm}{-2mm}{black!10}]
    \hspace{-6.5mm}\colorbox{black!10}{\refstepcounter{problem}\par\medskip{~\theproblem}}
    \hspace{3mm}{\scriptsize\textbf{\textcolor{gray}{#1}}}

\vspace{1mm}\hspace{3mm}}
{\end{tcolorbox}}

% problem solution mark
\newcommand{\problemsolutionmark}[1][پاسخ.]{
    \vspace{2mm}\hspace{-3mm}{\scriptsize\color{solutiongreen}{#1}}
}

% problem solution
\newcommand{\solution}[2][پاسخ.]{
    
    \problemsolutionmark[#1]
    
    \begin{itshape}
        \hspace{3mm}
        #2
    \end{itshape}
}

\newcommand{\problemsolution}[2][پاسخ.]{
    \solution[#1]{#2}
}

% end problem
\newcommand{\Eproblem}[0]{
    \begin{tcolorbox}[
        enhanced jigsaw,
        breakable,
        pad at break*=1mm,
        colback=white,
        boxrule=0pt,
        frame hidden,
        borderline north={1.5mm}{-1mm}{black!10}]
    \vspace{-10mm}\hspace{-5mm}{\colorbox{black!10}{\refstepcounter{problem}\par\medskip{~\theproblem}}}
    \end{tcolorbox}
    \vspace{1mm}
}
% "Don't Make Mistake" problem
\newcommand{\DMMproblem}[0]{
    \Eproblem
}

% DMMproblem wrong solution mark
\newcommand{\DMMproblemWsolutionmark}[1][پاسخ غلط.]{
    \vspace{-3mm}\hspace{-5.5mm}\colorbox{red!10}{\scriptsize\color{red}{#1}}
    \vspace{1mm}
}

% DMMproblem wrong solution
\newcommand{\Ewrongsolution}[2][پاسخ غلط.]{
    \begin{tcolorbox}[
        enhanced jigsaw,
        breakable,
        pad at break*=1mm,
        colback=white,
        boxrule=0pt,
        frame hidden,
        borderline east={1.5mm}{-2mm}{red!10}]

        \DMMproblemWsolutionmark[#1]
        
        \begin{itshape}
            \hspace{3mm}
            #2
        \end{itshape}

    \end{tcolorbox}
}

\newcommand{\DMMproblemWsolution}[2][پاسخ غلط.]{
    \Ewrongsolution[#1]{#2}
}

% end problem solution mark
\newcommand{\Eproblemsolutionmark}[1][پاسخ.]{
    \vspace{-3mm}\hspace{-5.5mm}\colorbox{green!10}{\scriptsize\color{solutiongreen}{#1}}
    \vspace{1mm}
}

% end problem solution
\newcommand{\Esolution}[2][پاسخ.]{
    \begin{tcolorbox}[
        enhanced jigsaw,
        breakable,
        pad at break*=1mm,
        colback=white,
        boxrule=0pt,
        frame hidden,
        borderline east={1.5mm}{-2mm}{green!10}]

        \Eproblemsolutionmark[#1]
        
        \begin{itshape}
            \hspace{3mm}
            #2
        \end{itshape}

    \end{tcolorbox}
}

\newcommand{\Eproblemsolution}[2][پاسخ.]{
    \Esolution[#1]{#2}
}

% DMMproblem solution
\newcommand{\DMMproblemsolution}[2][پاسخ.]{
    \Eproblemsolution[#1]{#2}
}

% exercise styling
%--------------------------------------------------------------------------
\newcounter{exercise}[chapter]

\newcommand{\exercise}[0]{

    \refstepcounter{exercise}\par\medskip{~\theexercise}.
}

% extra styling
%--------------------------------------------------------------------------
\newenvironment{extra}[2][images/mindset3.png]
{\begin{tcolorbox}[
    enhanced jigsaw,
    breakable,
    pad at break*=1mm,
    colback=extrayellow!25,
    colframe=extraorange!65]
    \begin{flushleft}
        \vspace{-1.1cm}
        \hspace*{-1.5in}\includegraphics[width=0.15\linewidth]{#1}
    \end{flushleft}
    \begin{center}
        \vspace{-0.8cm}
        \textbf{\color{extraorange}{#2}}
    \end{center}
    \hspace{3mm}
}
{\end{tcolorbox}}