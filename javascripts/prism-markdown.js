(function() {
  Prism.languages.markdown = {
    header: /(#+)(.*)/,
    "md-link": /\[([^\[]+)\]\(([^\)]+)\)/,
    bold: /(\*\*|__)(.*?)\1/,
    em: /(\*|_)(.*?)\1/,
    bullet: /^([*+-]|(\\d+\\.))\\s+/g
  };

}).call(this);
