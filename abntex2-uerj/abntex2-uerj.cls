%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para a Universidade do Estado do Rio de Janeiro
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status 'maintained'.
%% 
%% The Current Maintainer of this work is Rodrigo Azevedo and Yuri Pereira
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%
%% Work modified from abntex2-unisul.cls by Jonathan Henrique de Souza 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abntex2-uerj}[27/12/2016 v1.0 Modelo da Universidade do Estado do Rio de Janeiro baseado em abntex2]

% Repassa os parâmetros ao abntex2
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{abntex2}
}

\PassOptionsToClass{
    chapter=TITLE,
    section=TITLE,
    12pt, % Tamanho da fonte
    openright, % Capítulos começam em pág. ímpar (insere página vazia caso preciso)
    oneside, % Para impressão somente verso. Oposto a impressão em verso e anverso
    a4paper, % Tamanho do papel
    english, % Idioma adicional para hifenização
    french, % Idioma adicional para hifenização
    spanish, % Idioma adicional para hifenização
    brazil % o último idioma é o principal do documento
}{abntex2}

\ProcessOptions\relax
\LoadClass{abntex2}

% Pacotes
%% Sumário
\RequirePackage{tocloft}

%% Codificação
\RequirePackage[utf8]{inputenc} % Codificação de entrada
\RequirePackage[T1]{fontenc} % Codificação de saída

%% Fonte
\RequirePackage{times} % Times New Roman
\renewcommand{\familydefault}{\sfdefault} % Seta fonte default

\RequirePackage{lastpage} % Usado pela Ficha catalográfica
\RequirePackage{indentfirst} % Indenta o primeiro parágrafo de cada seção.
\RequirePackage{color} % Controle das cores
\RequirePackage{microtype} % Para melhorias de justificação
\RequirePackage{lscape} % Permite a criação de conteúdo em modo paisagem
\RequirePackage{hyperref} % Criação de links
\RequirePackage{etoolbox}

%% Cabeçalho padrao
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{abntheadings}{}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{abntheadings}{0pt}{\normalrulethickness}

%% Cabeçalho do inicio do capitulo
\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\ABNTEXfontereduzida\thepage}

%% Tabelas
\RequirePackage{multirow}

%% Sumário
\RequirePackage{textcase}

%% Imagens
\RequirePackage{graphicx} % Inclusão de gráficos
\graphicspath{{./img//}} % Diretório das imagens

%% Tamanho e alinhamento das legendas
\RequirePackage[singlelinecheck=false,justification=justified,font=footnotesize]{caption}

%% Citações
\RequirePackage[hyphenbreaks]{breakurl}
\RequirePackage[alf,abnt-emphasize=bf]{abntex2cite}

% Estilos
%% Membros da banca
\newcommand{\membrobancaA}{}
\newcommand{\membrobancaB}{}
\newcommand{\membrobancaC}{}

\providecommand{\imprimirmembrobancaA}{}
\providecommand{\imprimirmembrobancaAinst}{}
\renewcommand{\membrobancaA}[2][\imprimirinstituicao]{\renewcommand{\imprimirmembrobancaA}{#2}\renewcommand{\imprimirmembrobancaAinst}{#1}}

\providecommand{\imprimirmembrobancaB}{}
\providecommand{\imprimirmembrobancaBinst}{}
\renewcommand{\membrobancaB}[2][\imprimirinstituicao]{\renewcommand{\imprimirmembrobancaB}{#2}\renewcommand{\imprimirmembrobancaBinst}{#1}}

\providecommand{\imprimirmembrobancaC}{}
\providecommand{\imprimirmembrobancaCinst}{}
\renewcommand{\membrobancaC}[2][\imprimirinstituicao]{\renewcommand{\imprimirmembrobancaC}{#2}\renewcommand{\imprimirmembrobancaCinst}{#1}}

\newcommand{\imprimirmeOrientadorinst}{\imprimirinstituicao}
\newcommand{\imprimirmeCoorientadorinst}{\imprimirinstituicao}

%% Natureza do trabalho
\providecommand{\imprimirnaturezatrabalho}{}
\newcommand{\naturezatrabalho}[1]{
    \renewcommand{\imprimirnaturezatrabalho}{#1}
}

%% Redefinir resumo
\renewenvironment{resumo}[1][\resumoname]{%
   \pretextualchapter{#1}
  }{\PRIVATEclearpageifneeded}

\newcommand{\imprimircatalogacao}{%
	\noindent
	\ABNTEXchapterfont UNIVERSIDADE DO ESTADO DO RIO DE JANEIRO\\
	\ABNTEXchapterfont INSTITUTO POLITÉCNICO\\
	\ABNTEXchapterfont CURSO DE ENGENHARIA DE COMPUTAÇÃO\\\\
	
	\noindent
	Reitor: Ruy Garcia Marques\\
	Vice-Reitor: Maria Georgina Muniz Washington\\
	Diretor do Instituto Politécnico: Ricardo Carvalho de Barros\\
	Coordenador de Curso: José Humberto Zani\\
	
	\noindent
	Banca Avaliadora Composta por: \imprimirorientador~(Orientador)\\
	Prof. Dr. Professor 1\\
	Prof. Dr. Professor 2
	
	\begin{center}
		CATALOGAÇÃO NA FONTE \\ UERJ/REDE SIRIUS/BIBLIOTECA CTC/E
		\begin{tikzpicture}[remember picture, overlay]
			\draw[line width = 1pt] ($(current page.north west) + (55mm, -111.5mm)$) rectangle ($(current page.south east) + (-35.5mm,80mm)$);
		\end{tikzpicture}
	\end{center}
	
	Endereço: UERJ - IPRJ \\
			  Rua Bonfim, 25 - Prédio 5, Vila Amélia.\\
			  CEP 28625-570 - Nova Friburgo - RJ - Brasil.\\

	\noindent
	Este trabalho nos termos da legislação que resguarda os direitos autorais é considerado de propriedade da Universidade do Estado do Rio de Janeiro (UERJ). É permitida a transcrição parcial de partes do trabalho, ou mencioná-lo, para comentários e citações, desde que sem propósitos comerciais e que seja feita a referência bibliográfica completa.
	
	\begin{flushright}
		\assinatura{\imprimirautor}
	\end{flushright}
}

\newcommand{\imprimirfolhaaprovacao}{%
	\begin{folhadeaprovacao}
		\begin{center}
			{\ABNTEXchapterfont\large{\imprimirautor}}\\[1cm]
			\vspace{2cm}
			{\ABNTEXchapterfont\Large\bfseries\imprimirtitulo}
		\end{center}		
		\vspace{1cm}
		\hspace{.45\textwidth}
		\begin{minipage}{.5\textwidth}
			\imprimirpreambulo
		\end{minipage}%
		\\\\\\\\
		\vspace{1cm}
		Aprovado em \imprimirdata.\\
		\vspace{1.5cm}
		Banca examinadora:
		
		\assinatura{\imprimirorientador\\Instituto Politécnico - UERJ}
		\assinatura{Professor da banca 1\\Instituto Politécnico - UERJ}
		\assinatura{Professor da banca 2\\Instituto Politécnico - UERJ}
		\begin{center}
			\vfill
			{\large\imprimirlocal}
			\par
			{\large\the\year}
		\end{center}
		
	\end{folhadeaprovacao}
}

\renewcommand{\imprimircapa}{%
	\begin{tikzpicture}[remember picture, overlay]
		\draw[line width = 4pt] ($(current page.north west) + (20mm, -20mm)$) rectangle ($(current page.south east) + (-10mm,10mm)$);
		\draw[line width = 1pt] ($(current page.north west) + (21mm,-21mm)$) rectangle ($(current page.south east) + (-11.5mm,11.5mm)$);
	\end{tikzpicture}
	\begin{capa}
		\begin{minipage}[r]{0.1\linewidth}
			\includegraphics[width=1.5\linewidth]{uerj} 
		\end{minipage}%
		\begin{minipage}[c]{0.7\linewidth}
			\begin{center}
				\ABNTEXchapterfont \textbf{UNIVERSIDADE DO ESTADO DO \\ RIO DE JANEIRO}\\
				\noindent\rule{7cm}{0.4pt}\\
				\ABNTEXchapterfont \textbf{INSTITUTO POLITÉCNICO \\ GRADUAÇÃO EM ENGENHARIA \\DE COMPUTAÇÃO}\\
			\end{center}
		\end{minipage}%
		\begin{minipage}[c]{0.1\linewidth}
			\includegraphics[width=1.5\linewidth]{iprj} 
		\end{minipage}
		
		\vspace*{4.5cm}
		\center
		\textbf{\ABNTEXchapterfont\large\imprimirautor}
		\vspace*{3cm}
		\begin{center}
			\ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo
		\end{center}
		\vfill
		\textbf{
			\large\imprimirlocal
			\\	
			\large \the\year
		}
		\vspace*{1cm}
	\end{capa}
}


\makeatletter
\renewcommand{\folhaderostocontent}{
	\begin{tikzpicture}[remember picture, overlay]
	\draw[line width = 4pt] ($(current page.north west) + (20mm, -20mm)$) rectangle ($(current page.south east) + (-10mm,10mm)$);
	\draw[line width = 1pt] ($(current page.north west) + (21mm,-21mm)$) rectangle ($(current page.south east) + (-11.5mm,11.5mm)$);
	\end{tikzpicture}
	
	\begin{minipage}[r]{0.1\linewidth}
		\includegraphics[width=1.5\linewidth]{uerj} 
	\end{minipage}%
	\begin{minipage}[c]{0.7\linewidth}
		\begin{center}
			\ABNTEXchapterfont \textbf{UNIVERSIDADE DO ESTADO DO \\ RIO DE JANEIRO}\\
			\noindent\rule{7cm}{0.4pt}\\
			\ABNTEXchapterfont \textbf{INSTITUTO POLITÉCNICO \\ GRADUAÇÃO EM ENGENHARIA \\DE COMPUTAÇÃO}\\
		\end{center}
	\end{minipage}%
	\begin{minipage}[c]{0.1\linewidth}
		\includegraphics[width=1.5\linewidth]{iprj} 
	\end{minipage}
	\vspace*{2cm}
	\begin{center}
		{\ABNTEXchapterfont\large\imprimirautor}
		\vspace*{\fill}\vspace*{\fill}
		\begin{center}
			\ABNTEXchapterfont\bfseries\Large\imprimirtitulo
		\end{center}
		\vspace*{\fill}
		\abntex@ifnotempty{\imprimirpreambulo}{%
			\hspace{.45\textwidth}
			\begin{minipage}{.5\textwidth}
				\SingleSpacing
				\imprimirpreambulo
			\end{minipage}%
			\vspace*{2cm}
			\vspace*{\fill}
		}%
		{\abntex@ifnotempty{\imprimirinstituicao}{\imprimirinstituicao
				\vspace*{\fill}}}
		{\large\imprimirorientadorRotulo~\imprimirorientador\par}
		\abntex@ifnotempty{\imprimircoorientador}{%
			{\large\imprimircoorientadorRotulo~\imprimircoorientador}%
		}%
		\vspace*{\fill}
		{\large\imprimirlocal}
		\par
		{\large\the\year}
		\vspace*{1cm}
	\end{center}
}
\makeatother

%% Redefinir dedicatória
\renewenvironment{dedicatoria}[1][]
{
        \ifthenelse{\equal{#1}{}}{
                \PRIVATEbookmarkthis{\dedicatorianame}
        }{\preamblealchapter{#1}}

        \vspace*{\fill}
}
{

}

\renewenvironment{epigrafe}[1][]
{
        \ifthenelse{\equal{#1}{}}{
                \PRIVATEbookmarkthis{\epigraphname}
        }{\pretextualchapter{#1}}

        \vspace*{\fill}
}
{

}

%% Comando para inserir sigla
\newcommand{\sigla}[2][]{
    \item[#1] \textit{#2}
}

%% Redefinição da formatação do \chapter
\renewcommand{\ABNTEXchapterfont}{\normalfont\fontseries{b}\selectfont}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}
\renewcommand{\ABNTEXpartfont}{\fontseries{b}\selectfont\selectfont}
\renewcommand{\ABNTEXpartfontsize}{\normalsize}
\renewcommand{\ABNTEXsectionfont}{\normalfont\selectfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsectionfont}{\normalfont\fontseries{b}\selectfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsubsectionfont}{\normalfont\selectfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont\itshape\selectfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

%% Redefinição da formatação de Parágrafos 
\setlength{\parindent}{1.3cm}
\setlength{\parskip}{0cm}

%% Sumário
\renewcommand*{\cftsectionfont}{\normalfont}
\renewcommand*{\cftsubsubsectionfont}{\normalfont}
\renewcommand*{\cftparagraphfont}{\normalfont\itshape}

%% Tornar as seções secundários com fonte em maiúscula
\makeatletter
\let\oldcontentsline\contentsline
\def\contentsline#1#2{%
  \expandafter\ifx\csname l@#1\endcsname\l@section
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
  {%
    \oldcontentsline{#1}{\MakeTextUppercase{#2}}%
  }{%
    \oldcontentsline{#1}{#2}%
  }%
}
\makeatother

%% Tornar a entrada "Referências" com fonte em maiúscula
\addto\captionsbrazil{
    \renewcommand{\bibname}{REFER\^ENCIAS}
}

% Legendas
\makeatletter
\patchcmd{\caption@@@make}
  {\ifcaption@star}
    {\ifcaption@star\small}
    {}{}
\makeatother
