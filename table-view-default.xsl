<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="cs">
      <head>
        <meta charset="UTF-8"/>
        <title><xsl:value-of select="/export/header/title"/></title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            color: #333;
            margin: 40px;
          }
          h1 {
            color: #0074d9;
            text-align: center;
            margin-bottom: 20px;
          }
          table {
            border-collapse: collapse;
            width: 100%;
            background: white;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
          }
          th, td {
            border: 1px solid #ccc;
            padding: 8px 10px;
            text-align: left;
          }
          th {
            background: #eaeaea;
          }
          tr:nth-child(even) {
            background: #f9f9f9;
          }
          td.volne-negative {
            color: red;
            font-weight: bold;
            text-align: right;
          }
          td.volne-positive {
            color: green;
            text-align: right;
          }
          td.volne-zero {
            color: #555;
            text-align: right;
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
                <td><xsl:value-of select="kod_zbozi"/></td>
                <td><xsl:value-of select="interni_kod"/></td>
                <td><xsl:value-of select="nazev"/></td>
                <xsl:variable name="skladem" select="number(skladem)"/>
                <td>
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="$skladem &lt; 0">volne-negative</xsl:when>
                      <xsl:when test="$skladem = 0">volne-zero</xsl:when>
                      <xsl:otherwise>volne-positive</xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:value-of select="skladem"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
