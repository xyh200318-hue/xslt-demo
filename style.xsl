<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <xsl:template match="badges">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Activity Badges</title>
        <style>
          body { font-family: system-ui, sans-serif; margin: 20px; }
          h1   { text-align: center; margin-bottom: 16px; }
          table { width: 100%; border-collapse: collapse; }
          th, td { border: 1px solid #d1d5db; padding: 8px; text-align: left; }
          th     { background: #e5e7eb; font-weight: 600; }
          ul     { margin: 0; padding-left: 18px; }
          li     { margin-bottom: 2px; }
          .footer { text-align: center; margin-top: 20px; font-size: 0.86rem; color: #6b7280; }
        </style>
      </head>
      <body>
        <h1>Activity Badges</h1>
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Description</th>
              <th>Levels</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="badge[@type='activity']">
              <xsl:sort order="ascending" select="name"/>
            </xsl:apply-templates>
          </tbody>
        </table>
        <p class="footer"><i>&#xA9; College Productions Ltd</i></p>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="badge">
    <tr>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="description"/></td>
      <td>
        <xsl:apply-templates select="levels"/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="levels">
    <ul>
      <xsl:apply-templates select="availability"/>
    </ul>
  </xsl:template>

  <xsl:template match="availability">
    <li>
      <xsl:choose>
        <xsl:when test="@level = 'beaver'">Beaver: </xsl:when>
        <xsl:when test="@level = 'scout'">Scout: </xsl:when>
        <xsl:otherwise>Cub: </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="."/>
    </li>
  </xsl:template>

</xsl:stylesheet>
