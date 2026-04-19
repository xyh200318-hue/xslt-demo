<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <xsl:template match="badges">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Activity Badges</title>
        <style>
          body { font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif; margin: 20px; background: #f5f7fa; }
          h1   { text-align: center; margin-bottom: 24px; }
          .badge-list { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 18px; }
          .badge-card  { background: #ffffff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 8px rgba(0,0,0,0.06); }
          .badge-card h2 { margin: 0 0 8px; font-size: 1.1rem; }
          .badge-card p  { margin: 4px 0; font-size: 0.92rem; }
          .badge-levels { margin-top: 8px; display: flex; flex-wrap: wrap; gap: 8px; }
          .badge-level-tag { padding: 4px 10px; border-radius: 999px; font-size: 0.82rem; font-weight: 600; }
          .badge-level-tag.beaver { background: #e0f2fe; color: #0369a1; }
          .badge-level-tag.scout  { background: #fef9c3; color: #a16207; }
          .badge-level-tag.cub    { background: #fce7f3; color: #9d174d; }
          .footer { text-align: center; margin-top: 28px; font-size: 0.85rem; color: #64748b; }
        </style>
      </head>
      <body>
        <h1>Activity Badges</h1>
        <div class="badge-list">
          <xsl:apply-templates select="badge[@type='activity']">
            <xsl:sort order="ascending" select="name"/>
          </xsl:apply-templates>
        </div>
        <p class="footer"><i>&#xA9; College Productions Ltd</i></p>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="badge">
    <div class="badge-card">
      <h2><xsl:value-of select="name"/></h2>
      <p><xsl:value-of select="description"/></p>
      <div class="badge-levels">
        <xsl:apply-templates select="levels"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="levels">
    <xsl:apply-templates select="availability"/>
  </xsl:template>

  <xsl:template match="availability">
    <!-- 每个级别以“标签”形式展示 -->
    <span>
      <xsl:attribute name="class">
        badge-level-tag
        <xsl:choose>
          <xsl:when test="@level = 'beaver'">beaver</xsl:when>
          <xsl:when test="@level = 'scout'">scout</xsl:when>
          <xsl:otherwise>cub</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="@level = 'beaver'">Beaver: </xsl:when>
        <xsl:when test="@level = 'scout'">Scout: </xsl:when>
        <xsl:otherwise>Cub: </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="."/>
    </span>
  </xsl:template>

</xsl:stylesheet>
