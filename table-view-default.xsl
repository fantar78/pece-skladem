<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title><xsl:value-of select="/export/header/title"/></title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background: #f8f8f8;
            color: #333;
            margin: 30px;
          }
          h1 {
            color: #444;
            text-align: center;
          }
          table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background: #fff;
          }
          th, td {
            border: 1px solid #ccc;
            padding: 6px 10px;
            text-align: left;
          }
          th {
            background: #eee;
            font-weight: bold;
          }
          tr:nth-child(even) {
            background: #f6f6f6;
          }
          td.volne-negative {
            color: red;
            font-weight: bold;
          }
          td.volne-positive {
            color: green;
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
                <xsl:variable name="volne" select="number(volne)"/>
                <td>
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="$volne &lt; 0">volne-negative</xsl:when>
                      <xsl:otherwise>volne-positive</xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:value-of select="volne"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
