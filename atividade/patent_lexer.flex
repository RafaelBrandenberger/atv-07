%%
%public
%class PatentLexer
%unicode
%line
%column
%type int
%{
  String number = null;
  String title = null;
  String publicationDate = null;
  String abstractText = "";
  StringBuilder claims = new StringBuilder();

  boolean readingAbstract = false;
  boolean readingClaims = false;
%}
%states ABSTRACT, CLAIMS

%%

<YYINITIAL> {
  "United States Patent: " [0-9]+ {
    number = yytext().replaceAll("\\D+", "");
  }

  "<b>Publication Date:</b>"[ \t]*[^<\n]+ {
    String[] parts = yytext().split("</b>");
    if (parts.length > 1) {
      publicationDate = parts[1].replaceAll("<.*?>", "").trim();
    } else {
      publicationDate = yytext().replaceAll("<[^>]+>", "").replace("Publication Date:", "").trim();
    }
  }

  "<font size=+1><b>"([^<]+)"</b></font>" {
    title = yytext().replaceAll("<[^>]+>", "");
  }

  "<center><b>Abstract</b></center>" {
    yybegin(ABSTRACT);
    abstractText = "";
  }

  "<center><b>Claims</b></center>" {
    yybegin(CLAIMS);
    claims = new StringBuilder();
  }
}

<ABSTRACT> {
  "</blockquote>" { yybegin(YYINITIAL); readingAbstract = false; }
  "<blockquote>"  { readingAbstract = true; }
  [^<]+           { if (readingAbstract) abstractText += yytext(); }
  "<"[^>]*">"     { }
}

<CLAIMS> {
  "</blockquote>" { yybegin(YYINITIAL); readingClaims = false; }
  "<blockquote>"  { readingClaims = true; }
  [^<]+           { if (readingClaims) claims.append(yytext()); }
  "<"[^>]*">"     { }
}

<<EOF>> { return YYEOF; }

<YYINITIAL> {
  [ \t\n\r]+ { }
  .         { }
}