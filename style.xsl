<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <!-- 根节点：badges -->
  <xsl:template match="/badges">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Scout Badges</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 16px; }
          h1, h2 { text-align: center; }
          table { border-collapse: collapse; width: 100%; max-width: 960px; margin: 12px auto; }
          th, td { border: 1px solid #ddd; text-align: left; padding: 6px 8px; }
          th { background: #f5f5f5; }
          .type-label { margin-top: 18px; }
        </style>
      </head>
      <body>
        <h1>Scout Badges</h1>

        <!-- Activity badges -->
        <h2 class="type-label">Activity Badges</h2>
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Description</th>
              <th>Beaver</th>
              <th>Cub</th>
              <th>Scout</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="badge[@type='activity']">
              <xsl:sort order="ascending" select="name"/>
            </xsl:apply-templates>
          </tbody>
        </table>

        <!-- Development badges -->
        <h2 class="type-label">Development Badges</h2>
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Description</th>
              <th>Beaver</th>
              <th>Cub</th>
              <th>Scout</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="badge[@type='development']">
              <xsl:sort order="ascending" select="name"/>
            </xsl:apply-templates>
          </tbody>
        </table>

        <p style="text-align:center;margin-top:18px;">
          <i>© College Productions Ltd</i>
        </p>
      </body>
    </html>
  </xsl:template>

  <!-- 每个 badge 生成一行 -->
  <xsl:template match="badge">
    <tr>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="description"/></td>
      <td>
        <xsl:value-of select="levels/availability[@level='beaver']"/>
      </td>
      <td>
        <xsl:value-of select="levels/availability[@level='cub']"/>
      </td>
      <td>
        <xsl:value-of select="levels/availability[@level='scout']"/>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
