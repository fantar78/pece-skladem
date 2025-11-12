<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="cs">
      <head>
        <meta charset="UTF-8"/>
        <title><xsl:value-of select="/export/header/title"/></title>

        <!-- Microsoft Clarity tracking -->
        <script type="text/javascript">
          (function(c,l,a,r,i,t,y){
              c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
              t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
              y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
          })(window, document, "clarity", "script", "u4tn7t16xd");
        </script>

        <style>
          body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            color: #333;
            margin: 40px;
            text-align: center;
          }
          h1 {
            color: #0074d9;
            text-align: center;
            margin-bottom: 25px;
          }
          table {
            border-collapse: collapse;
            width: 100%;
            background: white;
            margin: 0 auto;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
          }
          th, td {
            border: 1px solid #ccc;
            padding: 8px 10px;
            text-align: center;
            vertical-align: middle;
          }
          th {
            background: #eaeaea;
            font-weight: bold;
          }
          tr:nth-child(even) {
            background: #f9f9f9;
          }
          td.numeric {
            text-align: center;
          }
          a {
            color: #0074d9;
            text-decoration: underline;
          }
          a:hover {
            color: #005299;
          }
        </style>
      </head>

      <body>
        <h1><xsl:value-of select="/export/header/title"/></h1>

        <table>
          <thead>
            <tr>
              <xsl:for-each select="/export/header/structure/field">
                <th><xsl:value-of select="title"/></th>
              </xsl:for-each>
            </tr>
          </thead>

          <tbody>
            <xsl:for-each select="/export/body/rows/row">
              <tr>
                <td><xsl:value-of select="typ"/></td>
                <td class="numeric"><xsl:value-of select="skladova_zasoba"/></td>
                <td><xsl:value-of select="skladove_cislo"/></td>
                <td>
                  <a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="odkaz/@url"/>
                    </xsl:attribute>
                    <xsl:value-of select="odkaz"/>
                  </a>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
